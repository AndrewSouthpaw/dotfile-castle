# TC Castle

## Usage

Make sure you have `homeshick` installed:

```bash
$ brew install homeshick
```

Pull down the TC castle, which contains a bunch of dotfiles that might be useful. It will create symlinks in your `$HOME` directory to this cloned repo. If names collide, you can choose to skip them or have your original files overridden.

If there's collisions that are irresolvable, we can rename the dotfiles in the TC castle to provide more extensibility.

```bash
homeshick clone transparentclassroom/tc-castle
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
