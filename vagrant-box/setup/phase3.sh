# カーネルの数を一つに
yum -y install yum-utils
package-cleanup -y --oldkernels --count=1

yum -y remove \
 yum-utils \
 python-chardet \
 python-kitchen

# GuestAdditionsのインストール
yum -y install epel-release
yum -y install bzip2 gcc kernel-devel-`uname -r` dkms 

mount -r /dev/cdrom /mnt
/mnt/VBoxLinuxAdditions.run

# 後始末
umount /mnt

yum -y remove \
 bzip2

yum -y remove \
 gcc \
 cpp \
 glibc-devel \
 glibc-headers \
 kernel-headers \
 libmpc \
 mpfr \
 dkms

yum -y remove \
 kernel-devel-`uname -r` \
 perl \
 perl-Carp \
 perl-Encode \
 perl-Exporter \
 perl-File-Path \
 perl-File-Temp \
 perl-Filter \
 perl-Getopt-Long \
 perl-HTTP-Tiny \
 perl-PathTools \
 perl-Pod-Escapes \
 perl-Pod-Perldoc \
 perl-Pod-Simple \
 perl-Pod-Usage \
 perl-Scalar-List-Utils \
 perl-Socket \
 perl-Storable \
 perl-Text-ParseWords \
 perl-Time-HiRes \
 perl-Time-Local \
 perl-constant \
 perl-libs \
 perl-macros \
 perl-parent \
 perl-podlators \
 perl-threads \
 perl-threads-shared

yum -y remove \
 gcc-c++ \
 libstdc++-devel 

yum -y remove \
 epel-release

yum clean all

echo "exclude=kernel*" >> /etc/yum.conf
