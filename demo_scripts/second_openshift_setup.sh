#!/bin/bash

oc apply -f https://raw.githubusercontent.com/app-connectivity-workshop/refs/heads/main/demo_scripts/openshift_site.yaml
echo "Waiting 50 seconds for site to be up"
sleep 50

oc apply -f https://raw.githubusercontent.com/app-connectivity-workshop/refs/heads/main/demo_scripts/listener.yaml
echo "Waiting 20 seconds for listener to be created"
sleep 20

oc apply -f https://raw.githubusercontent.com/app-connectivity-workshop/refs/heads/main/demo_scripts/grant.yaml
echo "Waiting 20 seconds for grant to be created"
sleep 20

oc apply -f https://raw.githubusercontent.com/app-connectivity-workshop/scripts/refs/heads/main/m1/network_console_deploy.yaml -n travel-db
echo "Waiting 20 seconds for console to be created"
sleep 20

curl -s https://raw.githubusercontent.com/app-connectivity-workshop/scripts/refs/heads/main/m1/convert_grant_token.sh | bash > summit_token.yaml
echo "Waiting 20 seconds for token to be created"
sleep 20

oc label namespace travel-agency istio-injection=enabled --overwrite=true
echo "Waiting 20 seconds for namespace to be created"
sleep 20




oc get deployments -n travel-agency -o name \
  | xargs -I{} oc rollout -n travel-agency restart {}

echo "Waiting 10 seconds for deployments to be rolled out"
sleep 10



watch oc get pods -n travel-agency

echo "Press ctrl+c to if you see 2 pods per deployment"


