# JEEPAY Install
> Offical document　https://docs.jeequan.com/docs/jeepay/deploy

## Install Mysql
```bash
wget https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.28-el7-x86_64.tar.gz
tar zxvf mysql-8.0.28-el7-x86_64.tar.gz
mv mysql-8.0.28-el7-x86_64 /data/jeepay/
bin/mysqld -I --datadir=./data --user=root
nohup bin/mysqld  --datadir=./data --user=root --port=3336 --open-files-limit=65536 &
mysql -h 127.0.01 -P 3336 -u root -p
mysql> alter user root@'localhost' identified by 'new password'
```

## Install rabbitmq
### Install rabbitmq
```bash
 yum -y install https://github.com/rabbitmq/rabbitmq-server/releases/download/rabbitmq_v3_6_12/rabbitmq-server-3.6.12-1.el7.noarch.rpm
 systemctl enable rabbitmq-server.service
 systemctl start rabbitmq-server.service
 rabbitmq-plugins enable rabbitmq_management
 rabbitmqctl add_user jeepay jeepay
 rabbitmqctl set_user_tags jeepay administrator
```

### Install rabbitmq delayed message exchange
```bash
git clone -b v3.6.x https://github.com/rabbitmq/rabbitmq-delayed-message-exchange.git
cd rabbitmq-delayed-message-exchange
make
make dist
cp plugins/rabbitmq-delayed-message-exchange.ez /usr/lib/rabbitmq/lib/rabbitmq_server-3.6.12/plugins/
rabbitmq-plugins list
rabbitmq-plugins enable rabbitmq_delayed_message_exchange
```

## Install Maven
```bash
wget --no-check-certificate https://dlcdn.apache.org/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz
tar zxvf apache-maven-3.8.4-bin.tar.gz
mv apache-maven-3.8.4 /usr/local/
echo 'export PATH=$PATH:/usr/local/apache-maven-3.8.4/bin' >> ~/.bash_profile

```

## Java Project
### Request
> java 1.8  
> mysql 5.7 + used json format in sql  
> redis 3.2.8
> MQ ActiveMQ/RabbitMQ/RocketMQ  
> > RabbitMQ install need rabbitmq-delayed-message-exchange plugins
>  
> Nginx  

### Build API server
```bash
export JAVA_HOME=/path/to/jdk
export PATH=$PATH:$JAVA_HOME/bin
git clone https://gitee.com/jeequan/jeepay.git
mvn clean package -Dmaven.test.skip=true -Ptest
# Build complate will be create flowlist files
#jeepay-manager/target/jeepay-manager.jar
#jeepay-merchant/target/jeepay-merchant.jar
#jeepay-payment/target/jeepay-payment.jar
```

### Start Service
```bash
# 创建用户
useradd jeepay
# 切换用户
su jeepay
# 进入目录
cd /home/jeepay/
# 创建目录service和upload
mkdir service && mkdir upload
# 进入到service目录下
cd /home/jeepay/service
# 创建目录manager,merchant,payment
mkdir manager && mkdir merchant && mkdir payment
# 初始化数据库
mysql -h 127.0.0.1 -P 3336 -u root -p123456 
mysql>CREATE DATABASE `jeepay` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */
mysql>create user jeepay identified by '123456'
mysql>grant all on jeepay.* to jeepay@'localhost';
mysql>srouce /data/jeepay/docs/sql/init.sql;
mysql>exit
# Copy jar file and config file and start scripts to manager directory
\cp -rf /data/jeepay/jeepay-manager/target/jeepay-manager.jar /home/jeepay/service/manager/
\cp -rf /data/jeepay/docs/script/app.sh /home/jeepay/service/manager/
\cp -rf /data/jeepay/conf/manager/application.yml /home/jeepay/service/manager/
# Modify application.yml 
vim /home/jeepay/service/manager/application.yml
# Start service
cd /home/jeepay/service/manager
sh app.sh start
# Check log
tail -f logs/mrg.all.log
```

### Build Vue project
```bash
git clone https://gitee.com/jeequan/jeepay-ui.git .
# Project has 3 directory
#jeepay-ui-manager：运营平台对应的前端代码
#jeepay-ui-merchant：商户系统对应的前端代码
#jeepay-ui-cashier：支付收银台前端代码（只有用到聚合扫码收银台时才需要部署）

# 修改文件 .env 中的 VUE_APP_API_BASE_URL 配置，如果前端和服务端部署在同一域名下，该值留空，否则需要设置为服务端接口地址
cd jeepay-ui-manager
npm install
npm run build
```

### Nginx Config
#### Manager project config
```shell
upstream mgr-api {
    server 127.0.0.1:9217 weight=1 max_fails=2 fail_timeout=30s;
}

server
{
    listen 80;
    server_name mgr.x.jeepay.vip;
    index index.html index.htm ;
    root /home/jeepay/html/manager;

    #解决vue刷新404问题
    try_files $uri $uri/ /index.html;

    location /api/
    {
        proxy_next_upstream http_502 http_504 error timeout invalid_header;
        proxy_set_header Host  $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass http://mgr-api;
    }

}
```

#### Merchant Project Config
```bash
upstream mch-api {
    server 127.0.0.1:9218 weight=1 max_fails=2 fail_timeout=30s;
}

server
{
    listen 80;
    server_name mch.x.jeepay.vip;
    index index.html index.htm;
    root /home/jeepay/html/merchant;

    #解决vue刷新404问题
    try_files $uri $uri/ /index.html;

    location /api/
    {
        proxy_next_upstream http_502 http_504 error timeout invalid_header;
        proxy_set_header Host  $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass http://mch-api;
        # 启用支持websocket连接
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }

}
```

#### Payment Project Config
```bash
upstream pay-api {
    server 127.0.0.1:9216 weight=1 max_fails=2 fail_timeout=30s;
}

server
{
    listen 80;
    server_name pay.x.jeepay.vip;
    index index.html index.htm;
    root /home/jeepay/html/cashier;

    location ^~ /api/
    {
        proxy_next_upstream http_502 http_504 error timeout invalid_header;
        proxy_set_header Host  $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass http://pay-api;
    }

}
```