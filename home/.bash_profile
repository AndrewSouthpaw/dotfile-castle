# explicitly load brew shell for M1: https://github.com/Homebrew/discussions/discussions/446#discussioncomment-263078
[ -s "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
# seems to not need to load homebrew explicitly for Intel, but copying here in case it would matter.
# [ -s "/usr/local/homebrew/bin/brew" ] && eval "$(/usr/local/homebrew/bin/brew shellenv)"

source ~/.tc_bash_profile
source ~/.gather_bash_profile
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/andrew/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

# added by travis gem
[ ! -s /Users/andrew/.travis/travis.sh ] || source /Users/andrew/.travis/travis.sh

# Autocomplete for gather CLI
GATHER_AC_BASH_SETUP_PATH=/Users/andrew/Library/Caches/gather-cli/autocomplete/bash_setup && test -f $GATHER_AC_BASH_SETUP_PATH && source $GATHER_AC_BASH_SETUP_PATH; # gather autocomplete setup

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash" || true

