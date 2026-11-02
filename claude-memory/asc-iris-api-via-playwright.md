---
name: asc-iris-api-via-playwright
description: Read App Store Connect data via its iris API from a Playwright browser session Andrew signs into
metadata:
  type: reference
---

App Store Connect has no handy CLI. Load ASC in the Playwright MCP browser, have Andrew sign in by hand (2FA, sessions expire within a day), then `browser_evaluate` with `fetch('/iris/v1/<path>', {credentials: 'include'})`. Page `innerText` drops form values, so the API is the reliable read.

- Paths: `apps/{id}/appStoreVersions`, `appStoreVersions/{id}?include=build,appStoreReviewDetail`, `.../appStoreVersionLocalizations`, `apps/{id}/dataUsages?include=category,purpose,dataProtection`, `builds?filter[app]={id}&sort=-uploadedDate`, `apps/{id}/reviewSubmissions`.
- `browser_evaluate`'s `filename` writes only under the worktree or `.playwright-mcp/`, and refuses symlinked dirs.
- Responses can include credentials. Delete dumps after reading and never print them.
