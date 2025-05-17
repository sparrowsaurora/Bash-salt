alias la='ls -a'

alias rf='rm -rf'

alias c='clear'

alias gl='git log --oneline --decorate --all'

alias b='cd ..'

alias sr='cd ~/source/repos'

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

function info() {
    echo "OS: $(uname -a)"
    echo "Kernel: $(uname -r)"
    echo "CPU: $(lscpu | grep 'Model name')"
    echo "RAM: $(free -h | grep 'Mem')"
    echo "Disk: $(df -h | grep '/$')"
}

function ip() {
    ifconfig | grep 'inet ' | awk '{print $2}'
}

function createvenv() {
    if [ -z "$1" ]; then
        echo "Usage: createenv <env_name>"
        return 1
    fi
    echo "Creating Virtual environment <$1>"
    python3 -m venv $1
    echo "Activating..."
    source $1/Scripts/activate
    echo "$1 Virtual env is active"
}

function act() {
    source $1/Scripts/activate
    echo "$1 Virtual env is active"
}

function deact() {
    deactivate
    echo "Virtual env is no longer active"
}