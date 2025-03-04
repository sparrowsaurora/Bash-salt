alias la = 'ls -a'

alias rf = 'rm -rf'

function mkcd() {
    mkdir $1 && cd $1
}

function todo() {
    python Documents/GitHub/Bash-salt/todo/main.py
    # link todo project
}

function wordle() {
    python Documents/GitHub/Bash-salt/wordle/wordle.py
    #link to wordle project
}