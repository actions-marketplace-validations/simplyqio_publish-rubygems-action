#!/bin/bash

echo "Setting up gem credentials..."
set +x
mkdir -p ~/.gem

cat <<EOF >~/.gem/credentials
---
:github: Bearer ${GITHUB_TOKEN}
:rubygems_api_key: ${RUBYGEMS_API_KEY}
EOF

chmod 0600 ~/.gem/credentials
set -x

echo "Setting committer details..."
git config user.email "${GIT_COMMITTER_EMAIL:-<>}"
git config user.name "${GIT_COMMITTER_NAME:-GitHub Actions Bot}"

work_directory="${WORKDIR:-.}"
cd $work_directory

echo "Installing dependencies..."
bundle install

echo "Running gem release task..."
release_command="${RELEASE_COMMAND:-rake release}"
exec $release_command
