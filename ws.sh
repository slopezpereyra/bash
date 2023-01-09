#!/bin/zsh 
#
# For reference, see the documentation: 
# https://man7.org/linux/man-pages/man1/tmux.1.html

if [[ "$1" == "eeg" ]]; then 
    DIR="$HOME/work/EEG-toolkit"
    SESSIONNAME="EEG"
    START_EDIT_COMMAND="nvim R/tests.R"
elif [[ "$1" == "amn" ]]; then
    DIR="$HOME/work/amn"
    SESSIONNAME="AMN"
    START_EDIT_COMMAND="nvim py/wscrapper.py"
else
    echo "No valid work environment was provided."
    exit 0
fi

tmux has-session -t $SESSIONNAME &> /dev/null

if [ $? != 0 ]; then 
    tmux new-session -s $SESSIONNAME -c $DIR -n abstract -d 
    if [[ "$1" == "eeg" ]]; then
        tmux split-window -h; n
        tmux send 'R' ENTER
    else
        tmux send "activate" ENTER
    fi
    tmux new-window -c $DIR -n editing -t 1
    tmux send "$START_EDIT_COMMAND" ENTER
fi

tmux attach -t $SESSIONNAME
