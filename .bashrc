alias la='ls -a'

alias rf='rm -rf'

alias c='clear'

alias gl='git log --oneline --decorate --all'

alias b='cd ..'

function git-a() {
    git add . && git commit -m "$1"
}

function view() {
    cd $1 && la && b
}

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

function tree() {
    python Documents/GitHub/Bash-salt/tree/tree.py
}