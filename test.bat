@echo off
setlocal enabledelayedexpansion



::ɾ��֮ǰ�ļ�¼
del /q "D:\phpstudy_pro\WWW\git\log-b\git_log\*.*"



 
 
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


::���пհ׷�
echo ^.
echo ^..
echo ^...
echo ^....
echo ^.....
echo ^......
echo ^.......
echo ^........
::չʾ��Ŀ¼
echo �ļ��Ѵ�����%target_dir%\%filename%
echo ^........
echo ^......
echo ^.....
echo ^....
echo ^...
echo ^..
echo ^.






::ִ��Git�ύ

:: ��ȡ��ǰ�ű���·��  ��Ŀ¼
cd ..
echo ��ʼִ��; %CD%

::�����Ŀ¼ ,�ύ����
cd /d %~dp0
git add . 
git commit -m "�ύ; %date:~0,4%-%date:~5,2%-%date:~8,2%; %time:~0,8%"
git push -f origin master

::������ʾһ��,�������ִ��
if %errorlevel% neq 0 (  
    echo �ύʧ����鿴����ԭ��
    ::ѭ��ִ��
	cd /d D:\phpstudy_pro\WWW\git\log-b
	call test.bat
) 
	
::���пհ׷�
echo ^.
echo ^..
echo ^...
echo ^....
echo ^.....
echo ^......
echo ^.......
echo ^........
::չʾ��Ŀ¼
echo ��ִ����� %CD%
echo ^........
echo ^......
echo ^.....
echo ^....
echo ^...
echo ^..
echo ^.



::���пհ׷�
echo ^.
echo ^..
echo ^...
echo ^....
echo ^.....
echo ^......
echo ^.......
echo ^........
::չʾ��Ŀ¼
echo �����Ϊ:3600
echo ^........
echo ^......
echo ^.....
echo ^....
echo ^...
echo ^..
echo ^.




::��30��ִ��һ��
::timeout /t %randomNumber% > nul 

::3600��,һ��Сʱ ִ��һ��
timeout /t 3600 > nul 


::ѭ��ִ��
cd /d D:\phpstudy_pro\WWW\git\log-b
call test.bat

 
 
