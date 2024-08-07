#!/bin/bash

# Define variables
VERSION="3.5.0"  # Define the version of your program
SCRIPT_DIR=$(dirname "$(realpath "$0")")
SQLYNX_SCRIPT="$SCRIPT_DIR/sqlynx-ide.sh"

if [ ! -f "$SQLYNX_SCRIPT" ]; then
	echo "Error: $SQLYNX_SCRIPT not found!"
	exit 1
fi

# Function to print the help message
function print_help {
    echo "Usage: sqlynx [start|stop|version|help]"
    echo
    echo "Commands:"
    echo "  start   - Start the SQLynx application."
	echo "	restart	- Restart the SQLynx application."
    echo "  stop    - Stop the SQLynx application."
    echo "  version - Show the version of SQLynx."
    echo "  help    - Show this help message."
}

# Function to start the application
function start_application {
	sudo sh "$SQLYNX_SCRIPT" start
	xdg-open "http://127.0.0.1:18888"
    echo "SQLynx started."
}

# Function to restart the application
function restart_application {
	sudo sh "$SQLYNX_SCRIPT" restart
	xdg-open "http://127.0.0.1:18888"
	echo "SQLynx restarted"
}

# Function to stop the application
function stop_application {
	sudo sh "$SQLYNX_SCRIPT" stop
    echo "SQLynx stopped."
}

# Function to show the version
function show_version {
    echo "SQLynx version $VERSION"
}

# Main script logic
case "$1" in
    start)
        start_application
        ;;
	restart)
		restart_application
		;;
    stop)
        stop_application
        ;;
    version)
        show_version
        ;;
    help)
        print_help
        ;;
    *)
        echo "Invalid command. Use 'sqlynx help' for usage information."
        exit 1
        ;;
esac
