#!/bin/bash 

x="ms"
y="gm"
z="https://www."

gsearch () {
    if [[ "$1" == *com ]]; then
        s="$z$1"
        open "$s"
    elif [[ "$1" == "$x" ]]; then
        open "https://math.stackexchange.com/"
    elif [[ "$1" == "$y" ]]; then
        open "https://www.gmail.com"
    else
        for term in $1; do
            search="$search%20$term"
        done 
        open "https://www.google.com/search?q=$search"
    fi
}

gsearch "$@"
