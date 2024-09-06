#!/bin/bash

# Setup script for my Ubuntu configuration

echo "Updating system"
sudo apt update
sudo apt upgrade

mkdir -p ~/.config

echo "Installing packages"
sudo apt install -y build-essential valgrind tmux xclip ripgrep python3.10-venv zip unzip python3 curl bear tree python-is-python3 universal-ctags cscope vim
sudo snap install nvim --classic

# Node and NPM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
nvm install --lts

# TMUX
git clone git@github.com:tmux-plugins/tpm.git ~/.tmux/plugins/tpm
rmdir ~/.config/tmux
ln -s ~/.dotfiles/tmux ~/.config/tmux

# Neovim
rmdir ~/.config/nvim
ln -s ~/.dotfiles/nvim ~/.config/nvim

# Bash
rm -f ~/.bashrc
ln -s ~/.dotfiles/bash/bashrc ~/.bashrc

# Git
rm -f ~/.gitconfig
ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig

# Vim
rm -f ~/.vimrc
ln -s ~/.dotfiles/vim/vimrc ~/.vimrc

echo "Updating newly installed packages"
sudo apt update
sudo apt upgrade

echo "Setup complete!"
echo "Restart terminal for changes to take effect"
