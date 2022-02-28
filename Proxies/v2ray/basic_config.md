# V2ray 配置

## 指定入口IP
```
#inbounds下增加listen
{"port":57140,"listen":"94.137.76.10","protocol": "vmess","tag": "IP10","settings": {"clients": [{"id":"0306c210-5026-4d05-832e-ea126cd36ed1","level": 1,"alterId": 0}]},"streamSettings": {"network": "tcp"},"sniffing": {"enabled": true,"destOverride": ["http","tls"]}}
```
## 指定出口IP
```
#outbounds下，每个字典中增加 "sendThrough": "94.137.76.2",
{"protocol": "freedom","settings": {},"tag": "IP2","sendThrough":"94.137.76.2"}
```

## 指定转发规则
```
# routing下roles下配置inbound tag对应outbound tag
{"type":"field","inboundTag":["IP2"],"outboundTag":"IP2"}
```