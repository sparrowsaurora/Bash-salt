function create_project() {
    ALL_PROJECTS
    for item in "${ALL_PROJECTS[@]}"; do
        if [[ "$item" == "$1" ]]; then
            ./"$1"
            break
        fi
    done
    echo -e "${ITALICRED}Error: '$1' is not an available project starter${ENDCOLOR}"
}