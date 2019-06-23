S=$(xrandr --query | grep " connected" | grep -v " primary" | cut -d" " -f1)
echo $S
xrandr --output $S --primary