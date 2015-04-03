@echo off
::===================================::
:: SteamPipe SCRDS Autoupdate Script ::
:: written by raziEiL                ::
:: ~    ~    ~    ~    ~    ~    ~   ::
:: ¬аш сервер будет автоматически    ::
:: обновл€тьс€ при запуске или краше ::
::===================================::

::=======================::
::  онфигураци€ настроек ::
::=======================::
:: ниже укажите ваш логин к стим
set username=anonymous
:: ваш пароль к стим (дл€ логина anonymous оставьте пароль пустым)
set password=
:: путь к папке steamcmd
set runcmd=D:\srcds\steamcmd
:: путь к папке с сервером
set srcdsdir=D:\srcds\csgo
:: Server AppID https://developer.valvesoftware.com/wiki/Dedicated_Servers_List
set appid=740
:: провер€ть целостность файлов сервера при запуске? (0 = нет, 1 = да)
set checkvalid=0
:: параметры запуска сервера
set paramline=-game csgo -console -usercon -port 27015 -condebug +game_type 0 +game_mode 1 +map de_dust2
::=======================::
::  «авершение настроек  ::
::=======================::

if %checkvalid%==0 (
set cmdparam=
) else (
set cmdparam=validate
)

set programname=SteamPipe Autoupdate 1.0, Watchdog
title %programname%

cls
echo Protecting srcds from crashes...
echo If you want to close srcds and this script, close the srcds window and type Y depending on your language followed by Enter.
:srcds
echo (%time%) SteamCMD started, checking for updates...
cd %runcmd%
start /wait steamcmd +login %username% %password% +force_install_dir %srcdsdir% +app_update %appid% %cmdparam% +quit
echo (%time%) srcds started.
cd %srcdsdir%
start /wait /high srcds.exe %paramline%
echo (%time%) WARNING: srcds closed or crashed, restarting.
goto srcds
