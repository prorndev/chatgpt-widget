#!/bin/bash

set -e

# Define paths
PROJECT_PATH=$(pwd)
USER_SERVICE_DIR="$HOME/.config/systemd/user"
SERVICE_FILE="chatgpt-widget.service"

echo "Installing ChatGPT Widget as a user service..."

# Create the user service directory if it doesn't exist
mkdir -p "$USER_SERVICE_DIR"
echo "User service directory ensured at: $USER_SERVICE_DIR"

# Check if node_modules exists
if [ ! -d "$PROJECT_PATH/node_modules" ]; then
    echo "Error: node_modules directory not found."
    echo "Please run 'npm install' before installing the service."
    exit 1
fi

# Create the service file from the template
echo "Configuring service file..."
sed "s|YOUR_PROJECT_PATH|$PROJECT_PATH|g" chatgpt-widget.service.template > "$USER_SERVICE_DIR/$SERVICE_FILE"

# Reload the user systemd daemon, enable and start the service
echo "Reloading systemd user daemon..."
systemctl --user daemon-reload

echo "Enabling and starting the service..."
systemctl --user enable --now "$SERVICE_FILE"

echo ""
echo "Installation complete!"
echo "The ChatGPT Widget will now start automatically when you log in."
echo "You can check its status with: systemctl --user status $SERVICE_FILE" 