alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff | mate'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch --color'
alias gba='git branch -a --color'
alias glog='git log --pretty=format:"%ar - %s"'
alias ls='ls -l -G'

PS1='\u$'
PATH=$PATH:$HOME/.gem/ruby/1.8/bin

test -r /sw/bin/init.sh && . /sw/bin/init.sh
CLICOLOR=1
LSCOLORS=ExFxCxDxBxegedabagacad
export LSCOLORS CLICOLOR
