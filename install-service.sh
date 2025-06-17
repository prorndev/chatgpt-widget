#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo: sudo ./install-service.sh"
  exit 1
fi

# Get current username and project path
CURRENT_USER=$(logname)
PROJECT_PATH=$(pwd)

echo "Installing service for user: $CURRENT_USER"
echo "Project path: $PROJECT_PATH"

# Check if node_modules exists
if [ ! -d "$PROJECT_PATH/node_modules" ]; then
    echo "Error: node_modules directory not found."
    echo "Please run 'npm install' before installing the service."
    exit 1
fi

# Create the service file with placeholders replaced
sed -e "s|YOUR_USERNAME|$CURRENT_USER|g" \
    -e "s|YOUR_PROJECT_PATH|$PROJECT_PATH|g" \
    chatgpt-widget.service.template > /etc/systemd/system/chatgpt-widget.service

# Reload systemd, enable and start the service
echo "Reloading systemd daemon..."
systemctl daemon-reload

echo "Enabling and starting the service..."
systemctl enable --now chatgpt-widget.service

echo "Installation complete! The ChatGPT Widget service is now running."
echo "You can check its status with: sudo systemctl status chatgpt-widget.service" 