#!/usr/bin/env bash
set -e

# Exit on error in any of pipe commands
set -o pipefail

if [[ "$TRAVIS_BRANCH" == "master" ]]; then
    echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
    for f in $(find -- * -type d | sort -u); do
        cd "$f"
        docker build -t dungeonmaster18/"$f" .
        docker push dungeonmaster18/"$f"
        cd ../
        echo "[OK]: sucessfully pushed $f"
    done
fi