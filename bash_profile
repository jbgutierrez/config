alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff | mate'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch --color'
alias gba='git branch -a --color'
alias gadd='git add -i'
alias glog='git log --pretty=format:"%ar - %an - %s"'

# http://github.com/guides/put-your-git-branch-name-in-your-shell-prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="\w\$(parse_git_branch) $ "

alias less='less -r'
alias ls='ls -l -G'
alias update_textmate_bundles='svn update ~/Library/Application\ Support/TextMate/Bundles'

PATH=$PATH:$HOME/.gem/ruby/1.8/bin

test -r /sw/bin/init.sh && . /sw/bin/init.sh
CLICOLOR=1
LSCOLORS=ExFxCxDxBxegedabagacad
export LSCOLORS CLICOLOR

# cygwin settings
# alias ls='ls -F --color=tty --show-control-chars'
# export LANG="es_ES"
# export OUTPUT_CHARSET="es_ES"
