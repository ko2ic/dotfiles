#!/bin/sh
INPUT=$(cat)
TYPE=$(echo "$INPUT" | jq -r '.notification_type // "unknown"')
MSG=$(echo "$INPUT" | jq -r '.message // "完了"')

case "$TYPE" in
  permission_prompt)
    terminal-notifier -title "Claude Code" -message "$MSG" -sound Ping -activate com.googlecode.iterm2
    ;;
  *)
    terminal-notifier -title "Claude Code" -message "$MSG" -activate com.googlecode.iterm2
    ;;
esac
