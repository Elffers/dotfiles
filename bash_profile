export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/Desktop/nand2tetris/tools
export CDPATH=".:~/JungleGym:~/carezone"

function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
  }

export PS1="\[\e[0;37m\]\w\[\e[m\]\[\e[0;36m\]\$(parse_git_branch)\$ \[\e[0m\]"
export PS1="\[\033[G\]$PS1" # always start in the left most column like \r
#export PS1='\[\e[0;36m\]\h \W\$\[\e[0m '

# Tab completion of git objects.
git_completion=/usr/local/etc/bash_completion.d/git-completion.bash
if [ -f $git_completion ] ; then source $git_completion; fi

source ~/.bashrc
