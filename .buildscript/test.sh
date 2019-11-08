#!/bin/bash

set -e

BASE_DIR="$(dirname "$(dirname "$(realpath "$0")")")"

cd "$BASE_DIR"

echo "Executing default profile..."
mvn clean install --quiet --batch-mode \
  --settings .buildscript/settings.xml

echo "Executing profile 'securiCAD'..."
mvn clean install --quiet --batch-mode \
  --settings .buildscript/settings.xml \
  --activate-profiles securiCAD
