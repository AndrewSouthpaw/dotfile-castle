# dotfiles castle

## Usage

Make sure you have `homeshick` installed:

```bash
$ brew install homeshick
```

Pull down the castle, which contains a bunch of dotfiles that might be useful. It will create symlinks in your `$HOME` directory to this cloned repo. If names collide, you can choose to skip them or have your original files overridden.

If there's collisions that are irresolvable, you can rename the dotfiles in the castle to provide more extensibility.

```bash
homeshick clone andrewsouthpaw/dot-castle
```

You'll need to source the "root" of these dotfiles in your `.bash_profile`:

```bash
source ~/.tc_bash_profile
```

If you want to extend your `.gitconfig` with ours, just replace yours with:

```
[include]
  path = ./.tc_gitconfig
[user]
  name = Your Name
  email = your@email.com
```

Then, you can install a bunch of useful tooling with `brew.sh` that's now in your `$HOME` directory.

```bash
$ ~/brew.sh
```

More details about commands for homeshick [here](https://github.com/andsens/homeshick/wiki/Commands).

## Other stuff to do first

- Install Xcode

```
Warning: A newer Command Line Tools release is available.
Update them from Software Update in System Preferences or run:
  softwareupdate --all --install --force

If that doesn't show you any updates, run:
  sudo rm -rf /Library/Developer/CommandLineTools
  sudo xcode-select --install
  ```

- Install command line tools: `softwareupdate --all --install --force`
- Accept the license: `sudo xcodebuild -license accept`

adding brew:

```
eval "$(/opt/homebrew/bin/brew shellenv)"
```

yarn:

```
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
```

alternative path for nvm when installed directly:

```
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

```


Caveats from nvm:

```
Please note that upstream has asked us to make explicit managing
nvm via Homebrew is unsupported by them and you should check any
problems against the standard nvm install method prior to reporting.

You should create NVM's working directory if it doesn't exist:

  mkdir ~/.nvm

Add the following to ~/.profile or your desired shell
configuration file:

  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

You can set $NVM_DIR to any location, but leaving it unchanged from
/opt/homebrew/opt/nvm will destroy any nvm-installed Node installations
upon upgrade/reinstall.

Type `nvm help` for further information.
```

Caveats from heroku:

```
To use the Heroku CLI's autocomplete --
  Via homebrew's shell completion:
    1) Follow homebrew's install instructions https://docs.brew.sh/Shell-Completion
        NOTE: For zsh, as the instructions mention, be sure compinit is autoloaded
              and called, either explicitly or via a framework like oh-my-zsh.
    2) Then run
      $ heroku autocomplete --refresh-cache
  OR
  Use our standalone setup:
    1) Run and follow the install steps:
      $ heroku autocomplete

Bash completion has been installed to:
  /opt/homebrew/etc/bash_completion.d
```

Caveats from fzf:

```
  /opt/homebrew/opt/fzf/install
```


