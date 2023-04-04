echo "This will create a Service Account and the required roles for the target
cluster so the integration with Jenkins can be realized."

kubectl -n kube-system create serviceaccount helm-tiller

kubectl create clusterrolebinding helm-tiller --clusterrole cluster-admin --serviceaccount=kube-system:helm-tiller

