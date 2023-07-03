
```bash
helm repo add harbor https://charts.bitnami.com/bitnami

helm fetch harbor/harbor --untar

helm install harbor \
--set adminPassword= \
--set externalURL="https://core.harbor.walletzk.app"
--set ingress.core.hostname="core.harbor.walletzk.app" \
--set notary.hostname="notary.harbor.walletzk.app" \
--set nginx.tls.commonName="core.harbor.walletzk.app" \
--set registry.credentials.username= \
--set postgresql.auth.postgresPassword= \
--set redis.auth.password= \
```