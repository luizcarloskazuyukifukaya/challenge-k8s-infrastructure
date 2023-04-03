export GOOGLE_CLOUD_PROJECT="luiz-gcp-gke"
echo "current project is $GOOGLE_CLOUD_PROJECT"

gcloud resource-manager org-policies set-policy --project=$GOOGLE_CLOUD_PROJECT ./orgpolicy.json
