#!/bin/sh

set -eu

cd "$(dirname "$0")/../.."

repo_dir="$PWD"
hooks_dir="$repo_dir/.git/hooks"

echo_hook() {
  echo "#!/bin/sh"
  echo
  echo "set -eu"
  echo
  echo "cd \"\$(dirname \"\$0\")/../..\""
  echo
  echo "hook=\"\$(basename \"\$0\")\""
  echo "hook_dir=\"tools/git-hooks/\$hook.d\""
  echo
  echo "if [ -d \"\$hook_dir\" ]; then"
  echo "  for script in \"\$hook_dir\"/*.sh; do"
  echo "    if [ -x \"\$script\" ]; then"
  echo "      echo \"Running \$hook hook \$(basename \"\$script\")\""
  echo "      \"./\$script\" \"\$@\""
  echo "    fi"
  echo "  done"
  echo "fi"
}

main() {
  for hook in pre-commit prepare-commit-msg commit-msg post-commit; do
    hook_file="$hooks_dir/$hook"
    echo_hook >"$hook_file"
    chmod a+x "$hook_file"
  done
}

main
