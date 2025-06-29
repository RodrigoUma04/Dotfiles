# Environment variables
export AUTO_NOTIFY_THRESHOLD=20
export AUTO_NOTIFY_TITLE="Hey! %command has just finished"
export AUTO_NOTIFY_BODY="It completed in %elapsed seconds with exit code %exit_code"
export AUTO_NOTIFY_EXPIRE_TIME=10000
export AUTO_NOTIFY_IGNORE=(
	"vim" "nvim" "nano" "more" "man" "tig" "watch" "git commit" "top" "htop" "ssh"
)

# Path
export ZSH_PLUGINS=~/.zsh/plugins

# Terminal prompt
eval "$(starship init zsh)"

# Function to shorten directory to last 2 folders
prompt_dir_short() {
  local depth=2
  local dir="${PWD/#$HOME/~}"  # Replace home with ~
  local parts=(${(s:/:)dir})
  if (( ${#parts} > depth )); then
    echo "…/${(j:/:)parts[-$depth,-1]}"
  else
    echo "$dir"
  fi
}

# Optional aliases (add more if you want)
alias gs='git status'
alias gl='git log --oneline --graph --decorate'
alias ll='ls -lh --color=auto'
alias la='ls -A'
alias ..='cd ..'

# Plugins
plugins=(auto-notify $plugins)

source $ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_PLUGINS/zsh-history-substring-search/zsh-history-substring-search.zsh
source $ZSH_PLUGINS/zsh-auto-notify/auto-notify.plugin.zsh

# Key binds
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Aliases
alias gs='git status'
alias gl='git log --oneline --graph --decorate'
alias dcu='docker compose up'
alias dcd='docker compose down'

