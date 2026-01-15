create_project() {
    # Color/style codes
    GREEN="\033[0;32m"
    RED="\033[0;31m"
    CYAN="\033[0;36m"
    ITALIC="\033[3m"
    RESET="\033[0m"

    # Supported project types and aliases
    declare -A ALIASES
    ALIASES=( ["fl"]="flask" ["lv"]="laravel" )

    ALL_PROJECTS=("flask" "laravel")

    # Help
    if [[ -z "$1" || "$1" == "--help" ]]; then
        echo -e "${GREEN}Usage:${RESET} create_project <project_type> [project_name]"
        echo -e "${GREEN}Available project types:${RESET} flask (fl), laravel (lv)"
        return 0
    fi

    # Resolve alias if used
    INPUT_TYPE="$1"
    PROJECT_TYPE="${ALIASES[$INPUT_TYPE]:-$INPUT_TYPE}"  # Use alias if exists

    # Check for valid project type
    for item in "${ALL_PROJECTS[@]}"; do
        if [[ "$item" == "$PROJECT_TYPE" ]]; then
            SCRIPT="./${PROJECT_TYPE}.sh"

            # Auto chmod +x if script exists but isn't executable
            if [[ -f "$SCRIPT" && ! -x "$SCRIPT" ]]; then
                chmod +x "$SCRIPT"
                echo -e "${CYAN}Made '$SCRIPT' executable.${RESET}"
            fi

            # Check if script is now executable
            if [[ ! -x "$SCRIPT" ]]; then
                echo -e "${RED}Error:${RESET} Script '$SCRIPT' not found or not executable."
                return 1
            fi

            # Prompt for project name if not provided
            PROJECT_NAME="$2"
            if [[ -z "$PROJECT_NAME" ]]; then
                read -p "Enter a project name (or press Enter to skip): " PROJECT_NAME
            fi

            # Run the script with the name (or none)
            "$SCRIPT" "$PROJECT_NAME"
            return $?
        fi
    done

    echo -e "${RED}${ITALIC}Error:${RESET}${RED} '$INPUT_TYPE' is not an available project starter.${RESET}"
    echo -e "${GREEN}Available types:${RESET} ${ALL_PROJECTS[*]}"
    return 1
}
