yaourt -Syyua --noconfirm  
# Internet
yaourt -S --noconfirm google-chrome evolution evolution-ews telegram-desktop-bin nextcloud-client skypeforlinux-bin
# Office
yaourt -S --noconfirm texmaker texlive-most gimp scribus
# Development
yaourt -S --noconfirm intellij-idea-ultimate-edition pycharm-professional gogland visual-studio-code jdk go-tools gitkraken filezilla python2-pip android-studio
# Tools
yaourt -S --noconfirm keepass keepass-plugin-keeagent keepass-plugin-http keebuntu grub-customizer gigolo gnome-disk-utility synergy 
# Miscelanues
yaourt -S --noconfirm gutenprint redshift bash-completion gnome-keyring libgnome-keyring 
# Cleanup
yaourt -Qdt

# autostarts
ln -s ../autostart/keepass_autostart.sh ~/.config/autostart-scripts/keepass_autostart.sh
