# Salt Api 使用
## 接口访问
### 配置文件
```bash
external_auth:
  pam:
    salt:
      - .*

rest_cherrypy:
  port: 8080
  host: 0.0.0.0     
  # disable_ssl: True   ## 如果不需要 https，直接使用 http ，可以去掉本行最前面的注释
  ssl_crt: /etc/ssl/private/cert.pem
  ssl_key: /etc/ssl/private/key.pem
```
## API调用
### 登录
```bash
curl -ki https://127.0.0.1:8080/login -H "Accept: application/json" \
 -d username='salt' \
 -d password='salt_pass' \
 -d eauth='pam'

{
    "return": [
        {
            "perms": [".*", "@wheel", "@runner"], 
            "start": 1639558194.539676, 
            "token": "fc5d877deaaa55e6986e324318be8693b68be269", 
            "expire": 1639601394.539676, 
            "user": "saltapi", 
            "eauth": "pam"
        }
    ]
}
```

### 调用其他接口
```bash
# 拿到 token 之后，有两种使用方式：

# 1. 基于 cookie 的 session 会话，比如浏览器或者 requests.Session。
# 2. 在 http 请求的 header 加上 X-Auth-Token: f17847776f6ac228f41cd51ab545d8c1021dfa98

# 指令
curl -i http://localhost:1236/minions -H "Accept: application/json"  -H "X-Auth-Token: fc5d877deaaa55e6986e324318be8693b68be269"
curl -i http://localhost:8080/ -H "Accept: application/json"  -H "X-Auth-Token: b363bf8b7a34c6a5db6719d745e32df38329a43e" -d client='local' -d tgt='minion-id1' -d fun="cmd.run" -d arg="uname -a"
# 返回
{"return": [{"ubuntu": "Linux ubuntu 3.5.0-23-generic #35~precise1-Ubuntu SMP Fri Jan 25 17:13:26 UTC 2013 x86_64 x86_64 x86_64 GNU/Linux"}]}
```

### 接口列表
> /minions：管理 minion  
> /jobs： jobs 查看，管理  
> /run：绕过 token，直接通过用户名和密码访问 salt 服务
> /events  
> /hook  
> /keys  
> https://docs.saltproject.io/en/latest/ref/netapi/all/salt.netapi.rest_cherrypy.html  
## 引用
> https://cizixs.com/2015/03/24/salt-api-usage/