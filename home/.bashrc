# this doesn't load normally, and I'm not clear when it does, but in case this one is used,
# just defer to the bash_profile.

[ -n "$PS1" ] && source ~/.bash_profile;

export PATH="/Users/andrew/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(mise activate --shims bash)"