setxkbmap pl
xset b off
xset r rate 200 30
redshift -O 3500
pipewire &
exec dbus-launch --exit-with-session i3
