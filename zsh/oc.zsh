unalias oc 2>/dev/null

oc() {
  local model=""
  case "$1" in
    g) model="ollama-cloud/glm-5.2"; shift ;;
    d) model="ollama-cloud/deepseek-v4-pro"; shift ;;
    f) model="ollama-cloud/deepseek-v4-flash"; shift ;;
  esac

  local mode=""
  case "$1" in
    b) mode="build"; shift ;;
    p) mode="plan"; shift ;;
  esac

  local args=()
  [ -n "$model" ] && args+=(-m "$model")

  echo "model=$model mode=$mode"
  printf 'args: '; printf '%q ' "${args[@]}"; echo
  printf 'rest: '; printf '%q ' "$@"; echo

  if [ "$mode" = "plan" ]; then
    clear
    OPENCODE_EXPERIMENTAL_PLAN_MODE=true opencode "${args[@]}" "$@"
  else
    clear
    opencode "${args[@]}" "$@"
  fi
}
