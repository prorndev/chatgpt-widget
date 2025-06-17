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
-   **Send a message:** Type your message and press `Super+Enter` (or `Cmd+Enter` on macOS).

## Ubuntu Service Setup (Optional)

To run the widget automatically when you log in, simply run the installation script. **Do not use sudo.**

```bash
./install-service.sh
```

This will install and enable a user-level service.

### Service Management Commands

-   **Check the status:** `systemctl --user status chatgpt-widget.service`
-   **Stop the service:** `systemctl --user stop chatgpt-widget.service`
-   **Restart the service:** `systemctl --user restart chatgpt-widget.service`
-   **View logs:** `journalctl --user -u chatgpt-widget.service` 