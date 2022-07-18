# How to fix Alt-C on macOS
# https://github.com/junegunn/fzf/issues/164

# Setup fzf
# ---------
if [[ ! "$PATH" == *$(brew --prefix)/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$(brew --prefix)/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$(brew --prefix)/opt/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "$(brew --prefix)/opt/fzf/shell/key-bindings.bash"

# fzf needs a .git folder at the root to make use of the .gitignore file there for
# ignoring files.
[ ! -s $HOME/.git ] && mkdir $HOME/.git
