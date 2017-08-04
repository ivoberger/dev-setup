#! /bin/bash
sudo pacman -S --noconfirm qt5-base qt5-tools qt5-x11extras qjson libmicrohttpd libgcrypt zlib libxi libxtst curl cmake make gcc-multilib
git clone https://github.com/Ivan0xFF/keepassx.git /tmp/keepassx
mkdir -p /tmp/keepassx/build
cd /tmp/keepassx/build
cmake ..
make -j4
sudo make install
rm -rf /tmp/keepassx
curl -o /home/ivo/.local/share/icons/keepass.png https://upload.wikimedia.org/wikipedia/commons/1/19/KeePass_icon.png
echo "[Desktop Entry]
Categories=Qt;Utility;
Comment[en_US]=
Comment=
Exec=keepassx %f
GenericName[en_US]=Cross Platform Password Manager
GenericName=Cross Platform Password Manager
GenericName[de]=Passwortverwaltung
GenericName[es]=Gestor de contraseñas multiplataforma
GenericName[fr]=Gestionnaire de mot de passe
Icon=/home/ivo/.local/share/icons/keepass.png
MimeType=
Name[en_US]=KeePassX
Name=KeePassX
Path=
StartupNotify=true
Terminal=false
TerminalOptions=
Type=Application
X-DBUS-ServiceName=
X-DBUS-StartupType=
X-KDE-SubstituteUID=false
X-KDE-Username=
" > $HOME/.local/share/applications/keepassx.desktop
chmod o+rwx $HOME/.local/share/applications/keepassx.desktop
chmod a+r $HOME/.local/share/applications/keepassx.desktop
