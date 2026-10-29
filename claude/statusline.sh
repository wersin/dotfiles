#!/bin/bash
# Claude Code status line: shows the folder the session started in,
# plus the current folder when it differs, and the active model.

input=$(cat)

project_dir=$(jq -r '.workspace.project_dir // empty' <<<"$input")
current_dir=$(jq -r '.workspace.current_dir // .cwd // empty' <<<"$input")
model=$(jq -r '.model.display_name // empty' <<<"$input")
cost=$(jq -r '.cost.total_cost_usd // empty' <<<"$input")

# Replace $HOME with ~ for readability
shorten() { [ -n "$1" ] && printf '%s' "${1/#$HOME/~}"; }

start=$(shorten "$project_dir")
cur=$(shorten "$current_dir")

line="📁 ${start:-$cur}"
[ -n "$cur" ] && [ -n "$start" ] && [ "$cur" != "$start" ] && line="$line → $cur"
[ -n "$model" ] && line="$line · $model"
[ -n "$cost" ] && line="$line · $(printf '$%.2f' "$cost")"

printf '%s' "$line"
