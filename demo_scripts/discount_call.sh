#!/bin/bash

for app in travels flights insurances cars hotels; do
  echo "📦 Calling from $app..."
  oc rsh -n travel-agency $(oc get pod -l app=$app -n travel-agency -o jsonpath='{.items[0].metadata.name}') \
    curl -s http://discounts.travel-agency.svc.cluster.local:8000/discounts/hello-from-$app
  echo ""
  sleep 2
done

