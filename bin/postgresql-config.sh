#!/usr/bin/env bash
#set -x
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
cd "${DIR}/.."

. bin/.setup
# We're now in the repo root folder with environment and other common setup already done.

env | sort

docker compose config