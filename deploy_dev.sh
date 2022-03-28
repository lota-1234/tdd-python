#!/bin/bash

echo "-------------Start deploy in development server-------------"
pwd
cp -a dist/flaskr-1.0.0-py3-none-any.whl /var/lib/jenkins/workspace/test-deploy/
cd /var/lib/jenkins/workspace/test-deploy
python3.8 -m venv venv
. venv/bin/activate
pip3.8 install flaskr-1.0.0-py3-none-any.whl
export FLASK_APP=flaskr
echo "-------------Connecting deployment server successfully-------------"
echo "-------------Complete deploy-------------"