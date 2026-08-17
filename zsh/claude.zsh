unalias clc 2>/dev/null

clc() {
  local model=""
  case "$1" in
    o) model="opus"; shift ;;
    s) model="sonnet"; shift ;;
    f) model="fable"; shift ;;
    h) model="haiku"; shift ;;
  esac

  local perm_mode=""
  case "$1" in
    b) perm_mode="acceptEdits"; shift ;;
    p) perm_mode="plan"; shift ;;
    m) perm_mode="manual"; shift ;;
  esac

  local args=()
  [ -n "$model" ] && args+=(--model "$model")
  [ -n "$perm_mode" ] && args+=(--permission-mode "$perm_mode")

  clear
  claude "${args[@]}" "$@"
}

claude-use() {
  local profile="$1"
  local workdir="$2"
  shift 2

  local claude_dir="$HOME/.claude"
  local active_auth="$claude_dir/.credentials.json"
  local saved_auth="$claude_dir/auth-${profile}.credentials.json"

  if [ -z "$profile" ] || [ -z "$workdir" ]; then
    echo "Usage: claude-use pro|api <path> [claude args...]"
    return 1
  fi

  if [ ! -d "$workdir" ]; then
    echo "Directory does not exist: $workdir"
    return 1
  fi

  mkdir -p "$claude_dir"

  if [ ! -f "$saved_auth" ]; then
    echo "Missing auth file: $saved_auth"
    echo "Create it first:"
    echo "  cp ~/.claude/.credentials.json $saved_auth"
    return 1
  fi

  # Switch only auth
  cp "$saved_auth" "$active_auth"
  chmod 600 "$active_auth"

  # Clear console, then launch Claude inside target directory.
  # Remaining arguments are passed directly to claude.
  clear
  (
    cd "$workdir" || exit 1
    env -u ANTHROPIC_API_KEY claude "$@"
  )
  local code=$?

  # Save refreshed auth back after Claude exits
  if [ -f "$active_auth" ]; then
    cp "$active_auth" "$saved_auth"
    chmod 600 "$saved_auth"
  fi

  return $code
}

ccp() {
  claude-use pro "$@"
}

cca() {
  claude-use api "$@"
}

ccl() {
  ls -lh "$HOME/.claude"/auth-*.credentials.json 2>/dev/null || echo "No saved auth profiles found"
}
