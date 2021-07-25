@echo off
:RELOAD_SCRIPT
REM ���ᨨ ࠭�� XP �������ন������
ver|find "5.1" >nul
if '%errorlevel%'=='0' set WV=Windows XP
ver|find "6.0" >nul
if '%errorlevel%'=='0' set WV=Windows Vista
ver|find "6.1" >nul
if '%errorlevel%'=='0' set WV=Windows 7
ver|find "6.3" >nul
if '%errorlevel%'=='0' set WV=Windows 8.1
ver|find "10" >nul
if '%errorlevel%'=='0' set WV=Windows 10
ver|find "22000" >nul
if '%errorlevel%'=='0' set WV=Windows 11
IF Not Defined ProgramFiles(x86) (Set type=x86) ELSE (Set type=x64)
set ver=3.0 Nestaudevs
set vermenu=5 NetGraph
If /i "%~1" == "-h" (set arg=-h&goto :help)
If /i "%~1" == "-v" (set arg=-v&echo.%ver%&&Exit /B)
If /i "%~1" == "-d" (set arg=-d&goto :Debug)
If /i "%~1" == "-si" (set arg=-si&goto :start)
If /i "%~1" == "-ping" (set arg=-ping&goto :net)
If /i "%~1" == "-run" (set arg=-run&goto :run)
REM �� �� ��� ������� �����?
ping localhost -n 1 >nul
goto :Title
                                                           :start
cls
title Batus %ver%
echo.                    �६� = %time%    ��� = %date%
echo [ver] ����� �ਯ�
echo [clean] ���⪠
echo [run] ��������
echo [net] ����
echo [off] �몫�祭�� ��
echo [heal] �஢�ઠ windows
echo [game] ����
echo [gs] ���� � ���୥�
echo [set] ����ன��
echo [exit] ��室
call :randsplash
echo.                %ST%

set /p Ch=�롥��:
if '%Ch%'=='game' goto :game
if '%Ch%'=='D' goto :Debug
if '%Ch%'=='ver' goto :ver
if '%ch%'=='gs' goto :googlesearch
if '%Ch%'=='exit' cls & title cmd & exit /B
if '%Ch%'=='x' cls & title cmd & exit /B
if '%Ch%'=='off' goto :Restart
if '%Ch%'=='heal' goto :heal
if '%Ch%'=='net' goto :NET
if '%Ch%'=='run' goto :run
if '%Ch%'=='set' goto :set
if '%Ch%'=='clean' goto :clean
goto start

        :set
cls
echo [x] �����
echo [color] �������� 梥� �ਯ�
echo [Debug] Debug �㭪樨
set /p Ch=
if '%Ch%'=='x' goto :start
if '%Ch%'=='Debug' goto Debug
if '%Ch%'=='color' goto :color
:color
cls
echo [x] �����
echo �� ����� 梥� ��������?
echo  (��� + ⥪��)
echo.
echo  0 = ����      8 = ���
echo  1 = �����       9 = ᢥ�� ᨭ��
echo  2 = �����     A = ᢥ�� �����
echo  3 = ���㡮�     B = ᢥ�� ���㡮�
echo  4 = ����     C = ᢥ�� ����
echo  5 = ������   D = ᢥ�� ������
echo  6 = ����      E = ᢥ�� ����
echo  7 = ����       F = ᢥ�� ����
echo.
echo [w] ��� ������⭮
echo [d] �񬭠� ⥬�
echo [l] ���⫠� ⥬�
call :color 2
call :echo "[color]" /
set /p ch=:
if '%Ch%'=='x' goto :set
if '%Ch%'=='r' color EF & goto set
if '%Ch%'=='d' color 0f & goto set
if '%Ch%'=='l' color f0 & goto set
if '%Ch%'=='w' cls & color /? & timeout /t -1 & goto set
color %ch%
goto :color

        :NET
cls
title Batus %ver%
echo [x] �����
echo [h] ������
echo ������� �������� ��� ᫮�� ����, �.�. �� ping 8.8.8.8, � 8.8.8.8
echo ������ ip ����:
call :color 2
call :echo "[ping]" /
set /p ch=:
if '%Ch%'=='x' goto :start
if '%Ch%'=='h' cls & ping & pause & goto NET
ping %ch%
pause
goto :NET

        :heal
cls
echo [x] �����
echo [1] sfc /scannow
echo [2] dism /online /cleanup-image /restorehealth
echo [3] ��� �����
echo [4] ���⥬��� ���
echo.
echo ��������! ��ਯ� ������ ���� ����饭 �� ������
set /p ch=
if '%Ch%'=='x' goto :start
if '%Ch%'=='1' sfc /scannow & pause & goto heal
if '%Ch%'=='2' dism /online /cleanup-image /restorehealth & pause & goto heal
if '%Ch%'=='3' sfc /scannow & dism /online /cleanup-image /restorehealth & pause & goto heal
if '%Ch%'=='4' cls & systeminfo & pause & goto heal
goto heal

        :googlesearch
cls
echo [x] �����
echo [b] �ࠧ� � ��㧥�
echo.
echo. GOOGLE ����
echo. _____________
echo.
echo. �� �饬?
echo.
echo  PS �᫨ ���� � �஡����� - ���� � ����窠� - "������ ��� ��ᯫ�⭮ ��� ��� � ॣ����樨"
echo.
set /p ch=))
if not defined ch goto :googlesearch
if '%Ch%'=='x' goto :start
if '%ch%'=='b' if EXIST "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" (start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "https://www.google.com/" & goto start) ELSE start "C:\Program Files\Internet Explorer\iexplore.exe" "https://www.google.com/" & goto start
if EXIST "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" (start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "www.google.com/search?q=%ch%") ELSE start "C:\Program Files\Internet Explorer\iexplore.exe" "www.google.com/search?q=%ch%"
echo ������� "%ch%" � ������� Google.com
ping localhost -n 3 >nul
goto :googlesearch

        :game
cls
echo [x] �����
echo [try] ������ �᫮
set /p Ch=
if '%Ch%'=='x' goto :start
if '%Ch%'=='try' goto :try
goto game

        :Restart
cls
echo [x] �����
echo [1] �����襭�� ࠡ���
echo [2] ��� �� ��⥬�
echo [3] ��१���㧪�
echo [4] ����䥩�
set /p Ch=
if '%Ch%'=='1' shutdown /s /t 1&pause
if '%Ch%'=='2' shutdown /l /t 1&pause
if '%Ch%'=='3' shutdown /r /t 1&pause
if '%Ch%'=='4' shutdown /I&pause
if '%Ch%'=='x' goto :start
goto Restart


        :clean
cls
echo [x] �����
echo.
echo [1] ���⪠ Appdata\Temp
echo [2] ���⪠ Windows\Temp
echo [3] ���⪠ �ᥣ�
echo [4] �������� 䠩�� Appdata\Temp
echo [5] �������� 䠩�� Windows\Temp
echo.
echo ���᪠���: ��� �ࠢ��쭮� ����⪨ ������� �ਯ� � �ࠢ��� ������
set /p Ch=
if '%Ch%'=='1' (cls & echo ����� \Appdata\Temp... & echo. & del %USERPROFILE%\appdata\Local\Temp /q /f & echo \Appdata\Temp ��⪠ �����祭�! & timeout /t -1 & goto clean)
if '%Ch%'=='2' (cls & echo ����� \Windows\Temp... & echo. & del %SYSTEMROOT%\Temp /q /f & echo \Windows\Temp ��⪠ �����祭�! & timeout /t -1 & goto clean)
if '%Ch%'=='3' goto :AppdataANDwindowsTempClear
if '%Ch%'=='4' cls&cd %USERPROFILE%\appdata\Local\Temp&dir&timeout /t -1&goto start
if '%Ch%'=='5' cls&cd %SYSTEMROOT%\Temp&dir&timeout /t -1&goto start
if '%Ch%'=='x' goto :start
goto clean
:AppdataANDwindowsTempClear
cls
echo ����� \Appdata\Temp...
echo.
ping localhost -n 2 >nul
del %USERPROFILE%\appdata\Local\Temp /q /f
echo.
echo \Appdata\Temp ��⪠ �����祭�!
echo.
timeout /t -1
cls
echo ����� C:\Windows\Temp...
echo.
del %SYSTEMROOT%\Temp /q /f
echo \Windows\Temp ��⪠ �����祭�!
timeout /t -1
goto clean

        :run
cls
title Batus %ver%
cd C:\Program Files\Process Hacker 2
cls
echo OS = %WV% %type%
echo.
echo [x] �����
echo [kill] 㡨��
if exist C:\adb (echo [adb] Android Debug Bridge) ELSE echo.
echo [1] Explorer
echo [2] ��ᯥ��� �����
if exist ProcessHacker.exe (echo [3] Process Hacker 2) ELSE echo [3] Process Hacker 2 �� ��⠭�����, ����� ����������
echo [4] ��������� �⮪�
echo [5] ������ �ࠢ�����
echo [6] � ��
echo [7] DXDiag
echo [8] �������
echo [9] ��������
echo [10] ������ ����ᮢ
echo [11] Winver
echo [12] ���᮫� mmc
echo [13] PowerShell
echo [14] Diskpart
set /p Ch=
if '%Ch%'=='x' goto start
if '%Ch%'=='1' cd %SYSTEMROOT%\system32&explorer.exe&goto run
if '%Ch%'=='2' cd %SYSTEMROOT%\system32&taskmgr.exe&goto run
if '%Ch%'=='3' cd C:\Program Files\Process Hacker 2&ProcessHacker.exe&goto run
if '%Ch%'=='4' echo. & echo �⮡� ��� ������ "exit" & echo. & cd %SYSTEMROOT%\system32&cmd.exe&goto run
if '%Ch%'=='5' cd %SYSTEMROOT%\system32&control.exe&goto run
if '%Ch%'=='6' cd %SYSTEMROOT%\system32&msinfo32.exe&goto run
if '%Ch%'=='7' cd %SYSTEMROOT%\system32&dxdiag.exe&goto run
if '%Ch%'=='8' cd %SYSTEMROOT%\system32&notepad.exe&goto run
if '%Ch%'=='9' cd %SYSTEMROOT%\system32&calc.exe&goto run
if '%Ch%'=='10' cd %SYSTEMROOT%\system32&perfmon.exe&goto run
if '%Ch%'=='11' cd %SYSTEMROOT%\system32&winver.exe&goto run
if '%Ch%'=='12' cd %SYSTEMROOT%\system32&mmc.exe&goto run
if '%Ch%'=='13' cls & echo. & echo �⮡� ��� ������ "exit" & echo. & cd %SYSTEMROOT%\system32\WindowsPowerShell\v1.0&powershell.exe&goto run
if '%Ch%'=='14' cd %SYSTEMROOT%\system32&diskpart.exe&goto run
if '%Ch%'=='adb' cd C:\ADB & start %SYSTEMROOT%\system32\cmd.exe
if '%Ch%'=='kill' goto :kill
goto run
:kill
cls
echo [x] �����
echo [1] 㡨�� Explorer
echo [2] 㡨�� ��ᯥ��� �����
echo [u] ��१���㧨�� �ਯ�
echo [xx] ��室
set /p Ch=
if '%Ch%'=='x' goto run
if '%Ch%'=='u' ping localhost -n 4 >nul & goto RELOAD_SCRIPT
if '%Ch%'=='1' taskkill /IM explorer.exe
if '%Ch%'=='2' taskkill /IM taskmgr.exe
if '%Ch%'=='xx' Exit /B
goto run
        :try
cls
title ������ �᫮
set /a answer=%RANDOM%
echo ��� 㣠��� �᫮ seJma, ��ॢ� Russanandres
echo.
echo -------------------------------------------------
echo �ਢ��, �� ��� 㣠��� �᫮
echo. 
echo ���஡� 㣠���� �᫮
echo.
echo [x] �����
echo -------------------------------------------------
echo. 
:top
echo. 
set /p guess=
echo. 
if %guess% GTR %answer% ECHO �����! 
if %guess% LSS %answer% ECHO �����! 
if %guess%==%answer% GOTO TryWin
if '%guess%'=='x' goto :start
goto top
:TryWin
cls
echo ����ࠢ���, �� 㣠���!!! 
echo. 
timeout /t -1
goto start


:ver
if not defined arg set arg=���
cls
echo.
echo    66608080977                                                                                 
echo   78808088808882                          252                                                  
echo    808       8086                         080                                                  
echo    088        808                         808                                                  
echo    888        080       1808888882     88808080888    080        7887      708080802           
echo    080       0887      088277 74808    12780871251    888        1801     8087  7780           
echo    808712258885        7        7808      088         888        7087    908                   
echo    88880808880817                880      888         888        7807    7805                  
echo    888       70800         714452808      088         080        7087     180801               
echo    080         0887    7808080888080      808         808        7887       76808087           
echo    888         2889   7888       808      088         080        7087           78087          
echo    880         8807   888        880      888         808        0807             808          
echo    808       70889    0887     70888      8807        7808     108087    87      7885          
echo   788880808880887      8808080885888       0808880     1808088801 885    88088808882           
echo    7777171777            798067  717        750857       758047   12       1988817     
echo.
echo ����� �ਯ�: %ver%
echo ����� ����: %vermenu%
echo.
echo ����饭�� � ��㬥�⮬: %arg%
echo.
ver
echo.
timeout /t -1
goto start
:Title
REM ��������� ������
cls
title Good morning, and welcome to the Batus transit system.
if exist C:\Users set uservar=%Username%     
echo.
echo.
echo.
echo    �����۲��                                                                 
echo    �����������                     ��                                        
echo    ���     ����                   ���                                        
echo    ���      ���     �����۲�    ����۲���   ���      ���     �����۱         
echo    ���     ��۱    ���۲����۰  ���������   ���      ���    ��۲���۱        
echo    ����������      ��      ���     ��       ���      ���   ���               
echo    ��۲�۲���۲            ���    ���       ���      ���    ��۱             
echo    ���       ���    ����������    ���       ���      ���     ����۲�         
echo    ���       ���   ��۱    ���    ���       ���      ���        ���۲        
echo    ���       ���  ���      ���    ���       ���      ���          ���        
echo    ��۲��������    ��۱�������     ��۱��    ��۲�������   �۲�����۲        
echo    ��������۲�      �����۱���     ������     ������  ��   �������۱  
echo.
echo	   ��᭨��� � ���� ����� %username%, ��᭨��� � ����.
echo.
ping localhost -n 2 >nul
goto start
:help
echo.
echo.
echo.
echo    dBMBBBQBQBBQ                                                                        
echo    BgBBgiiiPgBQQB                       QBQB                                           
echo    qBBB      gBBBv                      BQBB                                           
echo    gBBg      VBBMi     YQBBQQBQBd    sQBQBQQQBBB   BQBR      BQBB      BBBBQBBB
echo    KBQB      QQgr     BBBBYiijBQBQi  iQQBQBQBQBg   QBQB      BBQB    RBQBi  iQQ
echo    MBBgBQBBBBBQ                BgBg     QBQQ       BBBB      QBQB    BgBI
echo    IQQBgIkqdBgBBQi             BBMB     BgBB       gBBQ      QBQB    QBQBg
echo    PBBQ       BBRBr     KBBBQBRBBBB     BBQB       BRBB      QBBM     rBBQBBQg
echo    bQMB       iBBRB   BRBgi    BBBB     BgBM       QBQB      EBQB         PMBRBP
echo    MMBB       ZBMBS  vBBB      BgBQ     QBMB       BgBR      BBBB           RBQB
echo    gBgBZirrvqBBRBD    BBQb    BQBRB     BQBQg iv   iBRBQuivRBBBQB    MI     BMBQ
echo    BQBBBQBQBRBQq       BBBMBRBgUgBB      BBBBBBQ    rBRBMQQB  gQM    BQBBBQBgBv
echo                                                          %ver%
echo.
echo.
echo �� ������㭪樮����� bat �ਯ�
echo ��㬥��� ����᪠: -v, -h, -si, -ping, -run
echo -v - �뢮��� ����� �� ��࠭
echo -h - ��� ⥪��
echo -si - ������ ����� (᪨� ����)
echo -ping - ���室 � ࠧ��� ����
echo -run - ���室 � ࠧ��� �����
echo.
Exit /B
:Debug
cls
title batus, actually
echo.
echo errorlevel = %errorlevel%
echo.
echo [x] �����
echo [1]:RELOAD_SCRIPT
echo [2]:kill
echo [3]:Title
echo [4] ���㫨�� ��㬥�� ����᪠
echo [on] ������� �⪫����
echo [off] �몫���� �⪫����
set /p Ch=�롥��:
if '%Ch%'=='1' goto :RELOAD_SCRIPT
if '%Ch%'=='2' goto :kill
if '%Ch%'=='3' goto :Title
if '%Ch%'=='4' set arg=��� & echo done & pause & goto Debug
if '%Ch%'=='on' @echo on & ping localhost -n 2 >nul & goto :RELOAD_SCRIPT
if '%Ch%'=='off' @echo off & ping localhost -n 2 >nul & goto :RELOAD_SCRIPT
if '%Ch%'=='x' goto start
goto Debug

:color
 set c=%1& exit/b
 
:echo
 for /f %%i in ('"prompt $h& for %%i in (.) do rem"') do (
  pushd "%~dp0"& <nul>"%~1_" set/p="%%i%%i  "& findstr/a:%c% . "%~1_*"
  (if "%~2" neq "/" echo.)& del "%~1_"& popd& set c=& exit/b
 )

:randsplash
set a=
set /a a=(53 * %random%) / 32768 + 1
if %a%==1 set ST=������� Russanandres!
if %a%==2 set ST=������ � BAT!
if %a%==3 set ST=�⮩! ��⫫���!
if %a%==4 set ST=Then the batus is sus!
if %a%==5 set ST=��� ���!
if %a%==6 set ST=�� ⮫쪮 ��� Windows!
if %a%==7 set ST=�७�!
if %a%==8 set ST=��� �����७⮢!
if %a%==9 set ST=��⠢����� �� �裡!
if %a%==10 set ST=�������⢪��#0420!
if %a%==11 set ST=1 ������ �� 75 �㡫��!
if %a%==12 set ST=��� ᠬ� ���訩 batch!
if %a%==13 set ST=500 ��ப ����, �� ��� 祣�?
if %a%==14 set ST=�࠭������!
if %a%==15 set ST=���, �� ���ਪ!
if %a%==16 set ST=������ � �㯨����!
if %a%==17 set ST=��⪮!
if %a%==18 set ST=https://t.me/bat_by_RR!
if %a%==19 set ST=����������!
if %a%==20 set ST=����ࢮ����� ��� �㪢!
if %a%==21 set ST=���� �����!
if %a%==22 set ST=���⨪ �� ����!
if %a%==23 set ST=Aperture science � ᮮ⢥��⢨� � Black Mesa!
if %a%==24 set ST=������� ��-� ��ᠫ ��� ��� � ��譥� �஬�ᮬ��!
if %a%==25 set ST=��ப�� Russanandres ����, �� �ᥣ�� � ����!
if %a%==26 set ST=Notepad++!
if %a%==27 set ST=�� �� ᤥ����� �᫨ ����� ���� ⥡� �����?
if %a%==28 set ST=������� 1 祫������!
if %a%==29 set ST=�� ���� �ࠡ?
if %a%==30 set ST=������� � ������� DOS'�!
if %a%==31 set ST=��� ⥡� ⠪��, ���� ���?
if %a%==32 set ST=Access denied!
if %a%==33 set ST=������ � ������!
if %a%==34 set ST=1, 2, 3, clear!
if %a%==35 set ST=Ububububububububuntu!
if %a%==36 set ST=Now on Russian!
if %a%==37 set ST=LOL!
if %a%==38 set ST=�����������!
if %a%==39 set ST=Plug-and-Play!
if %a%==40 set ST=��� ���� �����!
if %a%==41 set ST=� ��� ����!
if %a%==42 set ST=�� ��, ������ ४���� ��孮�࠯��?
if %a%==43 set ST=����� ᪠��� ᥩ��!
if %a%==44 set ST=��������� ��� ��� �����, ������������!
if %a%==45 set ST=������� � ��⠥!
if %a%==46 set ST=BffAlpha.sh
if %a%==47 set ST=�� ��⮢�, ���?
if %a%==48 set ST=������ ���� �⠡��쭥�!
if %a%==49 set ST=������ � ��ࠬ�!
if %a%==50 set ST=Debian GNU/Linux!
if %a%==51 set ST=sussy balls!
if %a%==52 set ST=Just Do It!
if %a%==53 set ST=sussy baka!