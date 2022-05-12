export CONTAINER_REGISTRY_SERVER='https://quay.io'
export CONTAINER_REGISTRY_USER='*******'
export CONTAINER_REGISTRY_PASSWORD='*********'
kubectl create secret -n itlmc-dev docker-registry quayio-password --docker-server=$CONTAINER_REGISTRY_SERVER --docker-username=$CONTAINER_REGISTRY_USER --docker-password=$CONTAINER_REGISTRY_PASSWORD

kubectl create sa itlmc-build-bot
kubectl patch serviceaccount itlmc-build-bot -p '{"secrets": [{"name": "quayio-password"}]}'
kubectl patch serviceaccount default -p '{"imagePullSecrets": [{"name": "quayio-password"}]}'
kubectl get sa -n itlmc-dev itlmc-build-bot -o yaml
oc policy add-role-to-user cluster-admin -z itlmc-build-bot