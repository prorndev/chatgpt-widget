# ChatGPT Desktop Widget

A simple, lightweight, and always-on-top desktop widget that embeds the ChatGPT web version for quick and easy access.

![image](https://github.com/user-attachments/assets/b1625904-a957-4581-8041-9d1ef24a737f)

## Features

- **Global Hotkey**: Press `Ctrl+Space` to instantly show or hide the widget from anywhere in your OS.
- **Always-On-Top**: Stays on top of all other windows for easy access.
- **Auto-Focus**: The cursor is automatically placed in the text input area when the widget appears.
- **Persistent Session**: Stays logged in to your ChatGPT account between sessions.
- **Native Send Shortcut**: Use the default `Super+Enter` (or `Cmd+Enter` on macOS) to send messages.
- **Ubuntu Service**: Includes a systemd service to automatically run the application on startup.

## Prerequisites

- [Node.js](https://nodejs.org/) (v16 or later recommended)
- `npm`

## Installation

1.  **Clone the repository:**
    ```bash
    git clone <YOUR_REPOSITORY_URL>
    cd chatgpt-widget
    ```

2.  **Install dependencies:**
    ```bash
    npm install
    ```

3.  **Compile the TypeScript code:**
    ```bash
    npx tsc
    ```

## Usage

-   **Run the application:**
    ```bash
    npm start
    ```
-   **Open/Close the widget:** Press `Ctrl+Space`.
-   **Send a message:** Type your message and press `Super+Enter`.

## Ubuntu Service Setup (Optional)

To run the widget automatically on startup as a systemd service, follow these steps.

1.  **Edit the service file:**
    Open the `chatgpt-widget.service` file and replace `YOUR_USERNAME` with your actual Ubuntu username and `YOUR_PROJECT_PATH` with the absolute path to the `chatgpt-widget` project directory.

2.  **Install the service:**
    ```bash
    sudo cp chatgpt-widget.service /etc/systemd/system/chatgpt-widget.service
    ```

3.  **Reload systemd and enable the service:**
    ```bash
    sudo systemctl daemon-reload
    sudo systemctl enable chatgpt-widget.service
    ```

4.  **Start the service:**
    ```bash
    sudo systemctl start chatgpt-widget.service
    ```

### Service Management Commands

-   **Check the status:** `sudo systemctl status chatgpt-widget.service`
-   **Stop the service:** `sudo systemctl stop chatgpt-widget.service`
-   **Restart the service:** `sudo systemctl restart chatgpt-widget.service` 