#!/bin/bash
cd /var/mobile/Documents/SorenNing.github.io
dpkg-scanpackages -m debs /dev/null > Packages
gzip -9c Packages > Packages.gz
cat > Release << 'REL'
Origin: Ning
Label: Ning
Suite: stable
Version: 1.0
Architectures: iphoneos-arm iphoneos-arm64 iphoneos-arm64e
Components: main
Description: Ning's Repo
REL
git add .
git commit -m "rename repo to Ning"
git push
