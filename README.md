# Dotfiles

Personal configuration files managed with Git and GNU Stow.

## Setup

On a new Mac, install Homebrew if necessary, then run:

```bash
# Install Stow
brew install stow

# Clone dotfiles
git clone git@github.com:rohanorton/dots.git ~/dots

# Link configurations
cd ~/dots
stow -t ~ nvim git fish tmux vim ghostty
stow --no-folding -t ~ karabiner
```

Stow creates symlinks from the usual configuration locations into this
repository. Changes made to linked configuration files are therefore reflected
in Git.

**Note:** Stow will report conflicts if configuration files already exist at
the target locations. Back up or move those files before running the commands
again.

## Packages

| Package     | Configuration                                       |
| ----------- | --------------------------------------------------- |
| `nvim`      | `~/.config/nvim/`                                   |
| `vim`       | `~/.config/vim/`                                    |
| `fish`      | `~/.config/fish/`                                   |
| `git`       | `~/.config/git/`                                    |
| `tmux`      | `~/.config/tmux/`                                   |
| `ghostty`   | `~/.config/ghostty/`                                |
| `karabiner` | `~/.config/karabiner/assets/complex_modifications/` |

### Karabiner

Only reusable complex modification rules are shared.

The active `~/.config/karabiner/karabiner.json` and automatic backups remain
machine-local. Enable the desired rules on each machine through
Karabiner-Elements → Complex Modifications → Add predefined rule.

Use `--no-folding` when stowing Karabiner to avoid symlinking the entire
configuration directory.

## Managing configurations

From `~/dots`:

```bash
# Link a package
stow -t ~ fish

# Preview changes
stow -n -v -t ~ fish

# Remove symlinks
stow -D -t ~ fish

# Restow after structural changes
stow -R -t ~ fish
```

Unstowing removes symlinks, not the configuration files stored in this repository.
