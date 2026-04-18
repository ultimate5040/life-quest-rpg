#!/usr/bin/env bash
set -euo pipefail

echo "==> apt: headless Chromium runtime deps + 日本語フォント"
sudo apt-get update -qq
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  ca-certificates \
  fonts-noto-cjk \
  libasound2 \
  libatk-bridge2.0-0 \
  libatk1.0-0 \
  libcairo2 \
  libcups2 \
  libdbus-1-3 \
  libdrm2 \
  libgbm1 \
  libglib2.0-0 \
  libnspr4 \
  libnss3 \
  libpango-1.0-0 \
  libxcomposite1 \
  libxdamage1 \
  libxfixes3 \
  libxkbcommon0 \
  libxrandr2 \
  libxshmfence1 \
  libxss1 \
  xdg-utils
sudo rm -rf /var/lib/apt/lists/*

echo "==> npm: Claude Code CLI + chrome-devtools-mcp"
sudo npm install -g @anthropic-ai/claude-code chrome-devtools-mcp

echo "==> puppeteer: Chrome バイナリを ~/.cache/puppeteer に取得"
mkdir -p "$HOME/.cache/puppeteer"
npx --yes puppeteer browsers install chrome || \
  echo "  (失敗してもOK — chrome-devtools-mcp 初回起動時に再試行されます)"

echo ""
echo "==> ready."
echo "    開発サーバ : npm run dev    (http://localhost:8080)"
echo "    Claude起動 : claude"
