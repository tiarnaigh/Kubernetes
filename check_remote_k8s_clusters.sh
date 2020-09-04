#!/bin/bash
# Loop through each remote cluster and valudate state of deployed apps
# Note: This assumed you have a copy of the kubeconfig for each remote k8s cluster stored locally under appname_kubeconfigs directory
#
#
for i in dev qa stg ;
 do echo "#### $i ####";
    kubectl --kubeconfig=appname_kubeconfigs/$i cluster-info;
    echo "  ";
    kubectl --kubeconfig=appname_kubeconfigs/$i get pods -n app;
    echo "  ";
    curl -k https://$i-eastus-appname.domainname.int/appname/api/actuator/health;
    echo "  ";
    curl -k https://$i-eastus-appname.domainname.int/static/css/main.0216b834.chunk.css;
    echo "  ";
    echo "  ";
  done
