yaourt -Syu --aur --noconfirm
sudo pacman -S --noconfirm --needed texmaker texlive-most keepass keepass-plugin-keeagent evolution evolution-ews gimp scribus synergy go-tools gnome-disk-utility gnome-keyring libgnome-keyring redshift
yaourt -S --noconfirm --needed google-chrome intellij-idea-ultimate-edition keepass-plugin-http telegram-desktop-bin keebuntu gogland jdk visual-studio-code nextcloud-client grub-customizer gigolo ring-kde skypeforlinux-bin
sudo pacman -Rns $(sudo pacman -Qdtq) --noconfirm
sudo pacman -Sc --noconfirm
