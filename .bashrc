alias la='ls -a'

alias rf='rm -rf'

alias c='clear'

alias gl='git log --oneline --decorate --all'

alias b='cd ..'

function git-a() {
    git add . && git commit -m "$";
}

function view() {
    cd $1 && la && b;
}

function mkcd() {
    mkdir $1 && cd $1;
}

function todo() {
    python ~/source/repos/Bash-salt/todo/main.py;
    # link todo project
}

function wordle() {
    python ~/source/repos/Bash-salt/wordle/wordle.py;
    #link to wordle project
}

function tree() {
    current_dir=$(pwd)
    echo "$1"
    echo "$current_dir"
    if [ "$1" == "-f" ]; then
        echo "in -f"
        python ~/source/repos/Bash-salt/tree/tree.py "$1" "$current_dir"
    else
        echo "in norm"
        python ~/source/repos/Bash-salt/tree/tree.py "$current_dir"
    fi
}