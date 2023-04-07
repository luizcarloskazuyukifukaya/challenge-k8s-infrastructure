# kubernetes cluster for production details

This document includes details related to the production infrastructure based on Google Kubernetes Engine (GKE).

Jenkins Pipeline to build the kubernetes cluster is configured to be executed every 30 minutes if there is a change in the GitHub. Again, at this point, due to the demo, the GKE deployment is not considering the lifecycle of the application that is deployed on the kubernetes itself. In the real operation, it is important to consider how the approval process should be implemented so there is not incident where the kubernetes cluster is destroyed while still the application is running.

# Provision a kubernetes cluster for production

## Reference Materials
[Provision a GKE Cluster (Google Cloud)](https://developer.hashicorp.com/terraform/tutorials/kubernetes/gke?utm_medium=WEB_IO&in=terraform%2Fkubernetes&utm_offer=ARTICLE_PAGE&utm_source=WEBSITE&utm_content=DOCS)

## Connecting to kubernetes API Server

```shell
gcloud container clusters get-credentials CLUSTER_NAME --region=REGION_NAME
```

# Google Cloud Project Configuration

## Change GCP organization policy enforcements
 
1. Read the details from the oficial document provided from Google

   Reference: https://cloud.google.com/load-balancing/docs/org-policy-constraints. <br/>
   It is strongly recommended to enforce this Organization Policy so the Global Load Balancer creation is restricted/controlled.    For the sake of the demo, we will disable the constraints/compute.restrictLoadBalancerCreationForTypes, but please follow the guidance on how to manage the creation of the Global Load Balancer appropriatly.

2. Disable Organization Policy (Disable global load balancing) for the target project

    ```shell
    gcloud resource-manager org-policies set-policy  \
     --project=$GOOGLE_CLOUD_PROJECT ./jenkins/orgpolicy.json
    ```
      
    (note) You can execute the shell script (./set-orgpolicy.sh) to perform the above configuration.
