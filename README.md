# ext-snapshots-consul-0322

For snapshots 0322 - [consul](https://www.hashicorp.com/events/webinars/use-consul-to-securely-connect-to-any-service-jp)

## Provisioning AKS

use terraform configurations in `aks` directory.

## Deploy Consul

```console
kubectl create ns consul
helm install consul hashicorp/consul --version 0.40.0 -f dc1.yaml --namespace consul
```

## Deploy applications

```console
kubectl create ns app-consul
kubectl -n app-consul apply -f postgres.yaml
kubectl -n app-consul apply -f product-api.yaml
kubectl -n app-consul apply -f public-api.yaml
kubectl -n app-consul apply -f frontend.yaml
```

## Deploy intentions

```console
kubectl -n consul apply -f deny-all.yaml
kubectl -n consul apply -f service-to-service.yaml
```