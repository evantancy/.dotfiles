#!/bin/bash
if [ -f ~/.claude-code-secrets-kv-pairs.enc ]; then
  eval "$(sops -d ~/.claude-code-secrets-kv-pairs.enc | sed 's/^/export /')"
fi
exec claude "$@"
