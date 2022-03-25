oc apply -f https://raw.githubusercontent.com/tektoncd/catalog/main/task/git-clone/0.5/git-clone.yaml
oc apply -f https://raw.githubusercontent.com/tektoncd/catalog/main/task/docker-build/0.1/docker-build.yaml
oc apply -f https://raw.githubusercontent.com/tektoncd/catalog/main/task/buildah/0.3/buildah.yaml