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
  com.github.tchx84.Flatseal
  io.github.giantpinkrobots.flatsweep
  io.github.shiftey.Desktop
  org.keepassxc.KeePassXC
)

# Install each application for the user.
for app in "${apps[@]}"; do
  flatpak install flathub --user "$app" -y
done
