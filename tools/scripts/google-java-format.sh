# shellcheck shell=sh

get_latest_assets() {
  curl -fLSs "https://api.github.com/repos/google/google-java-format/releases/latest" | jq -c .assets[]
}

get_latest_asset() {
  get_latest_assets | while IFS= read -r asset; do
    if echo "$asset" | jq -r .name | grep -q "^google-java-format-.*-all-deps\.jar$"; then
      echo "$asset"
    fi
  done
}

get_latest_name() {
  get_latest_asset | jq -r .name
}

get_latest_url() {
  get_latest_asset | jq -r .browser_download_url
}
