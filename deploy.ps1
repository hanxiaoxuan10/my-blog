# 博客一键部署脚本
# 用法: 右键 -> 使用 PowerShell 运行

$server = "xiaoxuan.vxni.ink"
$user = "svh_eofz3j"
$pass = "bxa788y777"
$localPath = Join-Path $PSScriptRoot "public"

Write-Host "=== 正在生成博客 ===" -ForegroundColor Cyan
Set-Location $PSScriptRoot
npx hexo generate

Write-Host "`n=== 正在上传到服务器 ===" -ForegroundColor Cyan

# 上传单个文件
function Upload-File($localFile, $remotePath) {
    $uri = "ftp://$server$remotePath"
    try {
        $cred = New-Object System.Net.NetworkCredential($user, $pass)
        $request = [System.Net.WebRequest]::Create($uri)
        $request.Method = [System.Net.WebRequestMethods+Ftp]::UploadFile
        $request.Credentials = $cred
        $request.UsePassive = $true
        $request.UseBinary = $true
        $fileContent = [System.IO.File]::ReadAllBytes($localFile)
        $request.ContentLength = $fileContent.Length
        $stream = $request.GetRequestStream()
        $stream.Write($fileContent, 0, $fileContent.Length)
        $stream.Close()
        Write-Host "  ✓ $remotePath" -ForegroundColor Green
    } catch {
        Write-Host "  ✗ $remotePath - $_" -ForegroundColor Red
    }
}

# 递归上传目录
function Upload-Directory($localDir, $remoteDir) {
    foreach ($file in Get-ChildItem $localDir -File) {
        $localFile = $file.FullName
        $remotePath = "$remoteDir/$($file.Name)"
        Upload-File $localFile $remotePath
    }
    foreach ($subDir in Get-ChildItem $localDir -Directory) {
        $newRemoteDir = "$remoteDir/$($subDir.Name)"
        try {
            $uri = "ftp://$server$newRemoteDir"
            $cred = New-Object System.Net.NetworkCredential($user, $pass)
            $request = [System.Net.WebRequest]::Create($uri)
            $request.Method = [System.Net.WebRequestMethods+Ftp]::MakeDirectory
            $request.Credentials = $cred
            $request.GetResponse() | Out-Null
        } catch {}
        Upload-Directory $subDir.FullName $newRemoteDir
    }
}

Upload-Directory $localPath ""

Write-Host "`n=== 部署完成！ ===" -ForegroundColor Cyan
Read-Host "按 Enter 退出"
