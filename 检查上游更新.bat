@echo off
chcp 65001 >nul
setlocal

cd /d "%~dp0"

echo ==========================================
echo ICE 中文仓库 - 上游更新检查
echo ==========================================
echo.

where git >nul 2>nul
if errorlevel 1 (
    echo 未找到 git，请先安装 Git 或检查 PATH。
    echo.
    pause
    exit /b 1
)

git rev-parse --is-inside-work-tree >nul 2>nul
if errorlevel 1 (
    echo 当前目录不是 Git 仓库：%cd%
    echo.
    pause
    exit /b 1
)

git remote get-url upstream >nul 2>nul
if errorlevel 1 (
    echo 未找到 upstream 远端。
    echo 请先添加上游：
    echo git remote add upstream https://github.com/LeontopodiumNivale14/Ices-Cosmic-Exploration.git
    echo.
    pause
    exit /b 1
)

echo 正在获取上游最新状态...
git fetch upstream
if errorlevel 1 (
    echo.
    echo 获取上游失败，请检查网络或 GitHub 访问。
    echo.
    pause
    exit /b 1
)

echo.
for /f "tokens=1,2" %%a in ('git rev-list --left-right --count HEAD...upstream/Main-Branch') do (
    set "LOCAL_AHEAD=%%a"
    set "UPSTREAM_AHEAD=%%b"
)

echo 当前分支：
git branch --show-current
echo.
echo 上游最新提交：
git log --oneline -1 upstream/Main-Branch
echo.

if "%UPSTREAM_AHEAD%"=="0" (
    echo 结果：上游没有新更新。
) else (
    echo 结果：上游有 %UPSTREAM_AHEAD% 个新提交尚未合并。
    echo.
    echo 新提交列表：
    git log --oneline HEAD..upstream/Main-Branch
)

echo.
echo 本地相对上游多出的提交数：%LOCAL_AHEAD%
echo.
pause
