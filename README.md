# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

```bash
$ sudo apt install git
```

## Installation

First, check out the dotfiles repo in your `$HOME` directory using Git

```bash
$ git clone https://github.com/noahdgrant/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
```

Next, run the setup script to install other useful tools

```bash
$ cd scripts/
$ chmod +x setup.sh
$ ./setup.sh
```

Then use GNU Stow to create symlinks. Don't link the `scripts/` directory

```bash
$ stow <package>
```

Restart the terminal for the changes to take affect

### Font

Download and install the JetBrains Mono Nerd Font
- https://www.nerdfonts.com/
- Right click and click "Install" to install the font on the system

### Tmux

Start tmux and press `C-a + I` to install packages

### Neovim

Start Neovim, wait for everything to install, and then restart Neovim
