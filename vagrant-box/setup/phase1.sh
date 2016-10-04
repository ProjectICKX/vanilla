# vagrantユーザの作成
groupadd vagrant
useradd -g vagrant -s /bin/bash vagrant
echo "vagrant" | passwd vagrant --stdin

# sudo設定の追加
echo "Defaults !requiretty" >> /etc/sudoers.d/vagrant
echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
