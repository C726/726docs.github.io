# UDPspeeder 测试

## 工具相关连接
[UDPspeeder](https://github.com/wangyu-/UDPspeeder) <br />
[TyinfecVPN](https://github.com/wangyu-/tinyfecVPN)

## 测试环境
### 服务器端
```shell
# 调用kvm虚拟机，并限制带宽为1M
# 使用nc每间隔12秒发送一次数据用于阻塞网络
# 服务器启动VPN和UDPspeeder
while true; do echo "Send data"; nc -u 239.0.0.1 1234 < /dev/zero; sleep 12; done
./tinyvpn_amd64 -s -l127.0.0.1:7777 -f20:10 -k "passwd" --sub-net 10.22.22.0
./speederv2_amd64 -s -l0.0.0.0:4096 -r 127.0.0.1:7777    -k "passwd" --mode 0 --report 10
```

### 客户端
```shell
./speederv2_x86  -c -l0.0.0.0:3333 -r50.207.86.18:4096 -f20:10 -k "passwd" --mode 0 --report 10
./tinyvpn_x86 -c -r127.0.0.1:3333 -f20:10 -k "passwd" --sub-net 10.22.22.0
```

## 测试结果
> 网络正常Ping的延迟是250左右<br />
> 阻塞网络之后，出现70%以上的丢包 <br />
> 通过udpspeeder之后网络, 未出现丢包，但是有网络延迟较高的情况
