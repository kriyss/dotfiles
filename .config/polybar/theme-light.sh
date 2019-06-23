sed -i 's/Solarized Dark/Solarized Light/g' ~/.config/Code/User/settings.json
sed -i 's#.Xresources.d/solarized-dark#.Xresources.d/solarized-light#g' ~/.Xresources
sed -i 's#NumixSolarizedDarkBlue#NumixSolarizedLightBlue#g' ~/.config/gtk-3.0/settings.ini

feh --bg-scale --no-xinerama /home/kriyss/wallpaper-light.png

i3-msg restart