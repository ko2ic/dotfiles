#!/bin/sh
if [ -n "$TMUX_PANE" ]; then
  WIN=$(tmux display-message -t "$TMUX_PANE" -p '#I')
  tmux set-window-option -t ":$WIN" window-status-style default
  tmux set-window-option -t ":$WIN" window-status-current-style 'fg=white,bg=blue,bold'
  tmux set-option -p -t "$TMUX_PANE" window-style 'bg=default'
  tmux set-option -p -t "$TMUX_PANE" window-active-style 'bg=default'
fi
