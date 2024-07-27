source .env

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

eval "$(rbenv init - zsh)"
eval $(thefuck --alias)

alias python=python3
alias pip=pip3

source "/opt/homebrew/opt/spaceship/spaceship.zsh"

export PATH=/Users/colinzhao/bin:$PATH

export LSCOLORS="ExfxcxdxBxegecabagacaf"
alias ls='ls -GH'

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/emulator:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

# I wonder why i did this
# export NODE_OPTIONS=--openssl-legacy-provider

export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# bun
[ -s "/Users/colinzhao/.bun/_bun" ] && source "/Users/colinzhao/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# cpp build
build() { g++ -std=c++17 -Wshadow -Wall -D_GLIBCXX_DEBUG -g $1 -o "${1%.*}"; }
co() { g++ -std=c++17 -O2 -o "${1%.*}" $1 -Wall; }
run() { co $1 && ./${1%.*} & fg; }

# pnpm
export PNPM_HOME="/Users/colinzhao/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

~/.tmux/plugins/tpm/bin/install_plugins > /dev/null

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/colinzhao/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/colinzhao/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/colinzhao/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/colinzhao/bin/google-cloud-sdk/completion.zsh.inc'; fi
