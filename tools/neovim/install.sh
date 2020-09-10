#!/bin/bash -e

# Make config directory for Neovim's init.vim
echo '[*] Preparing Neovim config directory ...'
mkdir -p ~/.config/nvim

# (Optional) Alias vim -> nvim
echo '[*] Aliasing vim -> nvim, remember to source ~/.bashrc ...'
echo "alias vim='nvim'" >> ~/.zshrc

# Install vim-plug plugin manager
echo '[*] Downloading vim-plug, the best minimalistic vim plugin manager ...'
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

./reload

echo -e "[+] Done, welcome to \033[1m\033[92mNeoVim\033[0m! Try it by running: nvim/vim. Want to customize it? Modify ~/.config/nvim/init.vim"
