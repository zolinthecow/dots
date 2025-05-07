#!/bin/zsh

osascript -e "tell application \"System Events\" to keystroke \"$1\" using {option down}"

