#!/bin/bash

[ $TARGET_DEVICE = " " ] && TARGET_DEVICE=64
sed -i 's|iso.*boot|iso-old/boot|' dockerfile-rootfs*
sed -i 's/slitaz/\$(date +%m%d-%H%M)-slitaz/' ./*/iso.sh
sed -i '1i\https://mirrors.aliyun.com/slitaz' packages/mirrors.list
sed -i '/profile/aecho "Asia/Shanghai" > $ROOTFS/etc/TZ\nwget -O $ROOTFS/bin/bpm git.io/bpm --no-check-certificate && chmod +x $ROOTFS/bin/bpm\nwget -O $ROOTFS/bin/ansi git.io/ansi --no-check-certificate && chmod +x $ROOTFS/bin/ansi' packages/gen-slitaz*
wget -qO packages/updatetime.txt slitaz.cn/dl/rolling/slitaz-rolling-core64-chinese-updatetime.txt --no-check-certificate
sed -i '/dockerd.tazpkg/ {s/ --nodeps//}' packages/gen-slitaz*
sed -i '/zh_CN\*.tazpkg/ {s/ --nodeps//}; {s/zh_CN\*/zh_CN-extra\*/}' packages/gen-slitaz*

ps="dockerd sudocn-1.8.4 ghost-5.0.1 linux64-3.16.55 linux-3.16.55 yong-2.5.0 transmission-web-contrl-1.61 teasiu-5.0 xarchiver-cn-0.5.2 rar-6.0.0"
for p in $ps; do
	wget -nv -O packages/$p.tazpkg slitaz.cn/dl/$p.tazpkg --no-check-certificate || \
	wget -nv -O packages/$p.tazpkg downloads.sourceforge.net/project/winly/slitaz/$p.tazpkg --no-check-certificate
done

[[ $TARGET_DEVICE = 32 ]] && {
	iso=slitaz-rolling-core.iso
} || {
	iso=slitaz-rolling-core64.iso
}

for o in $(cat packages/mirrors.list); do
	wget -nv $o/iso/rolling/$iso
	[ -e $iso ] && break
done

[ -e $iso ] && {
	mkdir iso-old
	7z x $iso -y -r -o./iso-old && rm $iso
	docker build -t newrootfs -f ./dockerfile-rootfs$TARGET_DEVICE .
	docker run --name myrootfs newrootfs
	docker cp myrootfs:/tmp/rootfs-new.gz ./iso$TARGET_DEVICE/mkiso/rootfs.gz
	docker stop myrootfs
	docker rm myrootfs
	docker rmi newrootfs
	cd iso$TARGET_DEVICE
	sh iso.sh
} || exit 1
