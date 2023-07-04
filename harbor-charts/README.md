
```bash
helm repo add harbor https://charts.bitnami.com/bitnami

helm fetch harbor/harbor --untar

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