#!/usr/bin/env bash
set -x
set -e
set -u
set -o pipefail
set -o noclobber
shopt -s nullglob

# stack overflow #59895
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"


${DIR}/hapi-stop.sh
rm -rf "${DIR}/../hapi/logs"
rm -rf "${DIR}/../hapi/target"
rm -rf "${DIR}/../setup/.venv"
rm -rf "${DIR}/../setup/docker_container"
rm -rf "${DIR}/../setup/docker_container/postgresql"
rm -rf ${DIR}/../hapi/loaders/*/*loaded.txt
rm -rf ${DIR}/../hapi/loaders/*/*loading.txt