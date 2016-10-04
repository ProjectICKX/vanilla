# vagrantユーザ用のSSH公開鍵設定
mkdir -m 700 /home/vagrant/.ssh
curl -L -o /home/vagrant/.ssh/authorized_keys https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# Webサーバ実行ユーザ、メンテナンスユーザの作成
groupadd maint
useradd -g maint -G vagrant -s /bin/bash maint
useradd -g maint -G vagrant -s /sbin/nologin -M www
echo "vagrant" | passwd maint --stdin

# SELinux無効化
setenforce 0

# システム起動時にSELinuxを無効化
sed -i -e 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

# yum更新
yum -y update

echo "please set GuestAdditions CD"
