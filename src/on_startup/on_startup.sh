function on_startup() {
    # Run executable
    ~/source/repos/Bash-salt/src/on_startup/on_startup.exe

    # if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    #     echo "wine is needed to run a .exe file"
    #     wine ~/source/repos/Bash-salt/on_startup/on_startup.exe
    # elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" || "$OSTYPE" == "win32" ]]; then
    #     ~/source/repos/Bash-salt/src/on_startup/on_startup.exe
    # else
    #     echo "Unsupported OS"
    # fi
}