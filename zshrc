. ~/.zsh/env
. ~/.zsh/config
. ~/.zsh/aliases

# load non-versioned and project-specific settings
if [[ -e ~/.zshrc.local ]]; then
  . ~/.zshrc.local
fi
