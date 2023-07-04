# Scaleway Kubenertes Cluster for ZK KEYLESS WALLET

Export KUBECONFIG
```bash
export KUBECONFIG=/$HOME/Documents/WalletZkApp/Scaleway/kubeconfig-zkWallet-prd.yaml
```

## Setting up Traefik v2 and cert-manager on Kapsule
see also: https://www.scaleway.com/en/docs/tutorials/traefik-v2-cert-manager/

**Change the yaml:**
```yaml
deployment:
  kind: DaemonSet
ingressClass:
  enabled: true
  isDefaultClass: true
ports:
  web:
    hostPort: 80
  websecure:
    hostPort: 443
service:
  type: LoadBalancer
```

## Creating a wildcard DNS record and pointing your domain name to the IP address
``` bash
host zkwallet-prd.walletzk.app
```

## Deploying a test application
```bash
kubectl create -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/main/examples/ingress-resources/complete-example/cafe.yaml
```

## Setup Ingress configuration
```bash
kubectl create -f resources/ingress-zkwallet-prd.yml
```

You can now use curl to send a HTTP request this URL. Traefik 2 is working correctly with your wildcard DNS in plain, unencrypted HTTP (web unsecure).
```bash
curl zkwallet-prd.walletzk.app/tea
```

**Delete zkwallet-prd-ingress:**
```bash
kubectl delete ing default-ingress
```

## Deploying Cert Manager
Modify the default Traefik 2 daemonset running on Kapsule to do that, add --entrypoints.websecure.http.tls in the cmd stanza.

```bash
kubectl edit ds traefik -n kube-system
```

```bash
kubectl edit ds traefik -n kube-system
daemonset.apps/traefik edited
[]
        - --global.checknewversion
        - --global.sendanonymoususage
        - --entryPoints.traefik.address=:9000
        - --entryPoints.web.address=:8000
        - --entryPoints.websecure.address=:8443
        - --entrypoints.websecure.http.tls
        - --api.dashboard=true
        - --ping=true
        - --providers.kubernetescrd
        - --providers.kubernetesingress
[]
```

**Delete the existing Traefik pods in order to get the new arguments:**
```bash
kubectl -n kube-system delete pod -l app.kubernetes.io/name=traefik
```

**Install cert-manager:**
```bash
make install-cert-manager
```

Creating and using a Let’s Encrypt certificate to serve your website in HTTPS:
```bash
kubectl apply -f resources/cert-zkwallet-prd.yaml
```

Check Certificate issuing:
```bash
kubectl describe certificate -n default zkwallet-prd-cert
```

### Port forward traefik dashboard

```bash
kubectl port-forward -n kube-system $(kubectl get pods -n kube-system --selector "app.kubernetes.io/name=traefik" --output=name | head -n 1) 9000:9000
```

**TLS ingress:**
```bash
kubectl create -f resources/ingress-zkwallet-prd-tls.yml
```

Check your website is accessible in HTTPS:
```bash
curl https://zkwallet-prd.walletzk.app/tea
```

Check Certificates
```bash
kubectl get Issuers,ClusterIssuers,Certificates,CertificateRequests,Orders,Challenges --all-namespaces
```

## Install ArgoCD
Use EasyDeploy

Creating and using a Let’s Encrypt certificate to serve argocd in HTTPS:
```bash
kubectl apply -f resources/cert-argocd.yaml
```

Check Certificate issuing:
```bash
kubectl describe certificate -n argocd argocd-cert
```


**Ingress**:
```bash
kubectl create -f resources/ingress-argocd.yml
```

Make sure to update admin password for ArgoCd, see also ArgoCD commands

Bootstrap ArgoCd with applications
```bash
kubectl apply -f resources/application-bootstrap.yaml -n argocd
```

# Harbor
ArgoCd harbor with applications
```bash
kubectl apply -f resources/application-harbor.yaml -n argocd
```

# Sealed Secret
see also: https://blog.knoldus.com/how-to-encrypt-kubernetes-secrets-with-sealed-secrets/
```bash
kubectl apply -f resources/controller-sealed-secrets.yaml

kubeseal --fetch-cert > public-key-cert.pem

kubeseal --format=yaml --cert=public-key-cert.pem < resources/secret.yaml > harbor-charts/templates/sealed-secret.yaml

kubeseal --format=yaml --cert=public-key-cert.pem < secret.yaml > resources/sealed-secret-harbor.yaml -n harbor

kubectl apply -f resources/sealed-secret-harbor.yaml

echo -n 'input' | openssl base64
```

# Commands
```bash
export KUBECONFIG=/$HOME/Documents/WalletZkApp/Scaleway/kubeconfig-zkWallet-prd.yaml
```

## Kubectl
```bash
# List most resource types:
kubectl get all

# View the result of our ping command:
kubectl logs deployment.apps/tea

kubectl logs service/tea-svc

# First list all clusters contexts in your current kubeconfig:
kubectl config get-contexts -o name

kubectl apply -f controller-sealed-secrets.yaml

kubeseal --secret-file harbor-charts/secret.yaml --sealed-secret-file sealed-secret.yaml
```

## k9
```bash
# List all available CLI options
k9s help
# Get info about K9s runtime (logs, configs, etc..)
k9s info
# Run K9s in a given namespace.
k9s -n mycoolns
# Run K9s and launch in pod view via the pod command.
k9s -c pod
# Start K9s in a non default KubeConfig context
k9s --context coolCtx
# Start K9s in readonly mode - with all modification commands disabled
k9s --readonly
```

## ArgoCd
```bash
# Kubectl port-forwarding can also be used to connect to the API server without exposing the service
kubectl port-forward svc/argocd-server -n argocd 8080:443 
```

Login Using The CLI¶
The initial password for the admin account is auto-generated and stored as clear text in the field password in a secret named argocd-initial-admin-secret in your Argo CD installation namespace. You can simply retrieve this password using the argocd CLI:
```bash
argocd admin initial-password -n argocd
```

Using the username admin and the password from above, login to Argo CD's IP or hostname:
```bash
argocd login
```

Change the password using the command:
```bash
argocd account update-password
```