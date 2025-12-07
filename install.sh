#!/bin/bash

set -e

echo "🍚 Deploying Garv's Arch Rice... stand back."

# 1. Install dependencies
echo "🎨 Installing Papirus icon theme..."
sudo pacman -S --needed --noconfirm papirus-icon-theme

# 2. Install packages
echo "📦 Installing required packages..."
sudo pacman -S --needed --noconfirm \
    wofi kitty waybar wlogout hyprpaper hyprlock \
    cava pipes.sh htop

# Install oh-my-zsh ONLY if not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "⚡ Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 3. Symlink configs
echo "🔗 Linking configs..."

mkdir -p ~/.config

ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh

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

echo "🚀 Rice deployed! Reboot or restart apps to see full drip."

