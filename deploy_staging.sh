#!/bin/bash

REMOTE_USER=ubuntu
REMOTE_MACHINE_IP= (build threatidr)
DEPLOYMENT_DIR=/opt/threatidr/`date +%F_%H.%M.%S`
DEPLOYMENT_SOFT_LINK=/opt/threatidr/latest

ssh ${REMOTE_USER}@${REMOTE_MACHINE_IP} "mkdir -p ${DEPLOYMENT_DIR}"
scp * ${REMOTE_USER}@${REMOTE_MACHINE_IP}:${DEPLOYMENT_DIR}
