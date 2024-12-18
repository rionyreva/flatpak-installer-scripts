#!/bin/bash

# Add Flathub repository if it is not already added
if ! flatpak remote-list | grep -q "flathub"; then
  echo "Adding Flathub repository..."
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
else
  echo "Flathub repository is already added."
fi

# List of applications to install. Specify multiple packages in a new line.
apps=(
  com.brave.Browser
  io.gitlab.librewolf-community
  net.mullvad.MullvadBrowser
  org.torproject.torbrowser-launcher
)

# Install each application system-wide.
for app in "${apps[@]}"; do
  flatpak install --system "$app" -y
done

