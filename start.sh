#!/bin/bash

#Variables
vncfile="/root/.vnc/passwd"

if [ -z "$VNC_PASS" ]; then
	vncpass="123456"
else
	vncpass=$VNC_PASS
fi

if [ -z "$GEOMETRY" ]; then
	geometry="1440x900"
else
	geometry=$GEOMETRY
fi

#echo $vncpass | vncpasswd -f > ~/.vnc/passwd
#chmod 0600 /root/.vnc/passwd

echo -e "$vncpass\n$vncpass\n\n" | vncpasswd

# initialize vnc
/usr/bin/vncserver
/usr/bin/vncserver -kill :1
rm /tmp/.X11-unix/X*
rm /tmp/.X*-lock


# add xstartup
if [ -z "$PROGRAM" ]; then
	echo "lxpanel &" >> ~/.vnc/xstartup
fi

if [ "$PROGRAM" == "firefox" ]; then
	echo "firefox $URL &" >> ~/.vnc/xstartup
fi

if [ "$PROGRAM" == "chrome" ]; then
	echo "google-chrome --no-sandbox $URL &" >> ~/.vnc/xstartup
fi

#run vncserver in background
/usr/bin/vncserver :1 -geometry $geometry& 

cp /opt/noVNC/vnc_lite.html /opt/noVNC/index.html

#run novnc
/opt/noVNC/utils/novnc_proxy --vnc localhost:5901
