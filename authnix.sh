#!/usr/bin/env bash
set -eo pipefail

if [[ $1 != "" ]]; then
  TOKEN=$1
elif [[ $GITHUB_TOKEN != "" ]]; then
  TOKEN=$GITHUB_TOKEN
else
  echo "ERROR: Token not given. Give it as an argument or set env GITHUB_TOKEN."
  exit 1
fi

NIX_NETRC=$(nix show-config | sed -n 's/.*netrc-file = //p')

if [[ -z $NIX_NETRC ]]; then
  echo "ERROR: Can not find nix netrc file locations in config. Is nix installed?"
  exit 1
fi

cat <<EOF | sudo tee -a $NIX_NETRC > /dev/null
machine github.com
  login token
  password $TOKEN

EOF
