#!/bin/bash

# get location of script
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

#
if [ -z "$1" ] ; then
  docker-compose -f "${DIR}/docker-compose.yml" -p "vpnc-dockerized" build
  docker-compose -f "${DIR}/docker-compose.yml" -p "vpnc-dockerized" create
else
  docker-compose -f $1 -p $2 build
  docker-compose -f $1 -p $2 create
fi

