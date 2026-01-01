#!/usr/bin/env bash
claude mcp add --transport http context7 https://mcp.context7.com/mcp --header "CONTEXT7_API_KEY: \${CONTEXT7_API_KEY}"

claude mcp add --transport http vercel https://mcp.vercel.com