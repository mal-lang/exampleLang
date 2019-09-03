#!/bin/bash

set -e

BASE_DIR="$(dirname "$(dirname "$(realpath "$0")")")"

cd "$BASE_DIR"

echo "Executing profile 'test-only'..."
mvn clean install --quiet --batch-mode \
  --settings .buildscript/settings.xml \
  --activate-profiles test-only

echo "Executing profile 'build-only'..."
mvn clean install --quiet --batch-mode \
  --settings .buildscript/settings.xml \
  --activate-profiles build-only,foreseeti

echo "Executing default profile 'build-and-test'..."
mvn clean install --quiet --batch-mode \
  --settings .buildscript/settings.xml \
  --activate-profiles foreseeti
