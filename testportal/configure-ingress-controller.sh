#!/bin/bash
NAMESPACE=$1
INGRESS=$2



# create namespace if doesn't exists
kubectl create namespace $NAMESPACE --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -f $INGRESS --namespace $NAMESPACE
kubectl apply -f deployment.yaml --namespace $NAMESPACE
kubectl apply -f service.yaml --namespace $NAMESPACE

