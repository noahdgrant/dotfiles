#!/bin/bash

# NOTE: Don't run this script with sudo or it installs it in /root/repos

# https://github.com/neovim/neovim/blob/master/BUILD.md
# https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-source

# To uninstall: make distclean
# To update: git pull && sudo make install

set -e

mkdir -p ~/repos && cd ~/repos

echo "Installing Neovim dependencies..."
sudo apt install ninja-build gettext cmake unzip curl build-essential

echo "Cloning Neovim..."
git clone --depth 1 https://github.com/neovim/neovim
cd neovim

echo "Checking out stable branch..."
git fetch --tags origin
git checkout stable

echo "Building Neovim..."
make CMAKE_BUILD_TYPE=Release

echo "Installing Neovim..."
sudo make install

nvim --version

echo "Installing Neovim add ons..."
sudo apt install ripgrep fd-find
