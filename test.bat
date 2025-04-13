@echo off
setlocal enabledelayedexpansion
title 执行log-b提交github任务

:main_loop
::删除之前的记录
del /q "D:\phpstudy_pro\WWW\git\log-b\git_log\*.*" >nul 2>&1

REM 获取当前日期和时间
for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set datetime=%%a

REM 提取年月日时分秒
set "year=!datetime:~0,4!"
set "month=!datetime:~4,2!"
set "day=!datetime:~6,2!"
set "hour=!datetime:~8,2!"
set "minute=!datetime:~10,2!"
set "second=!datetime:~12,2!"

REM 指定目标目录
set "target_dir=D:\phpstudy_pro\WWW\git\log-b\git_log"

REM 构造文件名和内容
set "filename=%year%%month%%day%_%hour%.txt"
set "filecontent=%year%-%month%-%day% %hour%:%minute%:%second%"

REM 创建文件
echo %filecontent% > "%target_dir%\%filename%"

::显示信息
call :display_info "文件已创建：%target_dir%\%filename%"

::执行Git提交
cd /d "D:\phpstudy_pro\WWW\git\log-b"
git add . 
git commit -m "提交; %date:~0,4%-%date:~5,2%-%date:~8,2%; %time:~0,8%"
git push -f origin master

::错误处理
if %errorlevel% neq 0 (
    call :display_info "提交失败请查看错误原因"
    timeout /t 60 >nul  // 失败后等待1分钟再重试
    goto main_loop
)

call :display_info "已执行完成 %CD%"
call :display_info "等待3600秒(1小时)后再次执行"

::等待1小时后再次执行
timeout /t 3600 >nul 
goto main_loop

:display_info
echo ^.
echo ^..
echo ^...
echo ^....
echo ^.....
echo ^......
echo ^.......
echo ^........
echo %~1
echo ^........
echo ^......
echo ^.....
echo ^....
echo ^...
echo ^..
echo ^.
goto :eof