#!/bin/bash

PORT=8765
DIR="$(cd "$(dirname "$0")" && pwd)"

echo "启动本地服务..."
pkill -f "python3 -m http.server $PORT" 2>/dev/null
cd "$DIR" && python3 -m http.server $PORT > /dev/null 2>&1 &

echo "启动 Cloudflare 隧道，请稍候..."
cloudflared tunnel --url http://localhost:$PORT 2>&1 | while read line; do
  echo "$line" | grep -o 'https://[a-z0-9-]*\.trycloudflare\.com' | while read url; do
    echo ""
    echo "✅ 访问地址：${url}/prototype.html"
    echo ""
  done
done
