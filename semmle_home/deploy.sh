#!/bin/bash

set -e

export SEMMLE_SERVER=http://localhost:8099

curl -u $SEMMLE_CREDENTIALS "${SEMMLE_SERVER}/manager/text/deploy?path=/$1&update=true&war=file:${SEMMLE_HOME}/target/semmle/dashboards/$1/deployed/$1.war"
