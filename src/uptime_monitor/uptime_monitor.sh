function uptime_monitor() {
    # Run executable
    ~/source/repos/Bash-salt/src/uptime_monitor/uptime_monitor.exe

    # if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    #     echo "wine is needed to run a .exe file"
    #     wine ~/source/repos/Bash-salt/uptime_monitor/uptime_monitor.exe
    # elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" || "$OSTYPE" == "win32" ]]; then
    #     ~/source/repos/Bash-salt/src/uptime_monitor/uptime_monitor.exe
    # else
    #     echo "Unsupported OS"
    # fi
}