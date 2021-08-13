#!/bin/sh

set -eu

cd "$(dirname "$0")/../../.."

echo_changed_pom() {
  set +e
  git diff --cached --name-only --diff-filter=ACMR | grep "^pom\.xml$"
  set -e
}

format_pom() {
  # shellcheck source=../../scripts/utils.sh
  . tools/scripts/utils.sh

  echo "Formatting $(echo "$changed_pom" | wc -l) pom.xml files"
  mvn -B -q -Dincludes="$(comma_list "$changed_pom")" xml-format:xml-format tidy:pom
  echo "$changed_pom" | tr "\n" "\0" | xargs -0 git add -f
}

main() {
  changed_pom="$(echo_changed_pom)"
  if [ -z "$changed_pom" ]; then
    exit
  fi
  format_pom
}

main
