curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

cat << 'EOF' >> ~/.bashrc

eval "$(zoxide init bash)"
export PATH=$HOME/.local/bin:$PATH
EOF

sudo apt install fzf -y
echo "Installed Zoxide. Please run 'source ~/.bashrc' to start using Zoxide."