#!/bin/sh -eux

CONFIG_ERROR=78

((jq -r ".comment.body" "${GITHUB_EVENT_PATH}" | grep -E "/submodules") \
  && jq -r ".issue.pull_request.url" "${GITHUB_EVENT_PATH}" \
  ) || exit ${CONFIG_ERROR}

if [ "$(jq -r ".action" "${GITHUB_EVENT_PATH}")" -ne "created" ]; then
  echo "not a new comment"
  exit ${CONFIG_ERROR}
fi

REPO=$(jq -r ".repository.full_name" "${GITHUB_EVENT_PATH}")

cd "${GITHUB_WORKSPACE}"

git config --global user.email "submodule@github.com"
git config --global user.name "GitHub Submodules Action"

git remote set-url origin https://x-access-token:${GITHUB_TOKEN}@github.com/${REPO}.git

git fetch origin ${GITHUB_REF}

git submodule foreach 'git fetch --all -p'
git add -v .
git commit -m "bumping submodules"
git push origin ${GITHUB_REF}
