---
name: no-escaped-backticks-in-heredoc
description: Inside a quoted heredoc (<<'EOF') backticks are literal; escaping them leaks backslashes into the output
metadata:
  type: reference
---

With a quoted heredoc delimiter (`<<'EOF'`), the body is literal. Writing `` \` `` lands a literal backslash in the output. Escaped backticks once showed up in PR descriptions on GitHub and Andrew called it whack.

**How to apply:** Never escape backticks in a quoted heredoc. Escape only under an unquoted `<<EOF`. Safer still for markdown: write a temp file and pass it with `gh pr edit --body-file`.
