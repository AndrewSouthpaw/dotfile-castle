#!/usr/bin/env bash
set -euo pipefail

# ----- read payload from stdin, or env var, or arg -----
if [ -t 0 ]; then
  # no stdin; try env or arg; last resort: {}
  payload="${CLAUDE_PAYLOAD:-${1:-{}}}"
else
  payload="$(cat)"
fi

# If jq is missing, bail gracefully
if ! command -v jq >/dev/null 2>&1; then
  # Fallback: static message if jq isn't available
  /opt/homebrew/bin/terminal-notifier \
    -title "Claude Code" \
    -message "Notification (jq not installed)" \
    -sound Submarine
  exit 0
fi

# ----- pull a title/message from likely fields with safe fallbacks -----
hook_event="$(jq -r '.hook_event_name // empty' <<<"$payload")"
notification_type="$(jq -r '.notification_type // empty' <<<"$payload")"

# Build a meaningful title from the hook event.
case "$hook_event" in
  Stop)         title="Claude Code — Done" ;;
  Notification) title="Claude Code — Input Needed" ;;
  *)            title="Claude Code" ;;
esac

# Build a meaningful message. Claude Code sends a generic .message field,
# so we enrich it based on notification_type.
case "$notification_type" in
  permission_prompt)  message="Waiting for permission approval" ;;
  question)           message="Claude has a question for you" ;;
  *)
    message="$(jq -r '
      [ .message
      , .body
      , .text
      , .data.message
      , .notification.message
      , .reason
      , .status
      ] | map(select(type=="string" and length>0)) | first // "Done"
    ' <<<"$payload")"
    ;;
esac

# Append the working directory basename for context.
cwd_name="$(jq -r '.cwd // empty' <<<"$payload" | xargs basename 2>/dev/null || true)"
if [ -n "$cwd_name" ]; then
  message="$message ($cwd_name)"
fi

# Optional: severity -> sound mapping
severity="$(jq -r '.severity // .data.severity // "info"' <<<"$payload" | tr '[:upper:]' '[:lower:]')"
case "$severity" in
  error|fatal) sound="Basso" ;;
  warning)    sound="Submarine" ;;
  info|*)     sound="Submarine" ;;
esac

# Optional: open a URL if present
open_url="$(jq -r '
  .url // .data.url // .notification.url // empty
' <<<"$payload")"

# Truncate overly long messages (terminal-notifier has UI limits)
max=300
if [ "${#message}" -gt "$max" ]; then
  message="${message:0:$max}…"
fi

args=(
  -title "$title"
  -message "$message"
  -sound "$sound"
  -group "claude.code"     # lets you update/suppress duplicate bubbles
)
if [ -n "$open_url" ]; then
  args+=( -open "$open_url" )
fi

/opt/homebrew/bin/terminal-notifier "${args[@]}"