# Bash-Salt

_A play on words of Bassalt, what i origionally wanted to call it._

This project was made to add some cool functions to BASH.
_WARNING: All scripts in this tool are handmade and not overly specialised, and therefore are only 'good enough'. If any functionality isnt up to your standard, please seek out the specialised replacement._

## From the Dev

currently testing locally http://bash-salt.test/  
Check out [ryankelley.dev/bashsalt](https://ryankelley.dev/bashsalt)... eventually

## Installation

You can install via your (git)BASH cli by using the command

```shell
curl -sfL https://ryankelley.dev/bashsalt/install.sh | sh
```

### NOTE : :

This project only supports BASH on Windows systems currently.
We're currently adding Linux support and removing the need for a python interpreter.

## Added BASH Aliases

```shell
"la" = ls -a
"rf" = rm -rf
"c" = clear
"b" = cd ..
"gl" = git log --oneline --decorate --all
"mkcd" = mkdir $ && cd $
"view" = cd $ && la && b
"sr" = cd ~/source/repos
"rollback" = git reset HEAD^ && git push origin HEAD --force
```

## Packages

    ToDo -> A CLI based multipage to-do list
    Wordle -> a wordle game
    Tree -> prints a file tree/map (auto-exclusion of .git and target directories)
    Speed Test -> Measures internet speed using a simple command.
    Create Project -> Bash scripts to Fast launch the start of your project in any framework
    Uptime Monitor -> Measures uptime for a website over intervals

## Future Projects

### **System Utilities**

1. **Clipboard Manager** – A history manager for copied text, allowing you to search and reuse snippets.
2. **Disk Usage Visualizer** – Like `du`, but with ASCII charts showing folder sizes.
3. **Custom Task Scheduler** – A simplified `cron`-like tool with a more user-friendly syntax.

### **Productivity & Workflow**

1. **Time Tracker** – Log and analyze how much time you spend on tasks.
2. **Note-Taking CLI** – A quick way to take and search notes from the terminal.
3. **CLI Pomodoro Timer** – A simple time management tool with notifications.
4. **Local Search Engine** – Indexes and searches files/documents on your computer.
5. **Automated Backup Tool** – Syncs important files to an external drive or cloud storage.

### **Fun & Miscellaneous**

1. **CLI Weather App** – Fetches weather forecasts using an API.
2. **Bonsai** – Creates Ascii Bonsai tree with customization options.
3. **Stock Visualiser** - gives me stock updates for the past day

## License

MIT License © 2025 sparrowsaurora

## Contact

\> [github](https://github.com/sparrowsaurora)  
\> [email](mailto:sparrows.au@gmail.com)

[(Back To Top)](#bash-salt)
