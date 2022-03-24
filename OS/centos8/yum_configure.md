# YUM Configure

## YUM repo source change
```bash
# 进入yum.repos.d 目录下
cd /etc/yum.repos.d/
# 修改源链接
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
# 要将之前的mirror.centos.org 改成 vault.centos.org
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
```