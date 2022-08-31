# Cloudpods mini install

## Basic infomation
> Website: https://www.cloudpods.org  
> 默认在k8s集群环境中部署运行  
> 可手动部署本地开发环境  

## 手动部署独立开发环境
### 机器配置: 
    4C 4G 100G  

### 环境安装：
> > Mariadb  
> > Nginx  
> > Nodejs 
> >  
> > > - npm  
> > > - yarn  
> > 
> > go 1.15 +  
> > Cloudpods 3.9  
> > cloudpods dashboard 3.9 +  

### 最少组件
> keystone(必须，用作认证)  
> yunionconf(必须，用作用户环境信息存储)  
> region（必须，用作机器信息管理，没有会导致页面不能点击菜单）  
> apigateway(必须，用作内部访问网关)  
> dashboard 3.9  

## 安装过程
### OS basic
```sh
dnf -y install epel-release git
```

### Install Mariadb
```sh
dnf -y install mariadb-server mariadb
```

### Install yarn
```sh
dnf -y installl yarn
# OR
dnf -y install nodejs npm
npm install -g yarn
```

### Install go
```sh
wget https://go.dev/dl/go1.18.2.linux-amd64.tar.gz
tar zxvf go1.18.2.linux-amd64.tar.gz -C /usr/local/go
cat<<EOF >> ~/.bashrc
export GOROOT="/usr/local/go"
export GOPATH="/opt/go"
export GOPROXY="https://goproxy.cn"
EOF
```

### Install Nginx
```sh
dnf -y install nginx
# OR
dnf -y install openresty
```

### Install 