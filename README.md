# dotfiles

## Installation

Packages can be installed using the `install.sh` script.

The dotfiles are managed by __GNU Stow__:

```bash
cd ~
git clone https://github.com/DawidPietrykowski/dotfiles
cd dotfiles
stow *
```

## Arch packages

```
alacritty
bat
eza
fastfetch
fd
firefox
fish
fisher
fzf
helix
jq
neovim
nerd-fonts
openssh
reflector
ripgrep
ripgrep
ripgrep-all
rustup
stow
sudo
tmux
tree-sitter
unzip
wget
wl-clipboard
zoxide
```

## Firefox configuration

```
general.autoScroll: true
browser.startup.page: duckduckgo.com
```

## tmux

`install.sh` script will install `tpm` if it's not already installed, but packages are installed by executing
<kbd>Ctrl</kbd> + <kbd>Space</kbd> and <kbd>I</kbd>
inside the `tmux` environment
