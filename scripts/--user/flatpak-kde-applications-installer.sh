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
org.kde.ghostwriter
org.kde.kate
org.kde.kclock
org.kde.kdenlive
org.kde.kfind
org.kde.kleopatra
org.kde.konversation
org.kde.krename
org.kde.neochat
org.kde.yakuake
org.kde.kcolorchooser
)

# Install each application for the user.
for app in "${apps[@]}"; do
  flatpak install flathub --user "$app" -y
done
