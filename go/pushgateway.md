# Prometheus pushgateway
## 客户端未上报数据时pushgateway仍然向promethtus提供数据的问题
> 本次修改基于pushgateway 1.4.1版本
> 修改pushgateway/storage/diskmetrricstore.go文件中GetMetricFamilies方法中遍历Metrics的地方  
```go
	for _, group := range dms.metricGroups {
		for name, tmf := range group.Metrics {
			// Change by Stanley Fernandez on 2022.01.04
			// if 5 minutes not submit data not return data to prometheus server.
			if nowTime.Sub(tmf.Timestamp).Seconds() > 300 {
				continue
			}
            // .... Other code ....
        }
    }
```