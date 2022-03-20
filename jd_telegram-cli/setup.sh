#! /bin/bash

sudo snap install  -y telegram-cli

sudo mkdir -p /root/script/

sudo mv ./script/jd_ShareCode.sh /root/script/

# set time zone
#tzselect 
#sudo cp /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
sudo timedatectl set-timezone Asia/Shanghai

# start systemd 
sudo cp ./jd_ShareCode.service /usr/lib/systemd/system/
sudo cp ./jd_ShareCode.timer /usr/lib/systemd/system/
sudo systemctl start jd_ShareCode.timer
