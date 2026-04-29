# zoxide
eval "$(zoxide init zsh)"

# Starship prompt
eval "$(starship init zsh)"

export PATH="$HOME/.local/bin:$PATH"

# Neovide
source "$HOME/workspace/dotfiles/neovide/env.zsh"

# Aliases
alias ll='ls -lahG'
