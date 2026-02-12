#!/bin/bash

# Configuration
NODE_VERSION="20"
FNM_INSTALL_DIR="$HOME/.local/share/fnm"

sudo apt install unzip -y 

# 1. Install fnm to the specified directory
curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir "$FNM_INSTALL_DIR" --skip-shell

# 2. Append the configuration block to .bashrc
# Using single quotes around 'EOF' to ensure $HOME and $PATH are written as literals
cat << 'EOF' >> ~/.bashrc

FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
EOF

# 3. Initialize fnm for the current session and install Node
export PATH="$FNM_INSTALL_DIR:$PATH"
eval "`fnm env`"

echo "Installing Node.js version: $NODE_VERSION..."
fnm install "$NODE_VERSION"
fnm default "$NODE_VERSION"
npm install -g npm@latest

echo "Installed Node.js. Please run 'source ~/.bashrc' to start using Node $NODE_VERSION."