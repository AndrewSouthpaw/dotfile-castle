#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# the most important tool
brew install git

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed

# Install Bash 4.
brew install bash
brew install bash-completion2

# homeshick for managing dotfiles
# presumably this is already installed, because this dotfile exists.
brew install homeshick

# Note: this adds the bash executable (/opt/homebrew/bin/bash) to the shells
# and starts using it as the default shell.
if ! fgrep -q '$(brew --prefix)/bin/bash' /etc/shells; then
  echo '$(brew --prefix)/bin/bash' | sudo tee -a /etc/shells;
  chsh -s $(brew --prefix)/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen
brew install tree
brew install imagemagick
brew install rename
# skip watchman generally, it makes Jest grumpy
# brew install watchman
brew install act 
brew install asciinema # for making recordings of terminal
brew install awscli

# brew install cockroach <- figure this out
# brew install cocoapods
# brew install doppler <- figure this out
brew install fd # for fzf directory searching
brew install ffmpeg
brew install fzf
brew install gh
brew install postgresql
brew install ripgrep
brew install speedtest-cli
brew install watch
brew install yt-dlp # invoke with quotes: yt-dlp '...'
# blackhole recorder for OBS to pick up computer audio
brew install --cask blackhole-2ch
# show keystrokes for demo purposes
brew install --cask keycastr
# for exposing localhost
brew install --cask ngrok

# this stuff installs nvm, yarn, etc but gather handles this for us now.
# nvm doesn't want to be installed from brew apparently, but whatever
# you can use the curl command below instead.
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Yarn cannot be installed via brew without node, which causes problems with nvm.
# Related: https://github.com/yarnpkg/website/issues/913. Install via curl instead.
# curl -o- -L https://yarnpkg.com/install.sh | bash



# stuff that is maybe useful, at some point?
# render markdown nicely in CLI
# brew install glow
# brew install azure-cli
# brew install heroku
# generate ugly graphs programmatically
# brew install graphviz
# zoom light indicator: https://github.com/tonsky/AnyBar
# brew install --cask anybar

# Install font tools.
#brew tap bramstein/webfonttools
#brew install sfnt2woff
#brew install sfnt2woff-zopfli
#brew install woff2

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
#brew install ringojs
#brew install narwhal

# Potential CTF tools; see https://github.com/ctfs/write-ups.
#brew install aircrack-ng
#brew install bfg
#brew install binutils
#brew install binwalk
#brew install cifer
#brew install dex2jar
#brew install dns2tcp
#brew install fcrackzip
#brew install foremost
#brew install hashpump
#brew install hydra
#brew install john
#brew install knock
#brew install netpbm
#brew install nmap
#brew install pngcheck
#brew install socat
#brew install sqlmap
#brew install tcpflow
#brew install tcpreplay
#brew install tcptrace
#brew install ucspi-tcp # `tcpserver` etc.
#brew install xpdf
#brew install xz

# Potential other useful binaries.
#brew install ack
#brew install dark-mode
#brew install exiv2
#brew install git-lfs
#brew install lua
#brew install lynx
#brew install p7zip
#brew install pigz
#brew install pv
#brew install rhino
#brew install ssh-copy-id
#brew install testssl
#brew install vbindiff
#brew install webkit2png
#brew install zopfli

# gather stuff no longer needed because they have a Brewfile
# npm install -g @withgraphite/graphite-cli
# brew uninstall python3
# brew install pyenv
# pyenv install 3.8

# brew always installs node, which is annoying.
brew uninstall node

# Remove outdated versions from the cellar.
brew cleanup
