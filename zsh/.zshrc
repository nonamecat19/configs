export ZSH="$HOME/zsh/oh-my-zsh"
export ZSH_COMPDUMP="$HOME/zsh/cache/zcompdump-omz"

source "$HOME/zsh/theme.zsh"
source "$HOME/zsh/plugins.zsh"

source $ZSH/oh-my-zsh.sh

source "$HOME/zsh/p10k.zsh"

source "$HOME/zsh/environment.zsh"
source "$HOME/zsh/docker.zsh"
source "$HOME/zsh/secrets.zsh"
source "$HOME/zsh/default-overwrite.zsh"
source "$HOME/zsh/claude.zsh"
source "$HOME/zsh/oc.zsh"
source "$HOME/zsh/aliases.zsh"

# pnpm
export PNPM_HOME="/home/nnc/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

# kimi-code
export PATH="/home/nnc/.kimi-code/bin:$PATH"


# Added by Antigravity CLI installer
export PATH="/home/nnc/.local/bin:$PATH"
export PATH=$PATH:$HOME/.maestro/bin
