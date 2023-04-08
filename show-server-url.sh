# get kubernetes cluster credential to access with kubectl
gcloud container clusters get-credentials luiz-gcp-gke-k8s --region=us-central1

# get kubernetes cluster node ip addresses
kubectl get nodes -o wide

# get application access URL
# NodeIP defined, thus the URL should be http://NODE_IP:31000
kubectl get nodes --no-headers -o wide | awk '{print $7}' | head -n 1
VOTE_URL=http://$(kubectl get nodes --no-headers -o wide | awk '{print $7}' | head -n 1):31000
echo "Vote URL is $VOTE_URL"

RESULT_URL=http://$(kubectl get nodes --no-headers -o wide | awk '{print $7}' | head -n 1):31001
echo "Result URL is $RESULT_URL"

# Show web page with command line (for test purpose only)
#curl $VOTE_URL
#curl $RESULT_URL
