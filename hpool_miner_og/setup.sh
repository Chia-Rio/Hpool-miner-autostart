# !/bin/sh
set echo off
sudo groupadd hpool
sudo adduser hpool --disabled-login --no-create-home --disabled-password --ingroup hpool
sudo usermod -a -G hpool $USER
sudo mkdir /usr/share/hpool_miner/
sudo mkdir /usr/share/hpool_miner/og
sudo cp "hpool-miner-chia" /usr/share/hpool_miner/og
sudo cp "config.yaml" /usr/share/hpool_miner/og
sudo cp "hpool-miner-chia-og.sh" /usr/share/hpool_miner/og
sudo chown -R hpool:hpool /usr/share/hpool_miner/
sudo chmod 0777 -R /usr/share/hpool_miner/
sudo cp hpoolog.service /etc/systemd/system
sudo chmod 0755 /etc/systemd/system/hpoolog.service
sudo chmod +x /usr/share/hpool_miner/og/hpool-miner-chia-og.sh
sudo chmod +x /usr/share/hpool_miner/og/hpool-miner-chia
sudo systemctl daemon-reload
sudo systemctl enable hpoolog
sudo systemctl restart hpoolog
sudo systemctl status hpoolog
