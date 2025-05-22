function speedtest() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "wine is needed to run a .exe file"
        wine ~/source/repos/Bash-salt/speedtest/speedtest.exe
    elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" || "$OSTYPE" == "win32" ]]; then
        ~/source/repos/Bash-salt/src/speedtest/speedtest.exe
    else
        echo "Unsupported OS"
    fi

    
}