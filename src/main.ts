import { app, BrowserWindow, globalShortcut, Tray, Menu, nativeImage } from 'electron';
import * as path from 'path';
import * as url from 'url';

let mainWindow: BrowserWindow | null = null;
let tray: Tray | null = null;

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 500,
    height: 600,
    alwaysOnTop: true,
    frame: true,
    webPreferences: {
      preload: path.join(__dirname, 'preload.js'),
      nodeIntegration: false,
      contextIsolation: true
    }
  });

  // Load ChatGPT website
  mainWindow.loadURL('https://chat.openai.com/');

  // Hide window when closed instead of quitting app
  mainWindow.on('close', (event) => {
    event.preventDefault();
    mainWindow?.hide();
  });

  mainWindow.on('ready-to-show', () => {
    mainWindow?.focus();
  });
}

function createTray() {
  const icon = nativeImage.createEmpty();
  tray = new Tray(icon);
  const contextMenu = Menu.buildFromTemplate([
    { label: 'Show ChatGPT', click: () => toggleWindow() },
    { label: 'Quit', click: () => app.quit() }
  ]);
  tray.setToolTip('ChatGPT Widget');
  tray.setContextMenu(contextMenu);
}

function toggleWindow() {
  if (!mainWindow) {
    createWindow();
    return;
  }

  if (mainWindow.isVisible()) {
    mainWindow.hide();
  } else {
    mainWindow.show();
    mainWindow.focus();
  }
}

app.on('ready', () => {
  createTray();
  globalShortcut.register('Ctrl+Space', toggleWindow);
});

app.on('will-quit', () => {
  globalShortcut.unregisterAll();
});
