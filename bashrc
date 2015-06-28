export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

export ARCHFLAGS="-arch x86_64"

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh # does the auto-switching on cd based on .ruby-version
chruby ruby-2.0.0-p594
#######
###
# Alternatively, copy/symlink this file and source in your shell.  See `hitch --setup-path`.

hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'

# Uncomment to persist pair info between terminal instances
# hitch

# if [ -f $(brew --prefix)/etc/bash_completion ]; then
# 	. $(brew --prefix)/etc/bash_completion
# fi

###
# Shortcut to ssh into servers. Command would be $ sst <app1>

function sst() { ssh -t $1.czops.net 'cd /srv/careful/current 2> /dev/null; sudo su deploy'; }

###
# Shortcut to return db to pristine state (CZ)

alias re_db='rake db:populate && rake db:migrate && rake db:test:prepare'
# db:populate is dependent on db:reset, so reset gets run first.

###
# Git aliases
alias gst="git status"
alias gd="git diff"
alias gpom="git pull origin master"
alias gol="git log --oneline --decorate"
alias gdc="git diff --cached"

alias ntt="HardwareSimulator.sh"

###
# Specjour
function sj() {
  killall -9 -m spec.rb
  killall -9 -m webkit
  rake db:test:prepare
  ps aux | grep specjour
  ps aux | grep webkit
  specjour > .specjour.ignore &
  tail -f .specjour.ignore
}

###
# Rerun failed tests on specjour
function sjrr() {
  re_db
  bundle exec specjour | script/rerun -d
}


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Bundler alias. TO test changes, run $dbundle
alias dbundle='ruby -I ~/bundler/lib ~/bundler/bin/bundle'
