.PHONY: install-argocd install-argocd-kustomization get-argocd-password proxy-argocd-ui check-argocd-ready

list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

get-argocd-password:
	kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2

check-argocd-ready:
	kubectl wait --for=condition=available deployment -l "app.kubernetes.io/name=argocd-server" -n argocd --timeout=300s

proxy-argocd-ui:
	kubectl port-forward svc/argocd-server -n argocd 8080:80


install-argocd-ingress:
	kubectl create -f resources/ingress-argocd.yml -n argocd

install-grafana-ingress:
	kubectl create -f resources/ingress-grafana.yaml -n monitoring

install-kibana-ingress:
	kubectl create -f resources/ingress-kibana.yaml -n elastic-stack

install-cert-manager:
	helm repo add jetstack https://charts.jetstack.io
	kubectl create namespace cert-manager
	kubectl label namespace cert-manager cert-manager.k8s.io/disable-validation=true
	kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.12.2/cert-manager.crds.yaml
	helm install cert-manager --namespace cert-manager --version v1.12.2 jetstack/cert-manager
	kubectl apply -f resources/letsencrypt-issuer.yaml