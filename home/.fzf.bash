# Setup fzf
# ---------
if [[ ! "$PATH" == *$(brew --prefix)/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$(brew --prefix)/opt/fzf/bin"
fi

[ -f ~/.fzf.git ] && source ~/.fzf.git

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$(brew --prefix)/opt/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "$(brew --prefix)/opt/fzf/shell/key-bindings.bash"

# fzf needs a .git folder at the root to make use of the .gitignore file there for
# ignoring files.
[ ! -s $HOME/.git ] && mkdir $HOME/.git

# =================== My own stuff =======================

# How to fix Alt-C on macOS
# https://github.com/junegunn/fzf/issues/164

export FZF_DEFAULT_OPTS="--extended"
# export FZF_DEFAULT_COMMAND="fd --type f" # original
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# this is triggered with Alt-C command, searches only within gather-town
export FZF_ALT_C_COMMAND="fd -t d --hidden --follow --exclude '.git' . $HOME/Projects/gather-town"

# bind [up] to fzf search
bind -x '"\e[A": __fzf_history__'

# Use fd to generate the list for directory completion
# this is triggered with the **<tab> command
_fzf_compgen_dir() {
  fd --type d --hidden --follow .
  # fd --type d --hidden --follow --exclude ".git" . "$1" # original
}

# Bash bindings for .fzf.git
# https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236
if [[ $- =~ i ]]; then
  bind '"\er": redraw-current-line'
  # these bind the various commands (like _gf, _gb, etc.) to keyboard shortcuts.
  # Look to the function definitions to figure out what each one does.
  # e.g. C-g\C-f means type Ctrl+G then Ctrl+F.
  bind '"\C-g\C-f": "$(_gf)\e\C-e\er"'
  bind '"\C-g\C-b": "$(_gb)\e\C-e\er"'
  bind '"\C-g\C-t": "$(_gt)\e\C-e\er"'
  bind '"\C-g\C-h": "$(_gh)\e\C-e\er"'
  bind '"\C-g\C-r": "$(_gr)\e\C-e\er"'
  bind '"\C-g\C-s": "$(_gs)\e\C-e\er"'
fi
