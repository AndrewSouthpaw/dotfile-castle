---
name: disk-scan-no-containers
description: Disk scans on Andrew's Mac skip ~/Library/Containers, Group Containers, Dropbox, and CloudStorage
metadata:
  type: feedback
---

Never `du` into `~/Library/Containers` or `~/Library/Group Containers`, and skip `~/Dropbox` and `~/Library/CloudStorage`.

**Why:** On macOS Sequoia each app's sandbox read pops an "iTerm would like to access data from other apps" dialog. A scan triggered a flood. He also asked not to scan Dropbox.

**How to apply:** Measure those as one opaque total or not at all. Use `docker system df` for Docker. Root-only paths need Andrew to run `! sudo du ...`.
