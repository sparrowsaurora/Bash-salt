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

function rollback() {
    git reset HEAD^
    git push origin HEAD --force
}