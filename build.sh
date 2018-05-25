#!/usr/bin/env bash
set -e

# -printf "%h\n" or -exec direname {} ';'
# find */ -type f -name "*Dockerfile" -exec direname {} ';' | sort -u

# Exit on error in any of pipe commands
set -o pipefail

# Get changed dockerfiles after previous commit
IFS=$'\n'
changed_files=( "$(git diff HEAD~ --name-only -- "*Dockerfile")" )
unset IFS

# Build and push docker images only if it is the master branch
if [[ "$TRAVIS_BRANCH" == "master" && "${#changed_files[@]}" -ne 0 ]]; then
  echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
  for f in "${changed_files[@]}"; do
    if ! [[ -e "$f" ]]; then
      continue
    fi

    build_dir=$(dirname "$f")
    base="${build_dir%%\/*}"
    tag="${build_dir##*}"
    if [[ -z "$tag" ]]; then
      tag=latest
    fi

    docker build -t "$DOCKER_USERNAME/$base:$tag" "$build_dir"
    docker push "$DOCKER_USERNAME/$base:$tag"
    echo "[OK]: sucessfully pushed."
  done
fi
