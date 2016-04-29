#!/bin/bash

DOCKER_BIN_PATH=$(type -a docker | head -n1 | awk '{print $3}')

if [ ! -x "$DOCKER_BIN_PATH" ]; then
  echo "Unable to find a docker executable, please install Docker"
  exit 1
fi

docker run -it --rm  -v /tmp/kodokojo/.m2:/root/.m2 -v "$PWD":/usr/src/mymaven -w /usr/src/mymaven maven:3-jdk-8 mvn install
rc=$?
if [[ $rc != 0 ]]; then
  exit $rc
fi


