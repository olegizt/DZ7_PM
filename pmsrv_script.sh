yum install -y redhat-lsb-core wget rpmdevtools rpm-build createrepo yum-utils gcc epel-release
yum install -y nginx
sed -i '1,50 s:/usr/share/nginx/html;:/usr/share/nginx/html;\n\tautoindex on;:' /etc/nginx/nginx.conf
systemctl enable nginx
systemctl start nginx
systemctl enable firewalld --now
firewall-cmd --add-service="http" --add-service="https" --permanent 
firewall-cmd --reload
wget https://dl.fedoraproject.org/pub/epel/7/SRPMS/Packages/h/htop-2.2.0-3.el7.src.rpm
rpm -i htop-2.2.0-3.el7.src.rpm
yum-builddep -y /root/rpmbuild/SPECS/htop.spec
rpmbuild -bb /root/rpmbuild/SPECS/htop.spec
mkdir /usr/share/nginx/html/repo
cp /root/rpmbuild/RPMS/x86_64/htop-2*.rpm /usr/share/nginx/html/repo/
wget http://ftpmirror.your.org/pub/percona/pdps-8.0/yum/release/7/RPMS/x86_64/percona-orchestrator-3.2.6-9.el7.x86_64.rpm -O /usr/share/nginx/html/repo/percona-orchestrator-3.2.6-9.el7.x86_64.rpm
createrepo /usr/share/nginx/html/repo/


echo '#!/bin/bash' >> /usr/local/sbin/motd.sh
chmod +x /usr/local/sbin/motd.sh
echo 'printf "\e[0;37;42mПривет! Проверка настроек ДЗ №7 - \"Управление пакетами. Дистрибьюция софта\" на сервере.\e[0m\n\e[0;37;42mРепозиторий на этой ВМ настроен и запущен.\e[0m\n\e[0;37;42mДля проверки подключитесь к ВМ-клиенту и следуйте указаниям MOTD.\e[0m\n"' >> /usr/local/sbin/motd.sh
echo "PrintMotd no" >> /etc/ssh/sshd_config
systemctl restart sshd
echo '/usr/local/sbin/motd.sh' >> /etc/profile