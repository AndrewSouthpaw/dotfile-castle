---
name: socket-firewall-pollutes-stdout
description: Socket Firewall and CLI upgrade banners pollute stdout; strip to the JSON before parsing
metadata:
  type: reference
---

On Andrew's machine, Socket Firewall wraps yarn-invoked commands and injects `Protected by Socket Firewall` banners into stdout, which breaks `| jq`. CLIs like eas-cli print upgrade banners the same way.

**How to apply:** Strip first: `| grep -m1 '^{'` for one-line JSON, `| sed -n '/^{/,$p'` or `awk '/^\{/{f=1} f'` for multi-line.
