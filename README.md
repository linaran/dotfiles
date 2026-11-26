# Dotfiles

Personal configuration files managed with Git using a bare repository.

The bare repository is stored at `~/.dotfiles`, while the working tree is my home directory (`$HOME`). This keeps configuration files in their conventional locations without symlinks.

## Installation

Install Git and clone the bare repository:

```fish
git clone --bare <repository-url> ~/.dotfiles
```

Configure Git to use the home directory as its working tree:

```fish
git --git-dir=$HOME/.dotfiles --work-tree=$HOME config --local status.showUntrackedFiles no
```

Check out the configuration files:

```fish
git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout
```

If Git reports that files would be overwritten, back up or remove the conflicting files before checking out.

## Fish

The `dotfiles` function is defined in:

```text
~/.config/fish/functions/dotfiles.fish
```

Once checked out, Fish loads it automatically.

Usage:

```fish
dotfiles status
dotfiles add ~/.config/fish/config.fish
dotfiles commit -m "Update configuration"
dotfiles push
```

## Tmux plugins

Tmux plugin configuration is stored in `.tmux.conf`.

The actual plugin installations are not tracked. Install TPM and use the tmux prefix followed by `I` to install the configured plugins.

## Notes

Only explicitly tracked files belong to this repository. Personal data, credentials, caches, and machine-specific files should remain untracked.

