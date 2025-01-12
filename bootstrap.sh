#!/usr/bin/env bash

# remove x to disable printing of commands
set -euxo pipefail

BIN_DIR="$HOME/bin"
INTALL_CMD=

case $(uname) in
"Linux")
	INSTALL_CMD="sudo apt install $*"
	DISTRO=$(lsb_release -cs)
	;;
"Darwin")
	INSTALL_CMD="brew install $*"
	;;
esac

echo "Please input your password: "
read -s PASSWORD
parse_password() {
	echo $PASSWORD
}

# some deps
parse_password | $INSTALL_CMD -y curl wget zsh
# rust
# https://github.com/rust-lang/rustup/issues/1031
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path &&
	rustup override set stable &&
	rustup update stable
# go
GOLANG_TAR="go1.18.1.linux-amd64.tar.gz"
wget https://go.dev/dl/$GOLANG_TAR -P ~/Downloads &&
	parse_password | sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf ~/Downloads/$GOLANG_TAR

# change default shell to zsh
chsh -s $(command -v zsh)

# nvim 0.6.1 why? just bc vscode-neovim isn't compatible with latest
if ! [ -d "$XDG_DATA_HOME/nvim" ]; then
	parse_password | sudo add-apt-repository ppa:neovim-ppa/stable &&
		sudo apt update &&
		sudo apt install neovim
fi

# vim-plug
VIMPLUG_DIR="$HOME/.local/share/nvim/site/autoload"
if ! [ -d "$VIMPLUG_DIR/plug.vim" ]; then
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi


case $(uname) in
"Linux")
	# bat
	BAT_VER="0.20.0"
	BAT_DEB="bat_${BAT_VER}_amd64.deb"
	wget https://github.com/sharkdp/bat/releases/download/v$BAT_VER/$BAT_DEB -P ~/Downloads &&
		parse_password | sudo dpkg -i ~/Downloads/$BAT_DEB

	# xclip
	parse_password | $INSTALL_CMD xclip

	cargo install fd-find ripgrep git-delta

	;;
"Darwin")
	INSTALL_CMD="brew install $*"
	brew install fd bat ripgrep git-delta

	;;
esac

# # fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/bin/fzf &&
	~/bin/fzf/install --key-bindings --completion --no-update-rc

if [[ $(command -v shellcheck) == 0 ]]; then
	$INSTALL_CMD shellcheck
fi

# nvm
NVM_DIR="$HOME/.nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" &&
	nvm install --lts

# npm installs
npm install -g prettier prettier-plugin-solidity yarn typescript

# black
python3 -m pip install black
# isort
python3 -m pip install isort

# shfmt
go install mvdan.cc/sh/v3/cmd/shfmt@latest

# clang-format
if [[ $(command -v clangd) == 0 ]] | [[ $(command -v clang-format) == 0 ]] | [[ $(command -v clang-tidy) == 0 ]]; then
	echo "clangd / clang-format / clang-tidy missing"
	parse_password | wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
	parse_password | sudo add-apt-repository "deb http://apt.llvm.org/$DISTRO/ llvm-toolchain-$DISTRO main"
	parse_password | sudo apt update && $INSTALL_CMD -y clangd clang-format clang-tidy
fi

# cmake-format
python3 -m pip install cmakelang

# stylua
cargo install stylua

# lazygit + delta
LGIT_VER="0.34"
LGIT_TAR="lazygit_${LGIT_VER}_$(uname)_x86_64.tar.gz"
wget https://github.com/jesseduffield/lazygit/releases/download/v$LGIT_VER/$LGIT_TAR -P ~/Downloads &&
	tar -xvf $LGIT_TAR &&
	mv ~/Downloads/lazygit ~/bin

# tldr
curl -o ~/bin/tldr https://raw.githubusercontent.com/raylee/tldr/master/tldr &&
	chmod +x ~/bin/tldr

# foundry
curl -L https://foundry.paradigm.xyz | bash
foundryup

