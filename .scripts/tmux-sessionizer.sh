#!/usr/bin/env zsh

if [[ $# -eq 1 ]]; then
    selected=$1
else
    baseFolders=(
        "$HOME/src/personal" 
        "$HOME/src/polymarket/"
        "$HOME/src/wags"
        "$HOME/School/2024-2025/"
    )
    folders=$(fd . ${baseFolders[@]} --min-depth=1 --max-depth=1 --type=d --hidden -L)
    specificFolders=(
        "$HOME/dots"
    )
    selected=$(
      {
        echo "$folders"
        printf '%s\n' "${specificFolders[@]}"
      } | fzf
    )
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
