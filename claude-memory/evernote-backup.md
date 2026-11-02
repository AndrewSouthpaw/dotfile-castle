---
name: evernote-backup
description: Where Andrew's Evernote backup lives and how to refresh it
metadata:
  type: reference
---

Andrew backed up Evernote with [evernote-backup](https://github.com/vzhd1701/evernote-backup) on 2026-10-10.

- `~/Library/CloudStorage/Dropbox/Evernote/en_backup.db`: 3.1 GB SQLite, 2,648 notes after the 2026-10-29 sync. Update: `cd` there, `evernote-backup reauth --oauth-method import` (borrows the desktop session), then `evernote-backup sync`.
- `~/Desktop/Evernote Backup/`: ENEX export, one `.enex` per notebook plus a `Research/` folder.
- The `.db` is self-contained (`journal_mode=delete`). Each note is `lzma.compress(pickle.dumps(note))` in `notes.raw_note`. `evernote-backup export` rebuilds ENEX offline.
