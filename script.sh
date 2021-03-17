kubectl delete -f test-adapter-deploy/testing-adapter.yaml
NAMESPACE=$(kubectl get namespaces | grep test | tail -1 | awk '{print $1}')
CLUSTER=$(kubectl -n $NAMESPACE get cbc | grep test | awk '{print $1}')
sed -i -e "s/namespace=.*/namespace=$NAMESPACE/g" -e "s/namespace: test.*/namespace: $NAMESPACE/g" -e "s/cluster=.*/cluster=$CLUSTER/g" test-adapter-deploy/testing-adapter.yaml
kubectl create -f test-adapter-deploy/testing-adapter.yaml
