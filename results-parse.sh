#!/bin/bash
# This is script-companion that builds database results
# You can use it to make some fancy graphics or infographics

DesktopArray=("AfterStep" "Android" "Asturix On" "Athene" "Awesome" "Blackbox" "Budgie" "Chromebooks" "Chromium" "Cinnamon" "Consort" "Data Rescue" "Deepin" "dwm" "EDE" "Enlightenment" "EOS Shell (GNOME)" "Esther" "Firefox" "Fluxbox" "Free Software" "FVWM" "GNOME" "Haiku" "Hawaii" "i3" "IceWM" "Ion" "JWM" "KDE" "KDE Plasma" "Kodi" "KolibriOS" "LXDE" "LXQt" "Manokwari" "MATE" "MeeGo" "Metacity" "Mezzo" "Moblin" "Moksha (Enlightenment)" "No desktop" "No Desktop" "Nomad (Plasma 5)" "Omxplayer" "Openbox" "Pantheon" "Pinboard" "Razor-qt" "ReactOS Explorer" "RetroArch" "ROX" "Sagarmatha" "SLWM" "Trinity" "TWM" "UKUI" "Unity" "Ututo" "WMaker" "XBMC Media Centre" "Xfce" "Xfce (Gala)" "Zesktop")
CountryArray=("Algeria" "Argentina" "Australia" "Austria" "Belgium" "Bhutan" "Bosnia and Herzegovina" "Brazil" "Bulgaria" "Cambodia" "Canada" "Chile" "China" "Cuba" "Czech Republic" "Denmark" "Ecuador" "Egypt" "Finland" "France" "Germany" "Greece" "Guatemala" "Hong Kong" "Hungary" "India" "Indonesia" "Iran" "Ireland" "Isle of Man" "Israel" "Italy" "Japan" "Jordan" "Latvia" "Lithuania" "Malaysia" "Malta" "Mexico" "Mongolia" "Nepal" "Netherlands" "New Zealand" "Nigeria" "Norway" "Oman" "Peru" "Philippines" "Poland" "Portugal" "Puerto Rico" "Réunion" "Romania" "Russia" "Serbia" "Singapore" "Slovakia" "Slovenia" "South Africa" "South Korea" "Spain" "Sri Lanka" "Sweden" "Switzerland" "Taiwan" "Thailand" "Turkey" "Ukraine" "United Arab Emirates" "United Kingdom" "USA" "Venezuela" "Vietnam")
ArchArray=("acorn26" "acorn32" "alpha" "amiga" "arc" "arm" "armv5tel" "arm64" "armel" "armhf" "atari" "cats" "cobalt" "dreamcast" "emips" "evbarm" "evbmips" "evbppc" "evbsh3" "ews4800mips" "hp300" "hp700" "hpcarm" "hpcmips" "hpcsh" "hppa" "i386" "i486" "i586" "i686" "ia64" "ibmnws" "ix86" "luna68k" "m68010" "m68k" "mips" "mipsco" "mipsel" "mvme68k" "mvmeppc" "news68k" "newsmips" "ns32k" "ofppc" "pmax" "powerpc" "ppc64" "ppc64el" "prep" "ps2" "ps3" "s390" "s390x" "sandpoint" "sgimips" "sh3eb" "sh3el" "sh5" "shark" "sparc32" "sparc64" "sun2" "sun3" "vax" "x68k" "x86_64" "xbox" "zaurus")
StatusArray=("Active" "Dormant" "Discontinued")
BasedArray=("Android" "Arch" "CentOS" "CRUX" "Debian" "Debian (Stable)" "Debian (Testing)" "Debian (Unstable)" "Fedora" "FreeBSD" "Gentoo" "Independent" "KDE neon" "KNOPPIX" "LFS" "Mageia" "Mandriva" "Manjaro" "OpenBSD" "openSUSE" "PCLinuxOS" "Puppy" "Red Hat" "rPath" "sidux" "Slackware" "SliTaz" "Solaris" "Ubuntu" "Ubuntu (LTS)" "Tiny Core" "Zenwalk")

cd $(date +%d.%m.%Y)

# Desktop count
echo "================================================================================"
echo "Desktop environments"
echo "================================================================================"
for dsk in "${DesktopArray[@]}"; do
x=$(cat *.results | grep "$dsk" | wc -l)
[[ $x -ge 4 ]] && echo "$dsk : $x"
done


# Countries count
echo "================================================================================"
echo "Countries (origin) list"
echo "================================================================================"
for cntr in "${CountryArray[@]}"; do
x=$(cat *.results | grep "$cntr" | grep Origin | wc -l)
[[ $x -ge 4 ]] && echo "$cntr : $x"
done

# Arch count
echo "================================================================================"
echo "Architectures"
echo "================================================================================"
for arch in "${ArchArray[@]}"; do
x=$(cat *.results | grep "$arch" | grep Architecture | wc -l)
[[ $x -ge 4 ]] && echo "$arch : $x"
done

# Status count
echo "================================================================================"
echo "Statuses"
echo "================================================================================"
for status in "${StatusArray[@]}"; do
x=$(cat *.results | grep "$status" | grep Status | wc -l)
[[ $x -ge 4 ]] && echo "$status : $x"
done

# Based count
echo "================================================================================"
echo "Based on"
echo "================================================================================"
for based in "${BasedArray[@]}"; do
x=$(cat *.results | grep "$based" | grep "Based On" | wc -l)
[[ $x -ge 4 ]] && echo "$based : $x"
done
