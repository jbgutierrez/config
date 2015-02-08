autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{green}●'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn
theme_precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{green}]'
    } else {
        zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{red}●%F{green}]'
    }

    vcs_info
}

git_log() {
  git log --pretty=format:"%h - %ar : %s" -n 1 2> /dev/null
}

setopt prompt_subst

vi_ins_mode=""
vi_cmd_mode="%B%F{green} [CMD]%{$reset_color%}"
vi_mode=$vi_ins_mode

zle-keymap-select() {
  vi_mode="${${KEYMAP/vicmd/${vi_cmd_mode}}/(main|viins)/${vi_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

zle-line-finish() {
  vi_mode=$vi_ins_mode
}
zle -N zle-line-finish

PROMPT='${return_code}%B%F{magenta}$(date +%H:%M) %c%B%F{green}${vcs_info_msg_0_}%B%F{magenta} %{$reset_color%}% → '

RPROMPT='%U%B%F{white}$(git_log)%u%{$reset_color%}${vi_mode}'

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd
