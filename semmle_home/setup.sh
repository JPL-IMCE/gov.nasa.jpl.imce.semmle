#!/bin/echo Please source this file rather than running it:

if [ -z "$1" ]
then
  echo "Usage: . $0 <SEMMLE_DIST>"
else
  export SEMMLE_DIST=$1
  export SEMMLE_LICENSE_DIR=${SEMMLE_DIST}/license
  export SEMMLE_HOME=`pwd`/semmle_home
  export SEMMLE_DATA=`pwd`/target/semmle

  mkdir -p $SEMMLE_DATA

  env | sort | grep SEMMLE

  . ${SEMMLE_DIST}/setup.sh
fi

