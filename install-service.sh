#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo: sudo ./install-service.sh"
  exit 1
fi

# Get current username and project path
CURRENT_USER=$(logname)
PROJECT_PATH=$(pwd)
NPM_PATH=$(which npm)

echo "Installing service for user: $CURRENT_USER"
echo "Project path: $PROJECT_PATH"
echo "NPM path: $NPM_PATH"

# Create a temporary service file with placeholders replaced
sed -e "s|YOUR_USERNAME|$CURRENT_USER|g" \
    -e "s|YOUR_PROJECT_PATH|$PROJECT_PATH|g" \
    -e "s|YOUR_NPM_PATH|$NPM_PATH|g" \
    chatgpt-widget.service.template > /etc/systemd/system/chatgpt-widget.service

# Make sure the script is executable
chmod +x "$PROJECT_PATH/dist/main.js"

# Reload systemd, enable and start the service
echo "Reloading systemd daemon..."
systemctl daemon-reload

echo "Enabling and starting the service..."
systemctl enable --now chatgpt-widget.service

echo "Installation complete! The ChatGPT Widget service is now running."
echo "You can check its status with: sudo systemctl status chatgpt-widget.service" 