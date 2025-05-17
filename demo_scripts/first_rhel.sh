#!/bin/bash
export SKUPPER_PLATFORM=podman
skupper site create rhel
sleep 5

skupper connector create mysqldb 3306 --host 127.0.0.1 -r appconn
