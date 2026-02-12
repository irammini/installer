RIPGREP_VERSION=15.1.0
FILE_NAME=ripgrep_$RIPGREP_VERSION-1_amd64.deb
URL=https://github.com/BurntSushi/ripgrep/releases/download/$RIPGREP_VERSION/$FILE_NAME

curl -O $URL
sudo dpkg -i $FILE_NAME
sudo rm -rf $FILE_NAME

echo "Installed Ripgrep."