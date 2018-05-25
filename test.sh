#!/usr/bin/env bash
set -e

# Exit on error in any of pipe commands
set -o pipefail

UPSTREAM_REPO="https://github.com/dungeonmaster18/awesome-dockerfiles.git"
UPSTREAM_BRANCH="master"

VALIDATE_HEAD="$(git rev-parse --verify HEAD)"

git fetch -q "$UPSTREAM_REPO" "refs/heads/$UPSTREAM_BRANCH"
VALIDATE_UPSTREAM="$(git rev-parse --verify FETCH_HEAD)"

VALIDATE_COMMIT_DIFF="$VALIDATE_UPSTREAM...$VALIDATE_HEAD"

validate_diff() {
	if [ "$VALIDATE_UPSTREAM" != "$VALIDATE_HEAD" ]; then
		git diff "$VALIDATE_COMMIT_DIFF" "$@"
	else
		git diff HEAD~ "$@"
	fi
}

# Get changed dockerfiles after previous commit
IFS=$'\n'
changed_files="($(validate_diff --name-only -- '*Dockerfile'))"
unset IFS

# build the changed dockerfiles
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

	(
	set -x
	docker build -t "{$base}:{$tag}" "$build_dir"
	)

	echo "Successfully built "{$base}:{$tag}" with context "$build_dir""
done