#!/bin/bash

# Add Flathub repository if it is not already added
if ! flatpak remote-list | grep -q "flathub"; then
  echo "Adding Flathub repository..."
  flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
else
  echo "Flathub repository is already added."
fi

# List of applications to install. Specify multiple packages in a new line.
apps=(
  com.adamcake.Bolt
  com.usebottles.bottles
  com.heroicgameslauncher.hgl
  net.lutris.Lutris
  com.modrinth.ModrinthApp
  com.pokemmo.PokeMMO
  org.prismlauncher.PrismLauncher
  net.davidotek.pupgui2
  com.github.k4zmu2a.spacecadetpinball
  com.valvesoftware.Steam
  com.valvesoftware.SteamLink
  io.itch.itch
)

# Install each application system-wide.
for app in "${apps[@]}"; do
  flatpak install --user "$app" -y
done

