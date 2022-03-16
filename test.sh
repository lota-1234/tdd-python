#!/bin/bash

PYTHON_PATH=/usr/bin/python3


ENV_NAME="testenv"
virtualenv -p $PYTHON_PATH $ENV_NAME
activate="`pwd`/$ENV_NAME/bin/activate"

if [ ! -f "$activate" ]
then
    echo "ERROR: activate not found at $activate"
    return 1
fi

source "$activate"
virtualenv --version

