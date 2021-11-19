#!/bin/bash
cat > /etc/fonts/local.conf <<- EOM
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>

 <alias>
   <family>sans-serif</family>
   <prefer>
     <family>Sans</family>
     <family>JoyPixels</family>
   </prefer>
 </alias>

 <alias>
   <family>serif</family>
   <prefer>
     <family>Serif</family>
     <family>JoyPixels</family>
   </prefer>
 </alias>

 <alias>
  <family>monospace</family>
  <prefer>
    <family>Monospace</family>
    <family>JoyPixels</family>
   </prefer>
 </alias>
</fontconfig>
EOM

