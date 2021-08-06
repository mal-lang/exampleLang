#!/bin/sh

set -eu

cd "$(dirname "$0")/../../.."

echo_changed_java() {
  set +e
  git diff --cached --name-only --diff-filter=ACMR | grep "\.java$"
  set -e
}

format_java() {
  # shellcheck source=../../scripts/google-java-format.sh
  . tools/scripts/google-java-format.sh

  latest_name="$(get_latest_name)"
  fmt_jar="$PWD/tools/$latest_name"

  if [ ! -f "$fmt_jar" ]; then
    echo "Downloading $latest_name"
    latest_url="$(get_latest_url)"
    wget -qO "$fmt_jar" "$latest_url"
  fi

  echo "Formatting $(echo "$changed_java" | wc -l) java files"
  echo "$changed_java" |
    tr "\n" "\0" |
    xargs -0 java \
      --add-exports jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED \
      --add-exports jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED \
      --add-exports jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED \
      --add-exports jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED \
      --add-exports jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED \
      -jar "$fmt_jar" \
      --replace
  echo "$changed_java" | tr "\n" "\0" | xargs -0 git add -f
}

main() {
  changed_java="$(echo_changed_java)"
  if [ -z "$changed_java" ]; then
    exit
  fi
  format_java
}

main
