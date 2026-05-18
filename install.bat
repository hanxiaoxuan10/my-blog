@echo off
cd /d "%~dp0"
echo === 正在安装 Hexo 博客依赖 ===
echo.
call npm install
echo.
echo === 安装完成！ ===
echo.
echo 使用以下命令启动博客：
echo   npm start     - 启动本地预览 (http://localhost:4000)
echo   npm run build - 生成静态文件
echo   npm run new   - 创建新文章
echo.
pause
