# shellcheck shell=sh

comma_list() {
  echo "$1" | sed "/^[[:space:]]*$/d" | tr "\n" "," | sed "s/,$/\n/g"
}
