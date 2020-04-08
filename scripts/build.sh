#!/bin/sh

set -e

if [ -n "$FORESEETI_USERNAME" ] && [ -n "$FORESEETI_PASSWORD" ]; then
  mkdir -p "$HOME/.aws"
  cat << EOF > "$HOME/.aws/credentials"
[default]
aws_access_key_id=$FORESEETI_USERNAME
aws_secret_access_key=$FORESEETI_PASSWORD
EOF

  echo mvn -B -V -PsecuriCAD clean install
  mvn -B -V -PsecuriCAD clean install
else
  echo mvn -B -V clean install
  mvn -B -V clean install
fi
