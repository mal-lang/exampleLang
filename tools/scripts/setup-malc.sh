#!/bin/sh

set -eu

cd "$(dirname "$0")/../.."

get_latest_assets() {
  curl -fLSs "https://api.github.com/repos/mal-lang/malc/releases/latest" | jq -c .assets[]
}

get_latest_asset() {
  get_latest_assets | while IFS= read -r asset; do
    if echo "$asset" | jq -r .name | grep -q "^malc-.*\.linux\.amd64\.tar\.gz$"; then
      echo "$asset"
    fi
  done
  unset asset
}

get_latest_name() {
  get_latest_asset | jq -r .name
}

get_latest_url() {
  get_latest_asset | jq -r .browser_download_url
}

download_malc() {
  latest_name="$(get_latest_name)"
  latest_url="$(get_latest_url)"
  malc_tarball="$PWD/tools/$latest_name"

  echo "Downloading $latest_name"
  rm -f "$malc_tarball"
  wget -qO "$malc_tarball" "$latest_url"

  unset latest_name latest_url
}

install_malc() {
  malc_dir="$(basename "$malc_tarball")"
  malc_dir="${malc_dir%.tar.gz}"
  malc_dir="/opt/$malc_dir"

  echo "Installing $(basename "$malc_tarball")"
  sudo mkdir -p /opt /usr/local/bin /usr/local/share/man/man1 /usr/local/share/bash-completion/completions
  sudo rm -fR "$malc_dir"
  sudo tar -xzf "$malc_tarball" -C /opt
  sudo ln -sf "$malc_dir/malc" /usr/local/bin/malc
  sudo ln -sf "$malc_dir/malc.1" /usr/local/share/man/man1/malc.1
  sudo ln -sf "$malc_dir/malc_completion.sh" /usr/local/share/bash-completion/completions/malc
}

main() {
  download_malc
  install_malc
}

main
