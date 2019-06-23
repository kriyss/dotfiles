sed -i 's/Solarized Light/Solarized Dark/g' ~/.config/Code/User/settings.json
sed -i 's#.Xresources.d/solarized-light#.Xresources.d/solarized-dark#g' ~/.Xresources
sed -i 's#NumixSolarizedLightBlue#NumixSolarizedDarkBlue#g' ~/.config/gtk-3.0/settings.ini

feh --bg-scale --no-xinerama /home/kriyss/wallpaper-dark.jpg

i3-msg restart