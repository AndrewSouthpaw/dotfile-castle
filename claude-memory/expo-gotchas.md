---
name: expo-gotchas
description: Expo Router boundaries catch descendants only; eas.json env deep-merges; EAS logs are brotli; Metro cache ignores NODE_ENV
metadata:
  type: reference
---

- An `ErrorBoundary` exported from an Expo Router route catches what descendants throw. A throw in the layout's own body escapes to the root, which resets navigation and remounts the route. Render a child that throws instead.
- In `eas.json`, a profile's `env` deep-merges key by key through `extends`. Check the resolved profile with `eas config --platform ios --profile <p> --non-interactive --json`. Precedence against an EAS server-side variable of the same name is undocumented, so don't define both.
- EAS build pages need auth. `eas build:view <id> --json` gives `logFiles[0]`, a signed URL (~15 min) curl can fetch. The payload is brotli, not gzip: decode with `zlib.brotliDecompressSync`. Lines are JSON with `marker`/`msg`/`result`. `UNKNOWN_CUSTOM_BUILD_ERROR` means a custom build step failed.
- Metro's transform cache key ignores `NODE_ENV` and `babel.config.js` contents. Only `--clear` invalidates them. Never make a babel option depend on `NODE_ENV`. If babel inlines `process.env`, the cache holds those secrets.
- Editing `metro.config.js` changes the Expo fingerprint and can trigger a full native dev-client rebuild.
