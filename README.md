# Bash-Salt

_A play on words of Bassalt, what i origionally wanted to call it._

This project was made to add some cool functions to BASH

## From the Dev

currently testing locally "http://bash-salt.test/"'

### NOTE::

This project only supports BASH on Windows systems currently.

## Future Projects

### **Developer Tools**

1. **Code Snippet Manager** – Save, search, and manage code snippets with tags and descriptions.
2. **CLI Info** – Get Destailed descriptions on any command with more than just the '--help' screen.

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

### **Internet & Networking**

1. **CLI Weather App** – Fetches weather forecasts using an API.
2. **RSS Reader** – Fetches and displays articles from your favorite RSS feeds.

### **Fun & Miscellaneous**

1. **CLI-Tetris** – Something like Chess, Tetris, or a text adventure.
2. **Bonsai** – Creates Ascii Bonsai tree with customization options.
3. **Music Player** – Plays local music files with simple navigation.
4. **Stock Visualiser** - gives me stock updates for the past day

## Added BASH Aliases

    "la" = ls -a
    "rf" = rm -rf
    "c" = clear
    "b" = cd ..
    "gl" = git log --oneline --decorate --all
    "mkcd" = mkdir $ && cd $
    "view" = cd $ && la && b
    "sr" = cd ~/source/repos
    "rollback" = git reset HEAD^ && git push origin HEAD --force

## Packages

    ToDo -> A CLI based multipage to-do list
    Wordle -> a wordle game
    Tree -> prints a file tree/map (auto-exclusion of .git and target directories)
    Speed Test -> Measures internet speed using a simple command.
    Create Project -> Bash scripts to Fast launch the start of your project in any framework
