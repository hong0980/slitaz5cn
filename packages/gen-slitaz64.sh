#!/bin/sh

ROOTFS="/tmp/rootfs"
# https://sourceforge.net/projects/winly/files/slitaz/
ps="sudocn-1.8.4 ghost-5.0.1 linux64-3.16.55 yong-2.5.0 transmission-web-contrl-1.61 teasiu-5.0 xarchiver-cn-0.5.2 rar-6.0.0"
for p in $ps; do
	tazpkg install $p.tazpkg --root=$ROOTFS --local --forced
done
tazpkg get xz tar curl git xorg-xf86-input-vmmouse grsync bash locale-zh_CN-extra iptables linux64-netfilter isomaster gvfs-smb dosfstools mdadm firmware-atheros exfat-utils gftp xorg-xf86-video-vmware p7zip-full zip unzip cpio gzip transmission-daemon libevent axel aria2 qbittorrent deluge
tazpkg install xz*.tazpkg --root=$ROOTFS --local
tazpkg install tar*.tazpkg --root=$ROOTFS --local
tazpkg install curl*.tazpkg --root=$ROOTFS --local
tazpkg install git*.tazpkg --root=$ROOTFS --local
yes | tazpkg install bash*.tazpkg --root=$ROOTFS --local
tazpkg install locale-zh_CN-extra*.tazpkg --root=$ROOTFS --local
tazpkg install linux64-netfilter*.tazpkg --root=$ROOTFS --local
tazpkg install firmware-atheros*.tazpkg --root=$ROOTFS --local
tazpkg install iptables*.tazpkg --root=$ROOTFS --local
tazpkg install exfat-utils*.tazpkg --root=$ROOTFS --local --forced
tazpkg install gftp*.tazpkg --root=$ROOTFS --local
tazpkg install xorg-xf86-video-vmware*.tazpkg --root=$ROOTFS --local
tazpkg install xorg-xf86-input-vmmouse*.tazpkg --root=$ROOTFS --local
tazpkg install p7zip-full*.tazpkg --root=$ROOTFS --local
tazpkg install zip*.tazpkg --root=$ROOTFS --local
tazpkg install unzip*.tazpkg --root=$ROOTFS --local
tazpkg install cpio*.tazpkg --root=$ROOTFS --local
tazpkg install gzip*.tazpkg --root=$ROOTFS --local
tazpkg install libevent*.tazpkg --root=$ROOTFS --local
tazpkg install transmission-daemon*.tazpkg --root=$ROOTFS --local
tazpkg install aria2*.tazpkg --root=$ROOTFS --local
tazpkg install deluge*.tazpkg --root=$ROOTFS --local
tazpkg install qbittorrent*.tazpkg --root=$ROOTFS --local
tazpkg install isomaster*.tazpkg --root=$ROOTFS --local
tazpkg install gvfs-smb*.tazpkg --root=$ROOTFS --local
tazpkg install dosfstools*.tazpkg --root=$ROOTFS --local
tazpkg install mdadm*.tazpkg --root=$ROOTFS --local
tazpkg install grsync*.tazpkg --root=$ROOTFS --local
tazpkg install axel*.tazpkg --root=$ROOTFS --local
#tazpkg get xorg-xf86-video-geode xorg-xf86-video-ati xorg-xf86-video-nouveau xorg-xf86-video-intel xorg-xf86-video-radeonhd xorg-xf86-video-nv
#tazpkg install xorg-xf86-video*.tazpkg --root=$ROOTFS --local
#tazpkg -gi openvpn --root=$ROOTFS --local
tazpkg -gi linux64-video --root=$ROOTFS --local
tazpkg -gi linux64-cifs --root=$ROOTFS --local
tazpkg -gi linux64-acpi --root=$ROOTFS --local
tazpkg -gi linux64-configfs --root=$ROOTFS --local
tazpkg -gi linux64-aufs --root=$ROOTFS --local
tazpkg -gi nfs-utils --root=$ROOTFS --local
[ -e $ROOTFS/etc/xdg/openbox/menu.zh_CN.xml ] && cp -vrf $ROOTFS/etc/xdg/openbox/menu.zh_CN.xml $ROOTFS/etc/xdg/openbox/menu.en.xml
[ -e updatetime.txt ] && cp -va updatetime.txt $ROOTFS/etc
mkdir -p $ROOTFS/etc/skel/.config/slitaz
echo "root" > $ROOTFS/etc/skel/.config/slitaz/subox.conf
echo "Name[zh_CN]=WiFi无线网络配置" >> $ROOTFS/usr/share/applications/wifi-box.desktop
echo "Name[zh_CN]=设置系统语言" >> $ROOTFS/usr/share/applications/tazbox-locale.desktop
echo "Name[zh_CN]=设置系统时区" >> $ROOTFS/usr/share/applications/tazbox-tz.desktop
echo "Name[zh_CN]=软件包管理器" >> $ROOTFS/usr/share/applications/tazpanel-pkgs.desktop
echo "Name[zh_CN]=设置账号密码" >> $ROOTFS/usr/share/applications/passwd.desktop
echo "Name[zh_CN]=预设应用程序" >> $ROOTFS/usr/share/applications/tazbox-tazapps.desktop
echo "Name[zh_CN]=本地语言包管理" >> $ROOTFS/usr/share/applications/tazbox-manage_i18n.desktop
echo "Name[zh_CN]=国际键盘设置" >> $ROOTFS/usr/share/applications/tazbox-keymap.desktop
rm -rf $ROOTFS/usr/share/locale/zh_TW
rm -rf $ROOTFS/usr/share/locale/ca
rm -rf $ROOTFS/usr/share/locale/da
rm -rf $ROOTFS/usr/share/locale/de
rm -rf $ROOTFS/usr/share/locale/el
rm -rf $ROOTFS/usr/share/locale/es
rm -rf $ROOTFS/usr/share/locale/fa
rm -rf $ROOTFS/usr/share/locale/fr
rm -rf $ROOTFS/usr/share/locale/id
rm -rf $ROOTFS/usr/share/locale/it
rm -rf $ROOTFS/usr/share/locale/ja
rm -rf $ROOTFS/usr/share/locale/pl
rm -rf $ROOTFS/usr/share/locale/pt_BR
rm -rf $ROOTFS/usr/share/locale/ro
rm -rf $ROOTFS/usr/share/locale/ru
rm -rf $ROOTFS/usr/share/locale/sv
rm $ROOTFS/var/lib/tazpkg/packages.*
rm $ROOTFS/var/lib/tazpkg/ID*
rm $ROOTFS/var/lib/tazpkg/files*
rm $ROOTFS/var/lib/tazpkg/*.txt
rm $ROOTFS/var/lib/tazpkg/extra.list
sed -i '4i\export XMODIFIERS="@im=yong"' $ROOTFS/etc/skel/.xinitrc
sed -i '5i\export GTK_IM_MODULE=yong' $ROOTFS/etc/skel/.xinitrc
sed -i '6i\yong &' $ROOTFS/etc/skel/.xinitrc
sed -i 's/Monospace/DejaVu Sans Mono/' $ROOTFS/etc/skel/.Xdefaults
sed -i 's/index.html/index.cn.html/' $ROOTFS/etc/skel/Desktop/slitaz-doc.desktop
sed -i 's/httpd/httpd dropbear transmission-daemon/' $ROOTFS/etc/rcS.conf
sed -i 's/UTC/Asia\/\Shanghai/' $ROOTFS/etc/init.d/system.sh
echo '/usr/bin/vlmcsd' >> $ROOTFS/etc/init.d/local.sh
echo "hwclock -s" >> $ROOTFS/etc/init.d/local.sh
echo 'echo "tux:tux" | chpasswd ' >> $ROOTFS/etc/init.d/local.sh
sed -i 's/sh/bash/' $ROOTFS/etc/passwd
# echo "Asia/Shanghai" > $ROOTFS/etc/TZ
# echo 'https://mirrors.aliyun.com/slitaz/packages/5.0/' >$ROOTFS/var/lib/tazpkg/mirror
cp -vf $ROOTFS/etc/skel/.profile $ROOTFS/etc/skel/.bashrc
cat <<-EOF | chroot $ROOTFS
	tazpkg -b sudo
	tazpkg clean-cache
	cd /var/lib/tazpkg
	rm packages.*
	gtk-query-immodules-2.0 --update-cache
EOF
