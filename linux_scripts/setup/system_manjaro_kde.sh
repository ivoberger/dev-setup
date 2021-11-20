#!/bin/bash
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
# Config
echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/50-max_user_watches.conf
echo kernel.unprivileged_userns_clone=1 | sudo tee /etc/sysctl.d/00-local-userns.conf
echo "auth            optional        pam_gnome_keyring.so" | sudo tee -a /etc/pam.d/sddm
echo "session         optional        pam_gnome_keyring.so auto_start" | sudo tee -a /etc/pam.d/sddm
echo "xrandr --output DP-0 --mode 3440x1440 --rate 99.98 --pos 0x0 --rotate normal" | sudo tee -a /usr/share/sddm/scripts/Xsetup
sudo sysctl --system
# Removing unwanted preinstalled software (manjaro)
sudo pacman -Rsn --noconfirm manjaro-hello manjaro-browser-settings manjaro-documentation-en matray
# Full system upgrade
sudo pacman -Syyu --noconfirm
# Basics
sudo pacman -S --noconfirm --needed yay base-devel fakeroot xorg-xrandr flatpak libpamac-flatpak-plugin dnsutils

echo 'MAKEFLAGS="-j$(nproc)"' | sudo tee -a /etc/makepkg.conf
echo "PKGEXT='.pkg.tar'" | sudo tee -a /etc/makepkg.conf

yay --save --removemake --nodiffmenu --noeditmenu --noupgrademenu --cleanafter --topdown --combinedupgrade --sudoloop --timeupdate
yay -S --noconfirm --needed plasma-wayland-session powerdevil-ddcutil

# Theming
yay -S --noconfirm --needed kvantum-qt5 fluent-kde-theme-git fluent-gtk-theme-git fluent-icon-theme-git nerd-fonts-meslo ttf-joypixels latte-dock
yay -S --noconfirm --needed microsoft-edge-stable-bin google-chrome notion-app telegram-desktop signal-desktop nextcloud-client

# Tools
yay -S --noconfirm --needed unzip keepassxc gnome-keyring seahorse rcm zsh zsh-completions

# Flatpak setup
flatpak install --noninteractive -y flathub com.discordapp.Discord com.slack.Slack

# Development
yay -S --noconfirm --needed yarn httpie google-cloud-sdk docker
yay -S --noconfirm --needed visual-studio-code-bin gitkraken
sudo systemctl enable docker
sudo systemctl start docker
sudo groupadd docker
sudo usermod -aG docker $USER
yay -Qdt 
yay -c --noconfirm

$SCRIPT_DIR/../fixes/fix_emojis.sh
$SCRIPT_DIR/kde/browser.sh
$SCRIPT_DIR/all/ssh_agent.sh
$SCRIPT_DIR/kde/ssh_auth.sh
$SCRIPT_DIR/kde/keepassxc_unlock.sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
rcup -d $SCRIPT_DIR/../../dotfiles -f
