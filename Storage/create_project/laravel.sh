#!/bin/bash

# ANSI color codes
GREEN="\033[0;32m"
CYAN="\033[0;36m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
RESET="\033[0m"

print_msg() {
    echo -e "${1}${2}${RESET}"
}

# Project name from argument, or use default
APP_NAME=${1:-laravel_app}

print_msg "$CYAN" "Setting up Laravel project: $APP_NAME"

# Ensure Composer is installed
if ! command -v composer &> /dev/null; then
    print_msg "$RED" "Composer is not installed. Please install Composer first."
    exit 1
fi

# Create Laravel project
print_msg "$CYAN" "Installing Laravel via Composer..."
composer create-project --prefer-dist laravel/laravel "$APP_NAME"

cd "$APP_NAME" || exit

# Create additional directories & files (optional customization)
print_msg "$CYAN" "Creating custom directories and placeholder files..."

mkdir -p resources/views/components
touch resources/views/components/nav.blade.php
touch resources/views/layouts/app.blade.php

# Generate .env file (if not already)
print_msg "$CYAN" "Setting up environment variables..."
cp .env.example .env
php artisan key:generate

# Create .gitignore if not already present
touch .gitignore
cat <<EOF > .gitignore
/vendor
/node_modules
.env
.phpunit.result.cache
/storage/*.key
/storage/framework/cache/data/*
/storage/logs/*.log
EOF

# Final instructions
print_msg "$GREEN" "Laravel project '$APP_NAME' created successfully!"

print_msg "$YELLOW" "Run the following to get started:"
print_msg "$YELLOW" "   cd $APP_NAME"
print_msg "$YELLOW" "   php artisan serve"

print_msg "$CYAN" "\nRecommended Composer packages for authentication and extras:"
print_msg "$YELLOW" "   composer require laravel/breeze     # Simple auth starter kit"
print_msg "$YELLOW" "   composer require laravel/ui         # Legacy auth scaffolding"
print_msg "$YELLOW" "   composer require laravel/sanctum    # API token auth"
print_msg "$YELLOW" "   composer require laravel/socialite  # OAuth (Google, Facebook, etc.)"
