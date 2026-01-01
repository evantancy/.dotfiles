#!/bin/bash

if [ -f ~/.claude-code-secrets-kv-pairs.enc ]; then
  sops -d ~/.claude-code-secrets-kv-pairs.enc | while IFS= read -r line; do
    if [ -n "$line" ]; then
      echo "export $line" >> "$CLAUDE_ENV_FILE"
    fi
  done
fi

exit 0
