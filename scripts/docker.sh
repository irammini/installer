#!/bin/bash

# 1. Cleanup old versions (let apt log flow)
sudo apt remove $(dpkg --get-selections docker.io docker-compose docker-compose-v2 docker-doc podman-docker containerd runc | cut -f1) || true

# 2. Actual Installation logic

# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update

echo "Installing Docker..."
# A little sleep so user can see what is happening
sleep 2s
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# 3. Service Management Logic (Silent)
# Default message if everything goes well
MSG="Docker installation complete. Service is running."

# Try systemctl first
if ! command -v systemctl >/dev/null 2>&1 || ! sudo systemctl enable --now docker > /dev/null 2>&1; then
    # Fallback to service command
    if ! command -v service >/dev/null 2>&1 || ! sudo service docker start > /dev/null 2>&1; then
        # Final fallback message if both fail
        MSG="Docker installation complete, but the service failed to start (systemctl/service not found or failed). Please start the daemon manually."
    fi
fi

# 4. The ONLY echo allowed at the end
echo "$MSG"