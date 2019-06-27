if type "xrandr"; then
	killall polybar
	P=$(xrandr --query | grep " connected" | grep "eDP1" | cut -d" " -f1)
	S=$(xrandr --query | grep " connected" | grep -v "eDP1" | cut -d" " -f1)
	
	if [[ ! -z $S ]];then
		echo "Launching polybar for screen" $P " and " $S
		xrandr --output $P --primary --auto --right-of $S
		MONITOR=$P polybar -r default &
		MONITOR=$S polybar -r default &
	else
		echo "Launching polybar for screen" $P
		xrandr --output $P --primary --auto
		MONITOR=$P polybar -r default &
	fi
fi