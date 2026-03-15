#!/bin/sh
if [ -n "$TMUX_PANE" ]; then
  WIN=$(tmux display-message -t "$TMUX_PANE" -p '#I')
  tmux set-window-option -t ":$WIN" window-status-style 'fg=black,bg=yellow,bold'
  tmux set-option -p -t "$TMUX_PANE" window-style 'bg=#332b00'
  tmux set-option -p -t "$TMUX_PANE" window-active-style 'bg=#332b00'
fi
