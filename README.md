# multi-k8s
This is a FibCalculator example that consists of micro-services (client, server, worker, redis, postgres). It is a tutorial example to un micro-service application to Google Kubernetes Engine.

# Deployment to GKE
- Create a cluster on GKE with three nodes (or less)
- Configure gcloud cli in cloud console
```sh
  gcloud config set project multi-k8s-279620
  gcloud config set compute/zone europe-west2-c
  gcloud container clusters get-credentials multi-cluster
```
- Install helm into the cluster

```sh
  $ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
  $ chmod 700 get_helm.sh
  $ ./get_helm.sh
```
Ref: https://helm.sh/docs/intro/install/

- Configure the project in [Travis CI](http://travis-ci.org/).
- Push changes to master and monitor Travis build. The application should be deployed automatically.