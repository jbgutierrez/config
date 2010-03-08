# http://github.com/guides/put-your-git-branch-name-in-your-shell-prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
RED="\[\033[0;31m\]" 
YELLOW="\[\033[0;33m\]" 
GREEN="\[\033[0;32m\]" 
LIGHT_GRAY="\[\033[0;37m\]"

PS1="$RED\$(date +%H:%M) \w$YELLOW \$(parse_git_branch)$GREEN\$ $LIGHT_GRAY"

PATH=$PATH:/usr/local/mysql/bin:$HOME/.bin

test -r /sw/bin/init.sh && . /sw/bin/init.sh
CLICOLOR=1
LSCOLORS=ExFxCxDxBxegedabagacad
export LSCOLORS CLICOLOR

export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

rakecomplete() {
  COMPREPLY=($(compgen -W "`rake -s -T | awk '{{print $2}}'`" -- ${COMP_WORDS[COMP_CWORD]}))
  return 0
}
complete -o default -o nospace -F rakecomplete rake

# cygwin settings
# alias ls='ls -F --color=tty --show-control-chars'
# export LANG="es_ES"
# export OUTPUT_CHARSET="es_ES"

export EDITOR='/usr/bin/mate -w'
export PROJECTS_FOLDER=$HOME/Proyectos

#aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# Adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH=/opt/local/share/man:$MANPATH

# svn upgrade
export PATH=/opt/subversion/bin:$PATH

# Ruvy version manager
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

test -r /sw/bin/init.sh && . /sw/bin/init.sh
