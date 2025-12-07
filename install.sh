#!/bin/bash

set -e

echo Install dependencies...
echo " Installing Papirus icon theme..."
sudo pacman -S --needed --noconfirm papirus-icon-theme

echo " Installing required packages..."
sudo pacman -S --needed --noconfirm wofi kitty waybar hyprpaper hyprlock yay
yay -S wlogout

# 3. Symlink configs
echo "Linking configs..."

ln -sf ~/dotfiles/kitty ~/.config/kitty
ln -sf ~/dotfiles/hypr ~/.config/hypr
ln -sf ~/dotfiles/waybar ~/.config/waybar
ln -sf ~/dotfiles/themes ~/.config/themes
ln -sf ~/dotfiles/wofi ~/.config/wofi

# 4. Fonts
echo "🔤 Installing fonts..."
mkdir -p ~/.local/share/fonts
cp -r ~/dotfiles/TTF/* ~/.local/share/fonts/
fc-cache -fv >/dev/null

echo "Rice deployed! Reboot or restart apps to see full drip."

