#!/bin/bash

# Function to print error messages and exit
function error_exit {
    echo "$1" >&2
    exit 1
}

# Define variables
REPO_DIR="$(pwd)"  # Assumes the script is run from the repo directory
INSTALL_DIR="/opt/sqlynx"
BIN_DIR="/usr/local/bin"
DESKTOP_FILE="/usr/share/applications/sqlynx.desktop"

# Step 1: Create installation directory
echo "Creating installation directory $INSTALL_DIR..."
sudo mkdir -p "$INSTALL_DIR" || error_exit "Failed to create installation directory $INSTALL_DIR."

# Step 2: Copy repository files to installation directory
echo "Copying repository files to $INSTALL_DIR..."
sudo cp -r "$REPO_DIR"/* "$INSTALL_DIR/" || error_exit "Failed to copy files to $INSTALL_DIR."

# Step 3: Register the 'sqlynx' command
echo "Registering 'sqlynx' command..."
# Create a symlink to the sqlynx script
sudo ln -s "$INSTALL_DIR/sqlynx.sh" "$BIN_DIR/sqlynx" || error_exit "Failed to create symlink for 'sqlynx' command."

# Step 4: Install desktop entry
echo "Installing desktop entry..."
sudo cp "$INSTALL_DIR/scripts/sqlynx.desktop" "$DESKTOP_FILE" || error_exit "Failed to copy sqlynx.desktop to $DESKTOP_FILE."

# Step 5: Provide instructions
echo "Setup complete!"
echo "1. The SQLynx application has been installed to $INSTALL_DIR."
echo "2. You can start SQLynx using the command: sqlynx start"
echo "3. To stop SQLynx, use: sqlynx stop"
echo "4. A desktop entry has been installed, and you can find SQLynx in your application menu."
echo "5. Please run 'source ~/.bashrc' or restart your terminal to apply PATH changes."

# End of script
echo "Deployment script finished successfully."
