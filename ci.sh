#!/bin/bash

set -e

PROJECT=$1

odasa addSnapshot --default-build --default-date --project projects/${PROJECT}
odasa buildDashboard dashboards/${PROJECT}
./deploy.sh ${PROJECT}
