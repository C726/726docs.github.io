@echo off
echo 清理微信数据
echo 将为您清理微信图片、文件、视频、缓存
echo 开始查找微信数据存放位置
echo 开始删除图片
rem for /f %%d in (dir "%USERPROFILE%\documents\WeChat Files\wxid_*\FileStorage\Cache\*") do 
rem for /f "tokens=3" %d in (`reg query HKCU\SOFTWARE\Tencent\WeChat /v FileSavePath | findstr "FileSavePath"`) do echo %d
