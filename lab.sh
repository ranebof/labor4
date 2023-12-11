#!/bin/bash 
#Оновлення пакетів
yum update -y 
yum install mc vim git -y 


#Створення нового юзера adminuser
useradd -s /bin/bash -m -p '$1$1BY71TCN$KXMiMec/kqN.haeU/8dYq0' adminuser
#Додаємо adminuser до групи sudo
usermod -aG sudo adminuser
#Сворюємо poweruser
useradd -s /bin/bash -m -p '$1$1BY71TCN$KXMiMec/kqN.haeU/8dYq0' poweruser
#Дозволяємо poweruser логінитись без пароля
passwd -d poweruser 
#Дозволяємо poweruser читати хоум діру adminuser
usermod -aG adminuser poweruser
#Дозволяємо poweruser використовувати iptables
echo 'poweruser ALL=(ALL) /sbin/iptables' | EDITOR='tee -a' visudo 
#Створюємо софт лінк на файл /etc/mtab в хоум дірі poweruser-a
ln -s /etc/mtab /home/poweruser/mtab_link 
 