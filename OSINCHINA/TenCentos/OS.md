# Tencentos 

## Tencentos 3.1 转换为CentOS8
```bash
#1. 卸载腾讯release
rpm -e --nodeps tencentos-release
#2. 删除文件并检测是否删除
rpm -qa | grep release
rm -rf /etc/centos-release /etc/os-release /etc/rpm/macros.dist /etc/system-release /etc/system-release-cpe /usr/lib/systemd/system-preset/90-default.preset /usr/share/centos-release/EULA
#3. 安装centos release
dnf -y install centos-release-stream
#4. 安装remi release
dnf -y install https://rpms.remirepo.net/enterprise/8/remi/x86_64/remi-release-8.7-2.el8.remi.noarch.rpm
```