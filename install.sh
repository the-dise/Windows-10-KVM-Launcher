#!/bin/bash

# Define paths
DESKTOP_FILE="windows10.desktop"
ICON_FILE="src/windows.svg"
INSTALL_PATH="$HOME/.local/share/applications"
ICON_INSTALL_PATH="$HOME/.local/share/icons"
SCRIPT_SRC="main.sh"
SCRIPT_DEST="$HOME/.local/bin/main.sh"

# Function to create the desktop entry
create_desktop_entry() {
    if [[ ! -d "$INSTALL_PATH" ]]; then
        mkdir -p "$INSTALL_PATH"
    fi

    if [[ ! -d "$ICON_INSTALL_PATH" ]]; then
        mkdir -p "$ICON_INSTALL_PATH"
    fi

    if [[ ! -d "$(dirname "$SCRIPT_DEST")" ]]; then
        mkdir -p "$(dirname "$SCRIPT_DEST")"
    fi

    # Move script to destination
    cp "$SCRIPT_SRC" "$SCRIPT_DEST"
    chmod +x "$SCRIPT_DEST"

    # Copy desktop entry
    cp "$DESKTOP_FILE" "$INSTALL_PATH/"

    # Copy icon
    cp "$ICON_FILE" "$ICON_INSTALL_PATH/"

    # Update desktop entry with correct paths
    sed -i "s|Icon=.*|Icon=$ICON_INSTALL_PATH/windows.svg|" "$INSTALL_PATH/$DESKTOP_FILE"
    sed -i "s|Exec=.*|Exec=$SCRIPT_DEST|" "$INSTALL_PATH/$DESKTOP_FILE"

    printf "Desktop entry installed successfully.\n"
}

main() {
    create_desktop_entry
}

main "$@"
