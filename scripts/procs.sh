PROCS_VERSION=0.14.10
FILE_NAME=procs-v${PROCS_VERSION}-x86_64-linux.zip
URL=https://github.com/procs/procs/releases/download/v${PROCS_VERSION}/${FILE_NAME}

sudo apt install unzip -y
curl -O $URL
sudo rm -rf /usr/local/bin/procs
sudo unzip -d /usr/local/bin/ $FILE_NAME
sudo rm -rf $FILE_NAME

echo "export PATH=$PATH:/usr/local/bin" >> ~/.bashrc

echo "Installed Procs version $PROCS_VERSION. Please run 'source ~/.bashrc' to start using Procs."