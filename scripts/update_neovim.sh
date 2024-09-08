#!/bin/bash

# Define variables
NVIM_URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz"
INSTALL_DIR="/usr/local"
BIN_DIR="/usr/local/bin"
NVIM_DIR="$INSTALL_DIR/nvim-linux64"

# Remove old Neovim version
if [ -d "$NVIM_DIR" ]; then
    echo "Removing old Neovim version..."
    sudo rm -rf "$NVIM_DIR"
    sudo rm -f "$BIN_DIR/nvim"
fi

# Download the latest Neovim release
echo "Downloading the latest Neovim release..."
wget -q --show-progress $NVIM_URL -O /tmp/nvim-linux64.tar.gz

# Extract the tarball
echo "Extracting Neovim..."
sudo tar xzvf /tmp/nvim-linux64.tar.gz -C $INSTALL_DIR

# Create a symbolic link
echo "Creating symbolic link..."
sudo ln -s $NVIM_DIR/bin/nvim $BIN_DIR/nvim

# Clean up
echo "Cleaning up..."
rm /tmp/nvim-linux64.tar.gz

echo "Neovim installation complete. You can now run 'nvim' from anywhere."

# Verify installation
nvim --version
