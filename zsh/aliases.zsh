alias ca="clear && cursor-agent"
alias cl="clear"
alias oc="opencode"
alias ck="clockify-cli"
alias open='xdg-open'


kill-port() {
  local port="$1"
  [[ -z "$port" ]] && { echo "Usage: kill-port <port>"; return 1 }

  echo "Killing processes on port $port..."
  sudo fuser -k "$port"/tcp
}

ws() {
    local dir="${1:-.}"
    nohup webstorm "$dir" >/dev/null 2>&1 &!
    exit
}

gn() {
    local dir="${1:-.}"
    nohup goland1 "$dir" >/dev/null 2>&1 &!
    exit
}

alias fa='fabric-ai'
alias h='herdr'

alias ai="node ~/scripts/ai.js"
