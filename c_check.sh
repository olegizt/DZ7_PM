#!/bin/bash

printf '\n\e[0;37;42m --- Проверим, что на этой ВМ не установлена программа htop --- \e[0m\n'
printf '\n\e[0;37;42m --- Попробуем её запустить...--- \e[0m\n'
htop
printf "\n\n"
sleep 5
printf '\n\e[0;37;42m --- Проверим, что в стандартных репозиториях нет программы htop для установки. Попробуем  её проинсталлировать с помощью yum...--- \e[0m\n'
sudo yum install -y htop
sleep 5
printf '\n\e[0;37;42m --- Как мы убедились, программа htop не доступна для установки --- \e[0m\n'
printf '\n\e[0;37;42m --- Добавим новый репозиторий otus (baseurl=http://192.168.50.10/repo) поднятый на развёрнутой ВМ-сервере в рамках данной работы --- \e[0m\n'
cat >> otus.repo << EOF
[otus]
name=otus-linux
baseurl=http://192.168.50.10/repo
gpgcheck=0
enabled=1
EOF
sudo mv ./otus.repo /etc/yum.repos.d/
sleep 5
sleep 5
printf '\n\e[0;37;42m --- Убедимся что репозиторий подключился и посмотрим что в нем есть --- \e[0m\n'
yum repolist enabled | grep otus
printf "\n\n"
yum list | grep otus
sleep 5
printf '\n\e[0;37;42m --- Мы видим, что пакет htop доступен для установки. Установим его командой sudo yum install htop --- \e[0m\n'
sleep 5
sudo yum install -y htop
printf '\n\e[0;37;42m --- Проверим, что программа htop установлена. Попробуйте её запустить командой - htop....--- \e[0m\n'
printf '\n\e[0;34;47m --- Если программа запуститься, то выполнение этой домашней работы можно считать законченным.--- \e[0m\n'