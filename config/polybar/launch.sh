# !/usr/bin/env sh
#!/usr/biin/env zsh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# doesnt work if not hard specified like below
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    # MONITOR=$m polybar --reload topbar &
    echo $m
  done
else
  polybar --reload topbar &
fi

# Launch bars
MONITOR=VGA1 polybar topbar &
MONITOR=LVDS1 polybar topbar &

echo "Bars launched..."
