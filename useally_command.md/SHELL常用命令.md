
# Bash shell常用命令

## Curl 显示响应时间  
```bash
vim curl-format.txt
     time_namelookup:  %{time_namelookup}s\n
        time_connect:  %{time_connect}s\n
     time_appconnect:  %{time_appconnect}s\n
    time_pretransfer:  %{time_pretransfer}s\n
       time_redirect:  %{time_redirect}s\n
  time_starttransfer:  %{time_starttransfer}s\n
                     ----------\n
          time_total:  %{time_total}s\n


curl -w "@curl-format.txt" -o /dev/null -s "https://www.supremenewyork.com"
# Curl 使用代理
curl -x socks5://dabai:yun123456cc@50.207.86.8:1235 cip.cc
```