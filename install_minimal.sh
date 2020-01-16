#!/bin/sh

# MINIMAL INSTALLATION (ESSENTIAL PACKAGES I NEED TO INSTALL)
# By Armando Caussade, http://armandocaussade.org/
# Version 1.0.  January 12, 2020.  Tested in Linux Mint 19 Cinnamon 64-bit and 32-bit.

  echo "Installation of a minimal system for Linux Mint 19."
  echo "This script requires a live, broadband Internet connection."
  echo

# I. PREPARATION FOR INSTALLATION

  cd ~
  sudo dpkg --add-architecture i386
  sudo add-apt-repository -y multiverse
  sudo apt-get update -y
  sudo apt-get dist-upgrade -y

# II. UNNEEDED PACKAGES

# I like to remove a few pre-installed applications that I seldom use [6 for Linux Mint 19.3].

  sudo apt remove -y rhythmbox-plugin-tray-icon rhythmbox-plugins rhythmbox-data rhythmbox hexchat-common hexchat

# I like to remove most language packages [55 for Linux Mint 19.3], but have chosen to keep the following: libreoffice-help-en-us libreoffice-help-es libreoffice-l10n-es hunspell-en-us hunspell-es hyphen-en-us mythes-en-us wamerican wspanish; the command below will remove the unwanted ones.

  sudo apt remove -y libreoffice-help-de libreoffice-help-en-gb libreoffice-help-fr libreoffice-help-it libreoffice-help-pt libreoffice-help-pt-br libreoffice-help-ru libreoffice-help-zh-cn libreoffice-help-zh-tw libreoffice-l10n-de libreoffice-l10n-en-gb libreoffice-l10n-en-za libreoffice-l10n-fr libreoffice-l10n-it libreoffice-l10n-pt libreoffice-l10n-pt-br libreoffice-l10n-ru libreoffice-l10n-zh-cn libreoffice-l10n-zh-tw hunspell-de-at-frami hunspell-de-ch-frami hunspell-de-de-frami hunspell-en-au hunspell-en-ca hunspell-en-gb hunspell-en-za hunspell-fr hunspell-fr-classical hunspell-it hunspell-pt-br hunspell-pt-pt hunspell-ru hyphen-de hyphen-en-ca hyphen-en-gb hyphen-fr hyphen-it hyphen-pt-br hyphen-pt-pt hyphen-ru mythes-de mythes-de-ch mythes-en-au mythes-fr mythes-it mythes-pt-pt mythes-ru wbrazilian wbritish wfrench witalian wngerman wogerman wportuguese wswiss

# I also like to remove most font packages [86 for Linux Mint 19.3], but have chosen to keep the following: fonts-dejavu-core fonts-droid-fallback fonts-freefont-ttf fonts-liberation fonts-liberation2 fonts-mathjax fonts-noto-cjk fonts-noto-color-emoji fonts-noto-mono fonts-opensymbol fonts-ubuntu; the command below will remove the unwanted ones.
  
  sudo apt remove -y fonts-beng fonts-beng-extra fonts-deva fonts-deva-extra fonts-gargi fonts-gubbi fonts-gujr fonts-gujr-extra fonts-guru fonts-guru-extra fonts-indic fonts-kacst fonts-kacst-one fonts-kalapi fonts-khmeros-core fonts-knda fonts-lao fonts-lklug-sinhala fonts-lohit-beng-assamese fonts-lohit-beng-bengali fonts-lohit-deva fonts-lohit-gujr fonts-lohit-guru fonts-lohit-knda fonts-lohit-mlym fonts-lohit-orya fonts-lohit-taml fonts-lohit-taml-classical fonts-lohit-telu fonts-mlym fonts-nakula fonts-navilu fonts-orya fonts-orya-extra fonts-pagul fonts-sahadeva fonts-samyak-deva fonts-samyak-gujr fonts-samyak-mlym fonts-samyak-taml fonts-sarai fonts-sil-abyssinica fonts-sil-padauk fonts-smc fonts-smc-anjalioldlipi fonts-smc-chilanka fonts-smc-dyuthi fonts-smc-karumbi fonts-smc-keraleeyam fonts-smc-manjari fonts-smc-meera fonts-smc-rachana fonts-smc-raghumalayalamsans fonts-smc-suruma fonts-smc-uroob fonts-taml fonts-telu fonts-telu-extra fonts-thai-tlwg fonts-tibetan-machine fonts-tlwg-garuda fonts-tlwg-garuda-ttf fonts-tlwg-kinnari fonts-tlwg-kinnari-ttf fonts-tlwg-laksaman fonts-tlwg-laksaman-ttf fonts-tlwg-loma fonts-tlwg-loma-ttf fonts-tlwg-mono fonts-tlwg-mono-ttf fonts-tlwg-norasi fonts-tlwg-norasi-ttf fonts-tlwg-purisa fonts-tlwg-purisa-ttf fonts-tlwg-sawasdee fonts-tlwg-sawasdee-ttf fonts-tlwg-typewriter fonts-tlwg-typewriter-ttf fonts-tlwg-typist fonts-tlwg-typist-ttf fonts-tlwg-typo fonts-tlwg-typo-ttf fonts-tlwg-umpush fonts-tlwg-umpush-ttf fonts-tlwg-waree fonts-tlwg-waree-ttf

# After removing the font packages, make sure to run the command below.
  sudo dpkg-reconfigure fontconfig

# III. MAIN PACKAGES

# Install 10 preliminary packages:
  INSTALL_PACKAGES_1="numlockx dconf-editor conky-all qt5-default software-properties-common apt-transport-https build-essential devscripts python-pip python3-pip" # "python-pip" should automatically install as a dependency the "python-setuptools" and "python-dev" packages.
  for i in $INSTALL_PACKAGES_1; do
  sudo apt-get install -y $i
  done

# Install 12 essential terminal packages:
  INSTALL_PACKAGES_2="udfclient udftools unrar-free safecopy testdisk gddrescue atop htop ncdu archivemount nnn mc" # "udfclient" and "udftools" are useful with optical disc burning.
  for i in $INSTALL_PACKAGES_2; do
  sudo apt-get install -y $i

# Install 8 useful graphical applications:
  INSTALL_PACKAGES_3="pdfshuffler xfe gsmartcontrol smart-notifier gtkhash kfind k3b acetoneiso" # "k3b" should automatically install as a dependency the "libk3b7-extracodecs" package.
  for i in $INSTALL_PACKAGES_3; do
  sudo apt-get install -y $i
  done

# Install 12 multimedia packages:
  INSTALL_PACKAGES_4="mpg123 sox fluid-soundfont-gm fluid-soundfont-gs asunder audacious pavucontrol xplayer lame xfburn" # "lame" should automatically install as a dependency the "libmp3lame0" package.
  for i in $INSTALL_PACKAGES_4; do
  sudo apt-get install -y $i
  done
  sudo apt install -y libdvd-pkg regionset
  sudo dpkg-reconfigure libdvd-pkg # Use this command to configure the "libdvd-pkg" metapackage.
  sudo apt-mark hold libdvd-pkg libdvdcss2 # Use this command to lock the package and prevent removal or unwanted upgrades.

# IV. INSTALLATION WRAP-UP

  sudo apt-get install -fy
  sudo apt-get full-upgrade -y
  sudo apt autoremove
  sudo apt clean

# IV. OPTIONAL PACKAGES

# Afterwards, install 2 optional packages: GoTop and MediaInfo Tab
 wget http://github.com/cjbassi/gotop/releases/download/3.0.0/gotop_3.0.0_linux_386.tgz
 tar xvf gotop_3.0.0_linux_386.tgz
 sudo install gotop -t /usr/local/bin
 wget http://github.com/linux-man/nemo-mediainfo-tab/releases/download/v1.0/nemo-mediainfo-tab_1.0_all.deb
 sudo apt install -y ./nemo-mediainfo-tab_1.0_all.deb
 rm gotop* nemo*

# Finally, install 2 other packages: Gparted, together with the Gpart utility
  sudo apt install -y gpart gparted

# END
