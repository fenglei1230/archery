#!/bin/bash
#source ./venv/bin/activate
nohup python3 manage.py runserver 10.35.1.39:9123  --insecure  > /opt/archery/insecure_err.log &
nohup python3 manage.py qcluster &
