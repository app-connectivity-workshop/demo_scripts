oc rsh -n travel-agency $(oc get pod -l app=travels -n travel-agency -o jsonpath='{.items[0].metadata.name}') \
  curl http://discounts.travel-agency.svc.cluster.local:8000/discounts/hello-from-travels

oc rsh -n travel-agency $(oc get pod -l app=flights -n travel-agency -o jsonpath='{.items[0].metadata.name}') \
  curl http://discounts.travel-agency.svc.cluster.local:8000/discounts/hello-from-flights

oc rsh -n travel-agency $(oc get pod -l app=insurances -n travel-agency -o jsonpath='{.items[0].metadata.name}') \
  curl http://discounts.travel-agency.svc.cluster.local:8000/discounts/hello-from-insurances

oc rsh -n travel-agency $(oc get pod -l app=cars -n travel-agency -o jsonpath='{.items[0].metadata.name}') \
  curl http://discounts.travel-agency.svc.cluster.local:8000/discounts/hello-from-cars

oc rsh -n travel-agency $(oc get pod -l app=hotels -n travel-agency -o jsonpath='{.items[0].metadata.name}') \
  curl http://discounts.travel-agency.svc.cluster.local:8000/discounts/hello-from-hotels