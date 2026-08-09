#!/usr/bin/env bash
# Seamless vim <-> herdr pane navigation (vim-tmux-navigator equivalent).
# Bound to ctrl+h/j/k/l via [[keys.command]] in ~/.config/herdr/config.toml.
#
# If the focused pane is running vim/nvim, forward the keystroke so nvim's own
# <C-h/j/k/l> mapping handles it (move split, or cross the edge back into herdr).
# Otherwise move herdr focus directionally.
#
# $1 = left | down | up | right
set -uo pipefail

dir="$1"
log="${TMPDIR:-/tmp}/herdr-nav.log"

# Use the binary the running server was launched from. A `brew upgrade herdr`
# replaces the binary on PATH while the old server keeps running, and the newer
# CLI then refuses every request with `protocol_mismatch` -- which silently
# breaks navigation. Prefer HERDR_BIN_PATH so we keep talking the server's
# protocol; see `herdr status` if navigation ever stops working.
herdr_bin="${HERDR_BIN_PATH:-herdr}"

note() { printf '%s %s\n' "$(date '+%F %T')" "$*" >>"$log"; }

pane="${HERDR_ACTIVE_PANE_ID:-}"

# Fall back to the focused pane if the active-pane env var is missing.
if [ -z "$pane" ]; then
  panes_json=$("$herdr_bin" pane list 2>&1)
  pane=$(printf '%s' "$panes_json" \
    | jq -r '.result.panes[] | select(.focused) | .pane_id' 2>/dev/null | head -1)
fi

if [ -z "$pane" ]; then
  note "no focused pane; \`$herdr_bin pane list\` said: ${panes_json:-<unset>}"
  exit 0
fi

# Foreground process name of the focused pane (needs jq; degrades gracefully).
info_json=$("$herdr_bin" pane process-info --pane "$pane" 2>&1)
proc=$(printf '%s' "$info_json" \
  | jq -r '.result.process_info.foreground_processes[]?.name' 2>/dev/null \
  | grep -iE '^n?vim$' | head -1)

case "$info_json" in
  *protocol_mismatch*)
    note "protocol mismatch talking to the server -- run \`herdr status\`, then restart the Herdr server"
    exit 0
    ;;
esac

if [ -n "$proc" ]; then
  case "$dir" in
    left)  key=ctrl+h ;;
    down)  key=ctrl+j ;;
    up)    key=ctrl+k ;;
    right) key=ctrl+l ;;
    *) exit 0 ;;
  esac
  out=$("$herdr_bin" pane send-keys "$pane" "$key" 2>&1) \
    || note "send-keys $key -> $pane failed: $out"
else
  out=$("$herdr_bin" pane focus --direction "$dir" --pane "$pane" 2>&1) \
    || note "focus $dir from $pane failed: $out"
fi
