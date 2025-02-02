#!/bin/bash

packages=$(awk '/## Arch packages/{flag=1; next} /## Firefox configuration/{flag=0} flag' "README.md" | tr '\n' ' ' | tr -d '\`' | xargs)

echo "Installing $(echo $packages | wc -w) packages"
if [ -n "$packages" ]; then
  sudo pacman -Sy $packages
else
  echo "No packages found!"
  exit 1
fi

echo "Installing tmux tpm"
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone -q https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "Installing nvim-kickstart"
if [ ! -d ~/.config/nvim ]; then
  git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/nvim
fi
