#!/bin/bash
input=$(cat)
MODEL=$(echo "$input" | jq -r '.model.display_name')
DIR=$(echo "$input" | jq -r '.workspace.current_dir')
REPO=$(echo "$DIR" | sed 's|.*/||')
BRANCH=$(git -C "$DIR" rev-parse --abbrev-ref HEAD 2>/dev/null)
PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
COST=$(printf '$%.2f' "$(echo "$input" | jq -r '.cost.total_cost_usd // 0')")

GREEN='\033[32m'; YELLOW='\033[33m'; RED='\033[31m'; RESET='\033[0m'
if [ "$PCT" -ge 90 ]; then C="$RED"
elif [ "$PCT" -ge 70 ]; then C="$YELLOW"
else C="$GREEN"; fi

FILLED=$((PCT / 10)); EMPTY=$((10 - FILLED))
BAR=$(printf "%${FILLED}s" | tr ' ' '█')$(printf "%${EMPTY}s" | tr ' ' '░')

if [ -n "$BRANCH" ]; then REPO_INFO="$REPO:$BRANCH"; else REPO_INFO="$REPO"; fi
echo -e "[$REPO_INFO] [$MODEL] ${C}${BAR}${RESET} ${PCT}% | ${COST}"
