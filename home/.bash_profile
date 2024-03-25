# explicitly load brew shell for M1: https://github.com/Homebrew/discussions/discussions/446#discussioncomment-263078
[ -s "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
# seems to not need to load homebrew explicitly for Intel, but copying here in case it would matter.
# [ -s "/usr/local/homebrew/bin/brew" ] && eval "$(/usr/local/homebrew/bin/brew shellenv)"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,tc_bash_profile,extra,creds}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.gather_{bash_profile,path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/andrew/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

# added by travis gem
[ ! -s /Users/andrew/.travis/travis.sh ] || source /Users/andrew/.travis/travis.sh

# Autocomplete for gather CLI
GATHER_AC_BASH_SETUP_PATH=/Users/andrew/Library/Caches/gather-cli/autocomplete/bash_setup && test -f $GATHER_AC_BASH_SETUP_PATH && source $GATHER_AC_BASH_SETUP_PATH; # gather autocomplete setup

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash" || true

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d"

	source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Set up git completion. The old script (below, commented out) stopped working 2021-11-02 for some unclear reason,
# maybe due to upgrading git or some transitive dependency or something. Anyway, _git is no longer an exported
# git wrapper, earlier commits in git repo (like 8b79343fc0) have it but at some point it was dropped.
# This gist (https://gist.github.com/JuggoPop/10706934) pointed to a couple functions I could set up instead.
# There's also this SO answer https://superuser.com/a/437508 about alias completion.
__git_complete g __git_main

# Enable tab completion for `g` by marking it as an alias for `git`
# if type _git &> /dev/null && [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
#   echo "hello completion"
# 	complete -o default -o nospace -F _git g;
# fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

# Makefile completion
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make

# Enable homeshick `cd` command
export HOMESHICK_DIR=$(brew --prefix)/opt/homeshick
source "$(brew --prefix)/opt/homeshick/homeshick.sh"
