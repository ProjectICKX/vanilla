# ボックスサイズの最小化
find /var/log -type f -exec rm -f {} \;
rm -fr /var/log/*
rm -fr /tmp/*
dd if=/dev/zero of=/0 bs=4k
rm -f /0
rm -f init p1 p2 p3 p4
rm -f /root/.bash_history
history -c
