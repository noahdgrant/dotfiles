# Setup script for my Ubuntu configuration

echo "Updating system"
sudo apt update
sudo apt upgrade

mkdir -p ~/.config

echo "Installing packages"
sudo apt install -y build-essential valgrind tmux xclip ripgrep \
    python3.10-venv zip unzip python3 curl bear tree python-is-python3 \
    universal-ctags cscope vim stow

echo "Installing Neovim"
chmod +x ./update_neovim.sh
./update_neovim.sh

# Node and NPM
echo "Installing Node and NPM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
nvm install --lts

# TMUX
echo "Installing tmux plugins"
git clone git@github.com:tmux-plugins/tpm.git ~/.tmux/plugins/tpm

echo "Updating newly installed packages"
sudo apt update
sudo apt upgrade

echo "Setup complete!"
echo "Restart terminal for changes to take effect"
