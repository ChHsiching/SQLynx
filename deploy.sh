#!/bin/bash

# Set variables
REPO_URL="https://github.com/ChHsiching/SQLynx.git"
REPO_DIR="SQLynx"
SETUP_SCRIPT="scripts/setup.sh"

# Function to print error messages and exit
function error_exit {
    echo "$1" >&2
    exit 1
}
 
# Function to check if a command exists
function check_command {
    command -v "$1" > /dev/null 2>&1
}

# Check for git
echo "Checking for git..."
if ! check_command git; then
    error_exit "git is not installed. Please install git and try again."
fi

# Check for Java (JDK 1.8+)
echo "Checking for Java..."
if ! check_command java; then
    error_exit "Java is not installed. Please install JDK 1.8 or higher and try again."
fi

# Check Java version
JAVA_VERSION=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
if [[ "$JAVA_VERSION" < "1.8" ]]; then
    error_exit "Java version 1.8 or higher is required. Current version is $JAVA_VERSION."
fi

# Clone the repository
echo "Cloning the repository from $REPO_URL..."
git clone "$REPO_URL" || error_exit "Failed to clone repository. Please check the URL or your internet connection."

# Navigate to the repository directory
echo "Navigating to directory $REPO_DIR..."
cd "$REPO_DIR" || error_exit "Directory $REPO_DIR does not exist. Clone might have failed."

# Check if setup script exists
if [ ! -f "$SETUP_SCRIPT" ]; then
    error_exit "Setup script $SETUP_SCRIPT not found in the repository."
fi

# Make the setup script executable
echo "Making $SETUP_SCRIPT executable..."
chmod +x "$SETUP_SCRIPT" || error_exit "Failed to make $SETUP_SCRIPT executable."
chmod +x "$SETUP_SCRIPT" || error_exit "Failed to make $SETUP_SCRIPT executable."

# Run the setup script
echo "Running setup script..."
./"$SETUP_SCRIPT" || error_exit "Setup script failed. Please check the script and your environment."

# Provide additional instructions or checks if necessary
echo "Setup complete. Please follow any additional instructions in the project documentation."

# End of script
echo "Deployment script finished successfully."
