# Run startup file
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    ~/source/repos/Bash-salt/src/on_startup/on_startup
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" || "$OSTYPE" == "win32" ]]; then
    ~/source/repos/Bash-salt/src/on_startup/on_startup.exe
else
    echo "Unsupported OS"
fi