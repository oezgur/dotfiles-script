#!/bin/bash

# install all the programs
if ! command -v neofetch &> /dev/null
then
  echo "couldn't find neofetch, would you like to install [Y/n]"
  read answer
  if echo "$answer" | grep -iq "^y" ; then
    sudo apt install neofetch
    echo "installed"
    neofetch --version
  else
    "neofetch not installed, exiting."
    exit
  fi
fi

if ! command -v hx &> /dev/null
then
  echo "couldn't find Helix, would you like to install [Y/n]"
  read answer
  if echo "$answer" | grep -iq "^y" ; then
    sudo add-apt-repository ppa:maveonair/helix-editor
    sudo apt update
    sudo apt install helix
    helix --version
    echo "installed"

if ! command -v kitty &> /dev/null
then
  echo "couldn't find kitty, would you like to install [Y/n]"
  read answer
  if echo "$answer" | grep -iq "^y" ; then
    sudo apt install kitty
    echo "installed"
    kitty --version
  else
    "kitty not installed, exiting."
    exit
  fi
fi

if ! command -v i3 &> /dev/null
  then
    echo "couldn't find i3, would you like to install [Y/n]"
    read answer
    if echo "$answer" | grep -iq "^y" ; then
      # dependencies
      sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool automake
      if ! sudo apt install libxcb-xrm-dev
        echo "libxcb-xrm-dev gave an error; installing the other way..."
        mkdir tmp
        cd tmp
        git clone https://github.com/Airblader/xcb-util-xrm
        cd xcb-util-xrm
        git submodule update --init
        ./autogen.sh --prefix=/usr
        make
        sudo make install
      fi
        sudo add-apt-repository ppa:regolith-linux/release
        sudo apt update
        sudo apt install i3-gaps
        
git clone https://github.com/oezgur/dotfiles
cd dotfiles
# kitty dots
if [ -d "$HOME/.config"]; then
  # it exists
  cp kitty.conf $HOME/.config/kitty/
  cp config.txt $HOME/.config/i3/
  mkdir $HOME/.config/i3/modules/
  cp bar.conf $HOME/.config/i3/modules/
  cp classes.conf $HOME/.config/i3/modules/
  cp exit_mode.conf $HOME/.config/i3/modules/
  cp gaps.conf $HOME/.config/i3/modules/
  cp keymaps.conf $HOME/.config/i3/modules/
  cp resize.conf $HOME/.config/i3/modules/
  cp start.conf $HOME/.config/i3/modules/
  cp theme.conf $HOME/.config/i3/modules/
  cp workspaces.conf $HOME/.config/i3/modules/
  cp config.toml $HOME/.config/helix
  cp ./rofi/config.rasi $HOME/.config/rofi/
fi
  

# Run:

