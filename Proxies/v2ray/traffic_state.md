# V2ray 流量统计

## 配置流程
> 配置api项  
> 配置stats项  
> 策略配置  
> inbound项配置  

## 配置API项
```json
{
    "api":{
        "tag": "v2api",  //可自定义
        "service": [
            "HandlerService",  //开户API管理功能
            "LoggerService",
            "StatsService"
        ]
    },
    "inbound":{
        //需增加这个入站楝
        "listen": "127.0.0.1",
        "port": 10085,
        "protocol": "dokodemo-door",
        "settings": {
            "address": "127.0.0.1"
        },
        "tag": "v2api"  //tag与api一致
    }
}

```

## 配置stats项
```json
{
    "stats":{}  //配置存在即可
}
```

## 策略配置
```json
{
    "policy":{
        "levels": {
            "0": {
                //注意对应用户的策略
                "statsUserUplink": true, //开启用户流量上传统计
                "statsUserDownlink": true //开启用户流量下载统计
            }
        },
        "system": {
            "statsInboundUplink": true, //开启入站方向的流量上传
            "statsInboundDownlink": true, //开启入站方向的流量下载
            "statsOutboundUplink": true, //开启出站方向的流量上传
            "statsOutboundDownlink": true //开启出站方向的流量下载
        }
}
```

## Inbound项配置
```json
{
    "inbound":[
        {
            "tag": "tcp",
            "port": 3307,
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "email": "auser",  //定义一个auser用户
                        "id": "e731f153-4f31-49d3-9e8f-ff8f396135ef",
                        "level": 0,
                        "alterId": 64
                    },
                    {
                        "email": "buser",  //定义一个buser用户
                        "id": "e731f153-4f31-49d3-9e8f-ff8f396135ee",
                        "level": 0,
                        "alterId": 64
                    }
                ]
            }
        }
    ]
}
```

## 配置文件示例
```json
{
	"log": {
		"access": "/var/log/v2ray/access.log",
		"error": "/var/log/v2ray/error.log",
		"loglevel": "warning"
	},
	"api":{
		"tag": "v2api",
		"services":[
			"HandlerService",
			"LoggerService",
			"StatsService"
		]
	},
	"policy":{
		"levels":{
			"1" : {
				"uplinkOnly":0,
				"downlinkOnly":0,
				"statsUserUplink": true,
				"statsUserDownlink": true
			}
		},
		"system":{
			"statsInboundUplink": true,
			"statsInboundDownlink": true,
			"statsOutboundUplink": true,
			"statsOutboundDownlink": true
		}
	},
	"inbounds": [
		{"listen": "127.0.0.1","port": 10085,"protocol": "dokodemo-door","settings": {"address": "127.0.0.1"},"tag": "v2api"},
		{"port":23846,"listen":"94.137.76.254","protocol": "vmess","tag": "IP254","settings": {"clients": [{"email":"IP254","id":"27c44a85-b39d-49d6-8151-871764fb1e15","security":"auto","level": 1,"alterId": 0}]},"streamSettings": {"network": "tcp"},"sniffing": {"enabled": true,"destOverride": ["http","tls"]}}
	],
	"outbounds": [
		{"protocol": "freedom","settings": {},"tag": "IP254","sendThrough":"94.137.76.254"}
	],
	"dns": {
		"servers": [
			"https+local://8.8.8.8/dns-query",
			"8.8.8.8",
			"1.1.1.1",
			"localhost"
		]
	},
	"routing": {
		"domainStrategy": "IPOnDemand",	
		"rules": [
			{"type":"field","inboundTag":["IP254"],"outboundTag":"IP254"},
			{"type":"field","inboundTag":["v2api"],"outboundTag":"v2api"}
		]
	},
	"stats": {},
	"transport": {
		"kcpSettings": {
            "uplinkCapacity": 100,
            "downlinkCapacity": 100,
            "congestion": true
        }
	}
}
```

## v2ctl工具查询流量
```sh
v2ctl api --server=127.0.0.1:10085 StatsService.QueryStats 'pattern: "" reset: false'
v2ctl api --server=127.0.0.1:10085 StatsService.GetStats 'name: "inbound&gt;&gt;&gt;statin&gt;&gt;&gt;traffic&gt;&gt;&gt;downlink" reset: false'

```

## 新版本问题
> 新版本开启了MD5认证，要兼容旧客户端需要服务端关闭才能使用  
```sh
#修改启动文件：
[Unit]
Description=V2Ray Service
Documentation=https://www.v2fly.org/
After=network.target nss-lookup.target

[Service]
#此处需要注意用户问题
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
Environment=v2ray.vmess.aead.forced=false
ExecStart=/usr/bin/env v2ray.vmess.aead.forced=false /usr/local/bin/v2ray -config /usr/local/etc/v2ray/config.json
Restart=on-failure
RestartPreventExitStatus=23

[Install]
WantedBy=multi-user.target
```

## 参考文档
[利用V2RAY API实现流量统计和用户管理](https://www.mebi.me/1684.html)  
[V2RAY官方文档](https://www.v2fly.org/config/overview.html)  
[V2ray 新装或更新后无法链接](https://www.nixonli.com/24335.html)  
