if [ $ZSH_TMUX_AUTOSTART = true ] && [ $(tmux display-message -p "#S") != "default" ] && [ $(tty | sed -e "s:/dev/ttys::") = "001" ]; then
    mux default
fi
