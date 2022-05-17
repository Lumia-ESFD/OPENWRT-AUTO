#!/bin/bash
cd ${GITHUB_WORKSPACE}/OpenWRT/

#mv -f ./.config ./.config
sed -i 's/^[ \t]*//g' ./.config
make defconfig
make download -j8 || make download -j1 V=s
rm -rf $(find ./dl/ -size -1024c)
make -j$(nproc) || make -j1 V=s