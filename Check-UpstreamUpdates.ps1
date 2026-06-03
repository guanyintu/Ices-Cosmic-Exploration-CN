$ErrorActionPreference = "Stop"

$repo = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $repo

function Pause-And-Exit {
    param([int]$Code = 0)

    Write-Host ""
    Read-Host "按 Enter 关闭窗口"
    exit $Code
}

Write-Host "=========================================="
Write-Host "ICE 中文仓库 - 上游更新检查"
Write-Host "=========================================="
Write-Host ""

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "未找到 git，请先安装 Git 或检查 PATH。"
    Pause-And-Exit 1
}

try {
    git rev-parse --is-inside-work-tree *> $null
    if ($LASTEXITCODE -ne 0) {
        throw "当前目录不是 Git 仓库：$repo"
    }

    git remote get-url upstream *> $null
    if ($LASTEXITCODE -ne 0) {
        Write-Host "未找到 upstream 远端。"
        Write-Host "请先添加上游："
        Write-Host "git remote add upstream https://github.com/LeontopodiumNivale14/Ices-Cosmic-Exploration.git"
        Pause-And-Exit 1
    }

    Write-Host "正在获取上游最新状态..."
    git fetch upstream
    if ($LASTEXITCODE -ne 0) {
        throw "获取上游失败，请检查网络或 GitHub 访问。"
    }

    Write-Host ""
    $counts = (git rev-list --left-right --count HEAD...upstream/Main-Branch).Trim() -split "\s+"
    $localAhead = [int]$counts[0]
    $upstreamAhead = [int]$counts[1]

    Write-Host "当前分支："
    git branch --show-current

    Write-Host ""
    Write-Host "上游最新提交："
    git log --oneline -1 upstream/Main-Branch

    Write-Host ""
    if ($upstreamAhead -eq 0) {
        Write-Host "结果：上游没有新更新。"
    } else {
        Write-Host "结果：上游有 $upstreamAhead 个新提交尚未合并。"
        Write-Host ""
        Write-Host "新提交列表："
        git log --oneline HEAD..upstream/Main-Branch
    }

    Write-Host ""
    Write-Host "本地相对上游多出的提交数：$localAhead"
    Pause-And-Exit 0
} catch {
    Write-Host ""
    Write-Host "检查失败：$($_.Exception.Message)"
    Pause-And-Exit 1
}
