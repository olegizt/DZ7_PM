systemctl enable firewalld --now
yum install -y wget
wget -P /home/vagrant/ https://raw.githubusercontent.com/olegizt/DZ7_PM/main/c_check.sh
chmod +x /home/vagrant/c_check.sh


echo '#!/bin/bash' >> /usr/local/sbin/motd.sh
chmod +x /usr/local/sbin/motd.sh
echo 'printf "\e[0;37;42mПривет! Проверка настроек ДЗ №7 - \"Управление пакетами. Дистрибьюция софта\" на клиенте. Запустите скрипт c_check.sh\e[0m\n"' >> /usr/local/sbin/motd.sh
echo "PrintMotd no" >> /etc/ssh/sshd_config
systemctl restart sshd
echo '/usr/local/sbin/motd.sh' >> /etc/profile
