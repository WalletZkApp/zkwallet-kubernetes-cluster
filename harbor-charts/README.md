# Scaleway Kubenertes Cluster for Harbor

## Export KUBECONFIG
```bash
export KUBECONFIG=/$HOME/Documents/WalletZkApp/Scaleway/kubeconfig-zkWallet-harbor.yaml
```

## Add namespace
```bash
kubectl apply -f harbor-charts/namespace-harbor.yaml
```

## Install Harbor
```bash
## If you update the username or password of registry, make sure use cli tool htpasswd to generate the bcrypt hash
    ## e.g. "htpasswd -nbBC10 $username $password"
helm install harbor . -n harbor \
 --set 'adminPassword=' \
 --set 'postgresql.auth.postgresPassword=' \
 --set 'externalDatabase.user=' \
 --set 'externalDatabase.password=' \
 --set 'redis.auth.password=' \
 --set 'registry.credentials.username=' \
 --set 'registry.credentials.password=' \
 --set 'registry.credentials.htpasswd='

htpasswd -nbBC10 $username $password