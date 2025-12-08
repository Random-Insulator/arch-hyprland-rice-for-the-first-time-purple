#!/bin/bash

set -e

echo Install dependencies...
echo " Installing Papirus icon theme..."
sudo pacman -S --needed --noconfirm papirus-icon-theme

echo " Installing required packages..."
sudo pacman -S --needed --noconfirm wofi kitty waybar hyprpaper hyprlock zsh curl
echo "Installing yay!"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay
yay -S wlogout --noconfirm
echo "making zsh the default shell"
chsh -s $(which zsh)
echo "installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Installing zsh theme.."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "installing waybar music..."
yay -S waybar-module-music --needed
# 3. Symlink configs
echo "Linking configs..."

ln -sf ~/arch-hyprland-rice-for-the-first-time-purple/kitty ~/.config/kitty
ln -sf ~/arch-hyprland-rice-for-the-first-time-purple/hypr ~/.config/hypr
ln -sf ~/arch-hyprland-rice-for-the-first-time-purple/waybar ~/.config/waybar
ln -sf ~/arch-hyprland-rice-for-the-first-time-purple/themes ~/.config/themes
ln -sf ~/arch-hyprland-rice-for-the-first-time-purple/wofi ~/.config/wofi
ln -sf ~/arch-hyprland-rice-for-the-first-time-purple/wlogout ~/.config/wlogout
ln -sf ~/arch-hyprland-rice-for-the-first-time-purple/.zshrc ~/.zshrc
ln -sf ~/arch-hyprland-rice-for-the-first-time-purple/.p10k.zsh ~/.p10k.zsh
# 4. Fonts
echo "Installing fonts..."
mkdir -p ~/.local/share/fonts
cp -r ~/arch-hyprland-rice-for-the-first-time-purple/TTF/* ~/.local/share/fonts/
fc-cache -f

echo "Rice deployed! Reboot or restart apps to see full drip."

