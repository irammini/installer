GO_VERSION=1.26.0
FILE_NAME=go${GO_VERSION}.linux-amd64.tar.gz
URL=https://go.dev/dl/${FILE_NAME}

curl -O $URL
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf $FILE_NAME
sudo rm -rf $FILE_NAME

echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc

echo "Installed Go version $GO_VERSION. Please run 'source ~/.bashrc' to start using Go."