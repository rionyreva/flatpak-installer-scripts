#!/bin/bash

# Add Flathub repository if it is not already added
if ! flatpak remote-list | grep -q "flathub"; then
  echo "Adding Flathub repository..."
  flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo
else
  echo "Flathub repository is already added."
fi

# List of applications to install. Specify multiple packages in a new line.
apps=(
  org.desmume.DeSmuME
  org.DolphinEmu.dolphin-emu
  org.duckstation.DuckStation
  org.mamedev.MAME
  ca._0ldsk00l.Nestopia
  net.pcsx2.PCSX2
  org.ppsspp.PPSSPP
  com.github.Rosalie241.RMG
  com.snes9x.Snes9x
  io.mgba.mGBA
)

# Install each application for the user.
for app in "${apps[@]}"; do
  flatpak install flathub --user "$app" -y
done
