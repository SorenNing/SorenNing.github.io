#!/bin/bash
cd /var/mobile/Documents/SorenNing.github.io

echo "📦 生成 Packages 索引..."
dpkg-scanpackages -m debs /dev/null > Packages
gzip -9c Packages > Packages.gz

echo "📝 生成 Release 文件（修改源名字）..."
apt-ftparchive release . > Release.tmp
sed -i 's/^Origin:.*/Origin: 小宁的源/' Release.tmp
sed -i 's/^Label:.*/Label: 小宁的源/' Release.tmp
sed -i 's/^Description:.*/Description: SorenNing 个人越狱源/' Release.tmp
mv Release.tmp Release

echo "✅ 索引完成："
ls -lh Packages Packages.gz Release

echo "📤 推送..."
git add .
git commit -m "update $(date +%Y%m%d-%H%M%S)"
git push

echo "🎉 搞定！去Sileo删除重加看新名字"
