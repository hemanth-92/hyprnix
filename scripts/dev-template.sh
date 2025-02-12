#!/usr/bin/env bash

FLAKE_URL="https://flakehub.com/f/the-nix-way/dev-templates/*"

# Function to list templates in 4 columns
list_templates() {
    nix flake show "$FLAKE_URL" | \
    grep 'template:' | awk -F: '{print $1}' | sed 's/├───//; s/└───//; s/ //g' | \
    column -x -c 120
}

# Function to initialize a project
init_project() {
    LANGUAGE="$1"
    PROJECT_DIR="$2"
    FLAKE_TEMPLATE="$FLAKE_URL#$LANGUAGE"

    if [ -z "$LANGUAGE" ]; then
        echo "Usage: $0 <language> [project_directory]"
        exit 1
    fi

    if [ -z "$PROJECT_DIR" ]; then
        nix flake init --template "$FLAKE_TEMPLATE"
    else
        nix flake new --template "$FLAKE_TEMPLATE" "$PROJECT_DIR"
    fi
}

# Main script logic
if [ "$1" == "list" ]; then
    list_templates
else
    init_project "$1" "$2"
fi
