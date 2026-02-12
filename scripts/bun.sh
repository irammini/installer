# Pre-install
sudo apt install unzip -y || true

# Install Bun
curl -fsSL https://bun.com/install | bash

# Add Bun to the PATH
cat << 'EOF' >> ~/.bashrc

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
EOF

source ~/.bashrc

echo "Installed Bun. Verify with 'bun --version'"