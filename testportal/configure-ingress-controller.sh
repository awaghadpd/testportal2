#!/bin/bash
NAMESPACE=$1
DEPLOYMENT=$2
INGRESS=$3
SERVICE=$4


# create namespace if doesn't exists
kubectl create namespace $NAMESPACE --dry-run=client -o yaml | kubectl apply -f -

# Create aks-helloworld and ingress-demo
kubectl apply -f $DEPLOYMENT --namespace $NAMESPACE
kubectl apply -f $INGRESS --namespace $NAMESPACE
kubectl apply -f $SERVICE --namespace $NAMESPACE
