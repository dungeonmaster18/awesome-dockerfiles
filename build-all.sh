#!/usr/bin/env bash
set -e
# -printf "%h\n" or -exec direname {} ';'
# Exit on error in any of pipe commands
set -o pipefail

if [[ "$TRAVIS_BRANCH" == "master" ]]; then
  echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
  for f in $(find */ -type f -name "*Dockerfile" -exec direname {} ';' | sort -u); do
    build_dir=$(dirname $f)
    base=${build_dir%%\/*}
    tag=${build_dir##*\/}
    if [[ -z "$suite" ]]; then
      tag=latest
    fi
    docker build -t "{$DOCKER_USERNAME}/{$base}:{$tag}" "$build_dir"
    docker push "{$DOCKER_USERNAME}/{$base}:{$tag}"
    echo "[OK]: sucessfully pushed."
  done
fi