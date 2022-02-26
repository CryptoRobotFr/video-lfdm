#! /bin/bash

vertclaire='\e[1;32m'
neutre='\e[0;m'

echo -e "${vertclaire}Intallation des prérequies${neutre}"
apt-get update
apt-get install python3.8 -y
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 2
apt-get install python3.8-venv -y
apt-get install python3-pip -y
apt install python-pip -y
python3 -m venv /env/


echo -e "${vertclaire}Installation du bot${neutre}"
cd /home/user/video-lfdm/
source /env/bin/activate
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt
deactivate

echo -e "${vertclaire}Création du fichier log${neutre}"
mkdir log

echo -e "${vertclaire}Création de la boucle d'actualisation du bot${neutre}"
echo "# trading bot 1h" >> /hive/etc/crontab.root
echo "00 */1 * * * /env/bin/python3 /home/user/video-lfdm/cross_ema_live.py >> /home/user/video-lfdm/log/log.log" >> /hive/etc/crontab.root

echo -e "${vertclaire}Installation réussite renseignez votre clé API${neutre}"
