:: Name:     qgis_ltr_install_update.bat
:: Purpose:  QGIS-LTR automatic install and update using osgeo4w-setup.exe
:: Author:   ricardodepinho@gmail.com
:: Revision: 30 January 2024
:: License: This code is distributed under GNU AGPLv3
:: https://github.com/qgispt/qgis_pt_install_update_bat/blob/main/LICENSE
::
:: This script will:
:: 1. change the current directory to the user downloads folder
:: 2. download the OSGeo4W installer
:: 3. launch it passing command-line parameters to INSTALL OR UPDATE QGIS-LTR FULL
:: 4. copy QGIS Desktop lnk files to user Desktop
:: 
:: Documentation reference: https://trac.osgeo.org/osgeo4w/wiki/CommandLine
::
:: Inspiration from Guts Julien's QGIS powershell deploy and install script
:: https://gist.github.com/Guts/6303dc5eb941eb24be3e27609cd46985

@ECHO OFF
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

:: Set osgeo4w setup variables
SET starter_path=%cd%
SET osgeo4w_file=%UserProfile%\Downloads\osgeo4w-setup.exe
SET osgeo4w-setup_url=http://download.osgeo.org/osgeo4w/v2/osgeo4w-setup.exe
SET osgeo4w_site=http://ftp.osuosl.org/pub/osgeo/download/osgeo4w/v2
SET osgeo4w_root=C:\OSGeo4W
SET osgeo4w_menu=QGIS

SET osgeo4w_startmenu=%APPDATA%\Microsoft\Windows\Start Menu\Programs\%osgeo4w_menu%

:: Set user persistent variable: QGIS_GLOBAL_SETTINGS_FILE
:: uncomment and replace path to set user persistent QGIS_GLOBAL_SETTINGS_FILE 
:: SET qgisglobalsettingsfile=\\server\path\qgis_global_settings\qgis_global_settings.ini
:: CALL SETX QGIS_GLOBAL_SETTINGS_FILE %qgisglobalsettingsfile%

:: ChangeDir to the user download directory
CALL CD /D %UserProfile%\Downloads\

:: Delete installer if exists
IF EXIST %osgeo4w_file% (
  REM Delete existing file
  DEL %osgeo4w_file%
) 

:: Download latest version of osgeo4w-setup.exe
CURL %osgeo4w-setup_url% --output %osgeo4w_file%


:: Download and install QGIS-LTR (same command to upgrade with clean up)
CALL %osgeo4w_file%^
    --advanced^
    --arch x86_64^
    --autoaccept^
    --delete-orphans^
    --menu-name %osgeo4w_menu%^
    --desktop^
    --packages qgis-ltr-full^
    --quiet-mode^
    --root %osgeo4w_root%^
    --site %osgeo4w_site%^
    --upgrade-also


:: Copy QGIS Desktop shortcup links to user Desktop and to onedrive Desktop if onedrive is in use
IF EXIST "%onedrive%\Desktop" (
 CALL ROBOCOPY "%osgeo4w_startmenu%" "%onedrive%\Desktop" "QGIS Desktop*.lnk" "%osgeo4w_startmenu%" /purge  > nul
)
IF EXIST "%onedrivecommercial%\Desktop" (
 CALL ROBOCOPY "%osgeo4w_startmenu%" "%onedrivecommercial%\Desktop" "QGIS Desktop*.lnk" /purge > nul
)
IF EXIST "%UserProfile%\Desktop" (
 CALL ROBOCOPY "%osgeo4w_startmenu%" "%UserProfile%\Desktop" "QGIS Desktop*.lnk" /purge > nul
)

::PAUSE

:END
ENDLOCAL
ECHO ON
@EXIT /B 0
