# Windows remote management

## Enable WinRM
```powershell
> start-service winrm
> get-service winrm

# OR
winrm quickconfig
y
winrm set winrm/config/service/Auth '@{Basic="true"}'
# 下面这条命令可以执行失败，可以通过组策略进行配置
# Administrative Templates -> Windows Components -> Windows Remote Management(WinRM) -> WinRM Service
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/winrs '@{MaxMemoryPerShellMB="1024"}'

```

## Allow at Firewall
Configure Windows Firewall to allow access windows remote management