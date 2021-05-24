#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then


    




    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

export _JAVA_AWT_WM_NONREPARENTING=1

# st &
picom &
redshift &
setxkbmap -option grp:alt_shift_toggle us,es &
# Add compose key later
emacs --daemon
xbindkeys

# Gesture Stuff
# fusuma -d

nitrogen --restore &
exec bspwm


# Berry WM

# sxhkd -c /home/vigsk17/.config/berry/sxhkdrc &
# /home/vigsk17/.config/berry/solarized-bar.sh | lemonbar -pf Iosevka -d &
# exec berry

# 2bwm

#feh --bg-scale ~/.config/2bwm/Wallpapers/black.png
#while true; do
#    # Log stderror to a file 
#    2bwm 2> ~/.2bwm.log
#done

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

