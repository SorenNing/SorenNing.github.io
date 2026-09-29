#!/bin/bash
cd /var/mobile/Documents/SorenNing.github.io
dpkg-scanpackages -m debs /dev/null > Packages
gzip -9c Packages > Packages.gz
apt-ftparchive release . > Release.tmp
sed -i 's/^Origin:.*/Origin: /' Release.tmp
sed -i 's/^Label:.*/Label:/' Release.tmp
mv Release.tmp Release
git add .
git commit -m "rename repo"
git push
