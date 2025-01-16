source $HOME/dots/.env

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

eval "$(rbenv init - zsh)"
eval $(thefuck --alias)

alias python=python3
alias pip=pip3

source "/opt/homebrew/opt/spaceship/spaceship.zsh"

export PATH=/Users/colinzhao/bin:/Users/colinzhao/.local/bin:$PATH

export LSCOLORS="ExfxcxdxBxegecabagacaf"
alias ls='ls -GH'

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/emulator:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

ssh_tun() {
    if [ $# -ne 2 ]; then
        echo "Usage: ssh_tun <remote_host> <port>"
        return 1
    fi
    
    ssh -f -N -L "${2}:localhost:${2}" "$1"
    echo "Started SSH tunnel on port $2 to $1"
}

ssh_tun_kill() {
    if [ $# -ne 1 ]; then
        echo "Usage: ssh_tun_kill <port>"
        return 1
    fi
    
    pkill -f "ssh -f -N -L ${1}:localhost:${1}"
    echo "Killed SSH tunnel on port $1"
}

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/colinzhao/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/colinzhao/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/colinzhao/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/colinzhao/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/colinzhao/.opam/opam-init/init.zsh' ]] || source '/Users/colinzhao/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
