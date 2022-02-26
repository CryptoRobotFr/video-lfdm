#! /bin/bash

echo -e "intallation des prérequies"
apt-get install python3.8 -y
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 2
apt-get install python3.8-venv -y
apt-get install python3-pip -y
python3 -m venv /env/


echo -e "téléchargement du bot"
cd /home/user/
git clone https://github.com/CryptoRobotFr/video-lfdm
cd /home/user/video-lfdm/
source /env/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
deactivate

echo -e "création du fichier log"
mkdir log

echo -e "création de la boucle d'actualisation du bot"
echo "# trading bot 1h" >> /hive/etc/crontab.root
echo "00 */1 * * * /env/bin/python3 /home/user/video-lfdm/cross_ema_live.py >> /home/user/video-lfdm/log/log.log" >> /hive/etc/crontab.root

apt-get remove --purge python3-apt -y
apt-get autoremove -y 
apt-get install python3-apt -y

echo -e "installation réussite redémarrez votre rig"
