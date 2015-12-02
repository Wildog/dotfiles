CURRTTY=$(tty | sed -e "s:/dev/ttys::")
CURRTMUX=$(tmux display-message -p "#S")

#if [ $CURRTTY = "001" ]; then
#    mux default
#fi
#
if [ $CURRTMUX != "default" ] && [ $CURRTTY = "001" ]; then
    mux default
fi
