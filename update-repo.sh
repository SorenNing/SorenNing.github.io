#!/bin/bash
cd /var/mobile/Documents/SorenNing

echo "📦 生成索引..."
dpkg-scanpackages -m debs /dev/null > Packages
gzip -9c Packages > Packages.gz

echo "✅ 索引生成完成："
ls -lh Packages Packages.gz

echo "📤 推送到 GitHub..."
git add .
git commit -m "Update repo $(date +%Y%m%d-%H%M%S)"
git push

echo "🎉 完成！等1分钟后去Sileo刷新源。"
