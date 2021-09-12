# !/bin/sh
set echo off
sudo groupadd hpool
sudo adduser hpool --disabled-login --no-create-home --disabled-password --ingroup hpool
sudo usermod -a -G hpool $USER
sudo mkdir /usr/share/hpool_miner/
sudo mkdir /usr/share/hpool_miner/pp
sudo chown -R hpool:hpool /usr/share/hpool_miner/
sudo cp "hpool-miner-chia" /usr/share/hpool_miner/pp
sudo cp "hpool-miner-chia-pp.sh" /usr/share/hpool_miner/pp
sudo cp "config.yaml" /usr/share/hpool_miner/pp
sudo chown -R hpool:hpool /usr/share/hpool_miner/
sudo chmod 0777 -R /usr/share/hpool_miner/
sudo cp hpoolpp.service /etc/systemd/system
sudo chmod 0755 /etc/systemd/system/hpoolpp.service
sudo chmod +x /usr/share/hpool_miner/pp/hpool-miner-chia-pp.sh
sudo chmod +x /usr/share/hpool_miner/pp/hpool-miner-chia-pp
sudo systemctl daemon-reload
sudo systemctl enable hpoolpp
sudo systemctl restart hpoolpp
sudo systemctl status hpoolpp
