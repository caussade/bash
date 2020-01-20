#!/bin/sh

# EXPANDED INSTALLATION (ADDITIONAL PACKAGES I LIKE TO INSTALL)
# By Armando Caussade, http://armandocaussade.org/
# Version 3.0.  January 12, 2020.  Tested in Linux Mint 19 Cinnamon 64-bit.

  echo "Installation of an expanded suite of applications for Linux Mint 19."
  echo "This script requires a live, broadband Internet connection."
  echo

# PREPARATION FOR INSTALLATION

  cd ~
  sudo dpkg --add-architecture i386
  sudo add-apt-repository -y multiverse
  sudo apt-get update -y
  sudo apt-get dist-upgrade -y

# I. ESSENTIAL UTILITIES

# The following 12 essential packages are installed by default on newer Linux Mint systems (18+): syslinux-common wireless-tools inxi vim rsync dosfstools zip unzip ntfs-3g libntfs-3g88 exfat-fuse exfat-utils
# The mint-dev-tools metapackage installer includes utilities such as meld, pyrenamer, git and sublime-text.
INSTALL_PACKAGES_1="debfoster dtrx mint-dev-tools firejail grsync alien clonezilla clamav clamtk chkrootkit glmark2 bleachbit fslint traceroute whois"
  for i in $INSTALL_PACKAGES_1; do
  sudo apt-get install -y $i
  done
# The following packages are not installed by default in newer Linux Mint systems, but are requirements for optical disc burning: wodim (aka cdrecord or cdrtools), cdrskin, cdrdao and dvd+rw-tools; but these are all installed as dependencies of the K3b burning application.  The following packages are also helpful for optical disc burning: genisoimage growisofs cdparanoia sox.

# Install FSearch, MediaInfo Tab, UnetBootin, ddrescue-gui, Touchpad Indicator and Cubic, all from PPA repositories.
  sudo add-apt-repository -y ppa:christian-boxdoerfer/fsearch-daily # Repository for FSearch, an advanced file search utility.
  sudo add-apt-repository -y ppa:caldas-lopes/ppa # Repository for MediaInfo Tab, an extension for the Nemo File manager to display metadata from multimedia files.
  sudo add-apt-repository -y ppa:gezakovacs/ppa # Repository for UnetBootin; this requires the extlinux package, installed before.
  sudo add-apt-repository -y ppa:hamishmb/myppa # Repository for ddrescue-gui, a graphical frontend for the recovery utility GNU ddrescue, aka gddrescue.
  sudo add-apt-repository -y ppa:atareao/atareao # Repository for Touchpad Indicator, an applet to configure laptop touchpad settings.
  sudo add-apt-repository -y ppa:cubic-wizard/release # Repository for Cubic, the custom Ubuntu ISO Creator; this requires the isolinux package, installed before.
  sudo apt-get update -y
INSTALL_PACKAGES_2="fsearch-trunk nemo-mediainfo-tab unetbootin ddrescue-gui touchpad-indicator cubic"
  for i in $INSTALL_PACKAGES_2; do
  sudo apt-get install -y $i
  done

# Install the GoTop terminal activity monitor from its website.
# wget http://github.com/cjbassi/gotop/releases/download/3.0.0/gotop_3.0.0_linux_amd64.deb
# sudo apt-get install -y ./gotop_3.0.0_linux_amd64.deb
# rm gotop_3.0.0_linux_amd64.deb

# Install the PeaZip archiver utility (portable version for 64-bit Linux from its website).
  wget http://osdn.net/projects/peazip/downloads/71536/peazip_6.9.2.LINUX.Qt-2_all.deb
  sudo apt-get install -y ./peazip_6.9.2.LINUX.Qt-2_all.deb
  rm peazip_6.9.2.LINUX.Qt-2_all.deb

# Install the muCommander file manager from its website.
  wget http://github.com/mucommander/mucommander/releases/download/0.9.3-3/mucommander_0.9.3_all.deb
  sudo apt-get install -y ./mucommander_0.9.3_all.deb
  rm mucommander_0.9.3_all.deb

# II. PLUGINS AND EXTENSIONS

# Install the Adobe Flash NPAPI and PPAPI plugins, for Firefox and Chromium, respectively, both from the Ubuntu repository.
  sudo apt-get install -y adobe-flashplugin pepperflashplugin-nonfree
  
# Install Adobe Reader from Adobe's FTP site; this is old, unsupported software from 2013, and should be installed only if necessary.
  sudo apt-get install -y ia32-libs # This dependency is required to run the 32-bit Adobe Reader in 64-bit systems.
  wget ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1_i386linux_enu.deb
  sudo dpkg -i --force-architecture AdbeRdr9.5.5-1_i386linux_enu.deb
  rm AdbeRdr9.5.5-1_i386linux_enu.deb

# Install insfrastructure that will allow setup of an Epson Scanner and an HP printer, all from the Ubuntu repository.
INSTALL_PACKAGES_3="sane sane-utils xsane libsane1 libsane-common hplip hplip-gui hplip-data"
  for i in $INSTALL_PACKAGES_3; do
  sudo apt-get install -y $i
  done

# Install "youtube-dl", a command-line program (and a graphical fron-end) to download videos from YouTube.com.
  wget http://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
  sudo chmod a+rx /usr/local/bin/youtube-dl

# Download and compile "gallery-dl", a command-line program to download images from several hosting sites
  wget -O gallery-dl http://github.com/mikf/gallery-dl/archive/master.tar.gz
  tar -xvf gallery-dl
  cd gallery-dl-master
  sudo python3 setup.py install

# Install DOS and Microsoft Windows compatibility layers, all from the Ubuntu repository.
INSTALL_PACKAGES_4="dosbox dosemu wine32 q4wine winetricks"
  for i in $INSTALL_PACKAGES_4; do
  sudo apt-get install -y $i
  done
  sudo apt-get install -y --install-recommends wine-installer # Run this command as a workaround for a bug that affects Wine on Ubuntu 18.04 and Linux Mint 19.

# Install Vineyard from PPA repository.
  sudo add-apt-repository -y ppa:cybolic/vineyard-testing # Repository for Vineyard.
  sudo apt-get update -y
  sudo apt-get install -y vineyard

# Install gamepad support.
  sudo apt-get install -y joystick jstest-gtk

# Install proprietary drivers and libraries, available from the Ubuntu repository.
  sudo apt-get install -y mint-meta-codecs ttf-mscorefonts-installer

# Install the "lame" and "libdvdcss" libraries to enable MP3 and DVD suport; from Ubuntu 15.10 and Linux Mint 18 onwards, the "libdvd-pkg" metapackage is available to ease the installation of libdvdcss; Lame usually benefits from the "libmp3lame0" package, but this is usually installed as a dependency.
# sudo apt-get install -y lame libdvd-pkg regionset
# sudo dpkg-reconfigure libdvd-pkg
# sudo apt-mark hold libdvd-pkg libdvdcss2

# III. COMMON APPLICATIONS

# The following packages are installed by default in newer Linux Mint systems (18+): firefox, thunderbird, libreoffice, gimp.  But from Linux Mint 19.3 onwards, XPlayer and VLC are not installed by default.

# Install essential applications including GIMP and VLC Media Player, plus some LibreOffice plugins, all from the Ubuntu repository.  The package gimp-data-extras adds a couple of brushes and patterns, while gimp-plugin-registry adds 160 scripts and 19 plugins including GIMP FX Foundry; but please note that the gimp-plugin-registry package is only compatible with GIMP 2.8 and not 2.10.
INSTALL_PACKAGES_5="xplayer vlc browser-plugin-vlc gimp gimp-data gimp-help-common gimp-help-en gimp-data-extras gimp-plugin-registry"
  for i in $INSTALL_PACKAGES_5; do
  sudo apt-get install -y $i
  done

# Install other useful applications, all from the Ubuntu repository.
INSTALL_PACKAGES_6="dillo chromium-browser httrack webhttrack uget filezilla remmina pidgin deluge wireshark nmap zenmap audacity kazam handbrake guvcview cheese devede darktable hugin inkscape blender diffpdf scribus calibre treeline convertall"
  for i in $INSTALL_PACKAGES_6; do
  sudo apt-get install -y $i
  done

# Install Oracle VirtualBox and extension pack, both from the Ubuntu repository.
  sudo apt-get install -y virtualbox-qt virtualbox-ext-pack

# Install MKVToolNix, Shotcut, Avidemux and DVD Styler from PPA repositories.
  sudo add-apt-repository -y ppa:ubuntuhandbook1/dvdstyler # Repository for DVD Styler.
  sudo add-apt-repository -y ppa:haraldhv/shotcut # Repository for Shotcut.
  sudo add-apt-repository -y ppa:ubuntuhandbook1/avidemux # Repository for Avidemux.
  wget -q -O - http://mkvtoolnix.download/gpg-pub-moritzbunkus.txt | sudo apt-key add - # Public key for MKVToolNix.
  sudo apt-add-repository -y 'deb http://mkvtoolnix.download/ubuntu/ bionic main' # Repository for MKVToolNix.
  sudo apt-get update -y
INSTALL_PACKAGES_7="dvdstyler shotcut avidemux2.6-qt avidemux2.6-plugins-qt mkvtoolnix mkvtoolnix-gui" # The latter package installs the Qt packages for Avidemux, as the GTK+ packages are no longer supported.
  for i in $INSTALL_PACKAGES_7; do
  sudo apt-get install -y $i
  done

# Install Skype from Microsoft's repository; the DEB installer will add the Microsoft repository to the system for easy updating.
  wget http://go.skype.com/skypeforlinux-64.deb # or alternatively, wget http://repo.skype.com/latest/skypeforlinux-64.deb
  sudo apt-get install -y ./skypeforlinux-64.deb
  rm skypeforlinux-64.deb

# Install Zoom webinar client from its website.
  wget http://zoom.us/client/latest/zoom_amd64.deb
  sudo apt-get install -y ./zoom_amd64.deb
  rm zoom_amd64.deb

# Install OcenAudio from its website.
  wget http://www.ocenaudio.com/downloads/ocenaudio_mint64.deb
  sudo apt-get install -y ./ocenaudio_mint64.deb
  rm ocenaudio_mint64.deb

# Install Angry IP Scanner from GitHub.
  wget http://github.com/angryip/ipscan/releases/download/3.5.5/ipscan_3.5.5_amd64.deb
  sudo apt-get install -y ./ipscan_3.5.5_amd64.deb
  rm ipscan_3.5.5_amd64.deb

# Install Foliate from GitHub
  wget -O foliate_1.5.3_all.deb http://github.com/johnfactotum/foliate/releases/download/1.5.3/com.github.johnfactotum.foliate_1.5.3_all.deb
  sudo apt-get install -y ./foliate_1.5.3_all.deb
  rm foliate_1.5.3_all.deb

# Install Buka from GitHub.
  wget http://github.com/oguzhaninan/Buka/releases/download/v1.0.0/Buka_1.0.0_amd64.deb
  sudo apt-get install -y ./Buka_1.0.0_amd64.deb
  rm Buka_1.0.0_amd64.deb

# IV. SPECIALTY SOFTWARE

# Install Google Earth Pro, a free package since 2015; the DEB installer will add the Google repository to the system for easy updating.
# Formerly the instalation of Google Earth Pro used to be tricky, as the installer sometimes requires dependencies that may not be available from the Ubuntu repository.
  wget -O google-earth64.deb http://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb
  sudo apt-get install -y ./google-earth64.deb
  rm google-earth64.deb

# Install StarPlot and Stellarium from the Ubuntu repository.
  sudo apt-get install -y starplot stellarium # The "stellarium" package also downloads and installs the package "stellarium-data" (123 MB).
# I sometimes like to install the KDE program kstars.  This application may also benefit from two optional data packages (57 MB): kstars-data kstars-data-extra-tycho2
  
# Install Celestia from the Ubuntu repository; this was supported until 2015 with Ubuntu 15.10 and Linux Mint 17, as it depends on outdated libraries; the following will force an installation on Ubuntu 16.04+ and Linux Mint 18+.
  wget http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb # This downloads the PNG library runtime for Ubuntu and Linux Mint.
  sudo dpkg -i libpng12-0_1.2.54-1ubuntu1_amd64.deb # This installs the PNG library runtime for Ubuntu.
  sudo apt-get install -y liblua5.1-0 freeglut3 libgtkglext1 libgnome2-0 libgnomeui-0 # This downloads and installs essential dependencies.
  wget http://mirrors.kernel.org/ubuntu/pool/universe/c/celestia/celestia-common_1.6.1+dfsg-3_all.deb # This will download the Celestia core file (27 MB) for all Linux systems.
  wget http://mirrors.kernel.org/ubuntu/pool/universe/c/celestia/celestia-gnome_1.6.1+dfsg-3_amd64.deb # This provides the GNOME front-end, which also works with Cinnamon and MATE; otherwise try the "celestia-kde" package.
  wget http://mirrors.kernel.org/ubuntu/pool/multiverse/c/celestia-nonfree/celestia-common-nonfree_1.6.1-1_all.deb # This will download the main Celestia data file (9 MB) which includes basic planetary textures.
  sudo dpkg -i celestia* # This will install the previously downloaded application files.
  rm libpng12-0_1.2.54-1ubuntu1_amd64.deb celestia*

# Install Sky Chart (i.e. Cartes du Ciel) from its own repository, together with optional large databases.
# A required dependency, libpasastro, should be installed automatically with the program package; otherwise it can be obtained here: http://sourceforge.net/projects/libpasastro/files/version_1.1-20/
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8B8B57C1AA716FC2 # Public key for Sky Chart.
  sudo sh -c "echo deb http://www.ap-i.net/apt stable main > /etc/apt/sources.list.d/skychart.list" # Repository for Sky Chart.
  sudo apt-get update -y
  sudo apt-get install -y --no-install-recommends skychart
  sudo apt-get install -y skychart-data-stars skychart-data-dso skychart-data-pictures # These packages (288 MB) will install additional star catalogs and deep-sky objects on Sky Chart.

# INSTALLATION WRAP-UP

  sudo dpkg-reconfigure libdvd-pkg # Run this command as a workaround for a bug that affects libdvd-pkg on Ubuntu 18.04 and Linux Mint 19.
  sudo apt-get install -fy
  sudo apt-get full-upgrade -y
  sudo apt-get autoremove
  sudo apt-get clean

# END
