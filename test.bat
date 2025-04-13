@echo off
setlocal enabledelayedexpansion
title ִ��log-b�ύgithub����

:main_loop
::ɾ��֮ǰ�ļ�¼
del /q "D:\phpstudy_pro\WWW\git\log-b\git_log\*.*" >nul 2>&1

REM ��ȡ��ǰ���ں�ʱ��
for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set datetime=%%a

REM ��ȡ������ʱ����
set "year=!datetime:~0,4!"
set "month=!datetime:~4,2!"
set "day=!datetime:~6,2!"
set "hour=!datetime:~8,2!"
set "minute=!datetime:~10,2!"
set "second=!datetime:~12,2!"

REM ָ��Ŀ��Ŀ¼
set "target_dir=D:\phpstudy_pro\WWW\git\log-b\git_log"

REM �����ļ���������
set "filename=%year%%month%%day%_%hour%.txt"
set "filecontent=%year%-%month%-%day% %hour%:%minute%:%second%"

REM �����ļ�
echo %filecontent% > "%target_dir%\%filename%"

::��ʾ��Ϣ
call :display_info "�ļ��Ѵ�����%target_dir%\%filename%"

::ִ��Git�ύ
cd /d "D:\phpstudy_pro\WWW\git\log-b"
git add . 
git commit -m "�ύ; %date:~0,4%-%date:~5,2%-%date:~8,2%; %time:~0,8%"
git push -f origin master

::������
if %errorlevel% neq 0 (
    call :display_info "�ύʧ����鿴����ԭ��"
    timeout /t 60 >nul  // ʧ�ܺ�ȴ�1����������
    goto main_loop
)

call :display_info "��ִ����� %CD%"
call :display_info "�ȴ�3600��(1Сʱ)���ٴ�ִ��"

::�ȴ�1Сʱ���ٴ�ִ��
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