# Prometheus 
## 清除Prometheus 数据
```bash
#!/bin/bash

# 
# Power by Stanley on 2021.09.10
# 

SaveDays=1

curl -I -X POST -g 'http://localhost:9090/api/v1/admin/tsdb/delete_series?match[]={job="hyperv"}&end='$(date +%s -d "${SaveDays} days ago")
curl -I -X POST -g http://localhost:9090/api/v1/admin/tsdb/clean_tombstones
```