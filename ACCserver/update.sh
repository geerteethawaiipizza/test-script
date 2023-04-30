#!/bin/bash
sudo apt update && sudo apt dist-upgrade -y
steamcmd +@sSteamCmdForcePlatformType windows +login xea898 +force_install_dir ~/server +app_update 1430110 +quit
mkdir ~/backup
cp ~/accweb/config.yml ~/backup/
cp -r ~/accweb/config ~/backup/
rm -r ~/accweb
wget $(lastversion --assets assetto-corsa-web/accweb)
ver=$(lastversion assetto-corsa-web/accweb)
unzip accweb*.zip
rm *.zip
mv accweb* accweb
cp ~/backup/config.yml ~/accweb/
cp -r ~/backup/config ~/accweb/
rm -r ~/backup
sudo systemctl restart accweb.service
echo " "
echo "Operating system and all other software now up to date"
echo " " 
echo "accServer.exe is now the latest version"
echo " "
echo "ACCweb has been updated to version $ver"
echo "All race lobbies have been stopped, access through the browser to start your lobbies"
