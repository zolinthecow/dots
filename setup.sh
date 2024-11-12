#!/bin/bash

set -eo pipefail

if ! command -v brew &> /dev/null
then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v stow &> /dev/null
then
        echo "Stow not found. Installing Stow..."
            brew install stow
fi

stow .

brew install wget
# https://github.com/nvbn/thefuck
brew install thefuck
# https://github.com/spaceship-prompt/spaceship-prompt
brew install spaceship
# https://pnpm.io/installation
curl -fsSL https://get.pnpm.io/install.sh | sh -
# https://github.com/tmux/tmux/wiki/Installing
brew install tmux
# https://github.com/sharkdp/fd?tab=readme-ov-file#installation
brew install fd
# https://github.com/junegunn/fzf
brew install fzf

# g++
brew install gcc
# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# zig
brew install zig
# conda
mkdir -p ~/miniconda3
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -o ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
# https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# https://github.com/rbenv/rbenv
brew install rbenv
# golang
wget "https://go.dev/dl/go1.22.5.darwin-arm64.pkg"
sudo installer -pkg "Go 1.22.5 Darwin ARM64.pkg" -target /
rm "Go 1.22.5 Darwin ARM64.pkg"
# https://bun.sh/
curl -fsSL https://bun.sh/install | bash

echo "Successfully installed. Source ~/.zshrc to see changes. Refer to README.md for manual install list"

