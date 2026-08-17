

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
export PATH="$HOME/.local/bin:$PATH"

export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/.local/share/JetBrains/Toolbox/scripts:$PATH"

fpath=(/usr/share/zsh/site-functions ~/.zsh/completions $fpath)
autoload -Uz compinit
setopt EXTENDED_GLOB
ZCOMPDUMP="$HOME/zsh/cache/zcompdump"
if [[ -n ${ZCOMPDUMP}(#qN.mh+24) ]]; then
  compinit -d "$ZCOMPDUMP"
else
  compinit -C -d "$ZCOMPDUMP"
fi

export CURSOR_AGENT_DISABLE_TMUX=1

if [ -f '/home/nnc/google-cloud-sdk/path.zsh.inc' ]; then . '/home/nnc/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/home/nnc/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/nnc/google-cloud-sdk/completion.zsh.inc'; fi
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

export PATH="$HOME/development/flutter/bin:$PATH"

export ANDROID_SDK_ROOT="$HOME/Android"
export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH"
export CHROME_EXECUTABLE=/usr/bin/chromium
export PATH="$HOME/.local/bin:$PATH"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$PATH:$(go env GOBIN)"


source "/home/nnc/.openclaw/completions/openclaw.zsh"
export PATH=$PATH:/snap/bin


source <(git-repos completion zsh)

export PATH="$HOME/.local/bin:$PATH"

. "$HOME/.local/share/../bin/env"

# >>> ocx v1 0fe65b70 >>>
if [ -f "${OCX_HOME:-$HOME/.ocx}/env.sh" ]; then
    . "${OCX_HOME:-$HOME/.ocx}/env.sh"
fi
# <<< ocx <<<

eval "$(zoxide init zsh)"
