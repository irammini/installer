DUST_VERSION=1.2.4
FILE_NAME=du-dust_$DUST_VERSION-1_amd64.deb
URL=https://github.com/bootandy/dust/releases/download/v$DUST_VERSION/$FILE_NAME

curl -O $URL
sudo dpkg -i $FILE_NAME
sudo rm -rf $FILE_NAME

echo "Installed Dust version $DUST_VERSION."