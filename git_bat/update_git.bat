@echo off
::目前目录根目录中/git_bat 所以要(两个点) "%~dp0.."或"../public" 返回根目录            


:: 获取当前脚本的路径
cd ..
@echo 开始执行; %CD%



::进入根目录 ,提交代码
cd /d %~dp0..


::git提交代码
git add . 
git commit -m "提交; %date:~0,4%-%date:~5,2%-%date:~8,2%; %time:~0,8%"
git push origin master


::错误提示一下,不会继续执行
if %errorlevel% neq 0 (  
    echo 提交失败请查看错误原因
    pause
) 


::换行空白符
@echo ^.
@echo ^..
@echo ^...
@echo ^....
@echo ^.....
@echo ^......
@echo ^.......
@echo ^........
::展示根目录
@echo 已执行完成 %CD%
@echo ^........
@echo ^......
@echo ^.....
@echo ^....
@echo ^...
@echo ^..
@echo ^.



::三秒后关闭
timeout /t 3 > nul