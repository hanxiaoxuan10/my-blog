@echo off
cd /d "%~dp0"
echo === 正在生成博客 ===
call npx hexo generate
echo.
echo === 正在上传到服务器 ===
echo 请稍候...
echo.

:: 创建 FTP 上传脚本
echo open xiaoxuan.vxni.ink > ftp-upload.txt
echo svh_eofz3j >> ftp-upload.txt
echo bxa788y777 >> ftp-upload.txt
echo binary >> ftp-upload.txt
echo prompt n >> ftp-upload.txt
echo cd / >> ftp-upload.txt
echo mput public\*.* >> ftp-upload.txt
echo quit >> ftp-upload.txt

:: 执行 FTP 上传
ftp -s:ftp-upload.txt

:: 清理
del ftp-upload.txt

echo.
echo === 部署完成！ ===
pause
