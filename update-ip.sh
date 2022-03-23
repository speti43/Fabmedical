#!/bin/bash

# Public IP address
IP="138.91.166.243"

# Resource Group that contains AKS Node Pool
KUBERNETES_NODE_RG="MC_fabmedical-570611_fabmedical-570611_westus"

# Name to associate with public IP address
DNSNAME="fabmedical-570611-ingress"

# Get the resource-id of the public ip
PUBLICIPID=$(az network public-ip list --resource-group $KUBERNETES_NODE_RG --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv)

# Update public ip address with dns name
az network public-ip update --ids $PUBLICIPID --dns-name $DNSNAME