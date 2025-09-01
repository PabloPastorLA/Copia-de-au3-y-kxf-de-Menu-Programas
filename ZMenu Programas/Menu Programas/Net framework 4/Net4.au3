#include <File.au3>
if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf




$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


;4.00
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Net F 4.0.0',160,80,0,110)
If FileExists("dotNetFx40_Full_x86_x64.exe") and not FileExists($ProgramFilesDir&'\MenuInstalado\N400') Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Net Framework 4.0.0"&@CRLF)
	ShellExecuteWait("dotNetFx40_Full_x86_x64.exe"," /q /norestart","")
	DirCreate($ProgramFilesDir&'\MenuInstalado')
	FileWrite($ProgramFilesDir&'\MenuInstalado\N400','')
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Net Framework 4.0.0"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Net Framework 4.0"&@CRLF)
EndIf

;4.5
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Net F 4.5',160,80,0,110)
If FileExists("dotnetfx45_full_x86_x64.exe") and not FileExists($ProgramFilesDir&'\MenuInstalado\N450') Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Net Framework 4.5"&@CRLF)
	ShellExecuteWait("dotnetfx45_full_x86_x64.exe"," /q /norestart","")
	DirCreate($ProgramFilesDir&'\MenuInstalado')
	FileWrite($ProgramFilesDir&'\MenuInstalado\N450','')
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Net Framework 4.5"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Net Framework 4.5"&@CRLF)
EndIf

;4.51
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Net F 4.5.1',160,80,0,110)
If FileExists("NDP451-KB2858728-x86-x64-AllOS-ENU.exe") and not FileExists($ProgramFilesDir&'\MenuInstalado\N451') Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Net Framework 4.5.1"&@CRLF)
	ShellExecuteWait("NDP451-KB2858728-x86-x64-AllOS-ENU.exe"," /q /norestart","")
	DirCreate($ProgramFilesDir&'\MenuInstalado')
	FileWrite($ProgramFilesDir&'\MenuInstalado\N451','')
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Net Framework 4.5.1"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Net Framework 4.5.1"&@CRLF)
EndIf

;4.52
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Net F 4.5.2',160,80,0,110)
If FileExists("NDP452-KB2901907-x86-x64-AllOS-ENU.exe") and not FileExists($ProgramFilesDir&'\MenuInstalado\N452') Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Net Framework 4.5.2"&@CRLF)
	ShellExecuteWait("NDP452-KB2901907-x86-x64-AllOS-ENU.exe"," /q /norestart","")
	DirCreate($ProgramFilesDir&'\MenuInstalado')
	FileWrite($ProgramFilesDir&'\MenuInstalado\N452','')
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Net Framework 4.5.2"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Net Framework 4.5.2"&@CRLF)
EndIf

;4.6
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Net F 4.6',160,80,0,110)
If FileExists("NDP46-KB3045557-x86-x64-AllOS-ENU.exe") and not FileExists($ProgramFilesDir&'\MenuInstalado\N460') Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Net Framework 4.6"&@CRLF)
	ShellExecuteWait("NDP46-KB3045557-x86-x64-AllOS-ENU.exe"," /q /norestart","")
	DirCreate($ProgramFilesDir&'\MenuInstalado')
	FileWrite($ProgramFilesDir&'\MenuInstalado\N460','')
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Net Framework 4.6"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Net Framework 4.6"&@CRLF)
EndIf

;4.61
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Net F 4.6.1',160,80,0,110)
If FileExists("NDP461-KB3102436-x86-x64-AllOS-ENU.exe") and not FileExists($ProgramFilesDir&'\MenuInstalado\N461') Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Net Framework 4.6.1"&@CRLF)
	ShellExecuteWait("NDP461-KB3102436-x86-x64-AllOS-ENU.exe"," /q /norestart","")
	DirCreate($ProgramFilesDir&'\MenuInstalado')
	FileWrite($ProgramFilesDir&'\MenuInstalado\N461','')
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Net Framework 4.6.1"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Net Framework 4.6.1"&@CRLF)
EndIf

;4.62
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Net F 4.6.2',160,80,0,110)
If FileExists("NDP462-KB3151800-x86-x64-AllOS-ENU.exe") and not FileExists($ProgramFilesDir&'\MenuInstalado\N462') Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Net Framework 4.6.2"&@CRLF)
	ShellExecuteWait("NDP462-KB3151800-x86-x64-AllOS-ENU.exe"," /q /norestart","")
	DirCreate($ProgramFilesDir&'\MenuInstalado')
	FileWrite($ProgramFilesDir&'\MenuInstalado\N462','')
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Net Framework 4.6.2"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Net Framework 4.6.2"&@CRLF)
EndIf

;4.7
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Net F 4.7',160,80,0,110)
If FileExists("ndp47-kb3186497-x86-x64-allos-enu.exe") and not FileExists($ProgramFilesDir&'\MenuInstalado\N470') Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Net Framework 4.7.0"&@CRLF)
	ShellExecuteWait("ndp47-kb3186497-x86-x64-allos-enu.exe"," /q /norestart","")
	DirCreate($ProgramFilesDir&'\MenuInstalado')
	FileWrite($ProgramFilesDir&'\MenuInstalado\N470','')
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Net Framework 4.7.0"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Net Framework 4.7.0"&@CRLF)
EndIf

;4.7.1
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Net F 4.7.1',160,80,0,110)
If FileExists("ndp471-kb4033342-x86-x64-allos-enu.exe") and not FileExists($ProgramFilesDir&'\MenuInstalado\N471') Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Net Framework 4.7.1"&@CRLF)
	ShellExecuteWait("ndp471-kb4033342-x86-x64-allos-enu.exe"," /q /norestart","")
	DirCreate($ProgramFilesDir&'\MenuInstalado')
	FileWrite($ProgramFilesDir&'\MenuInstalado\N471','')
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Net Framework 4.7.1"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Net Framework 4.7.1"&@CRLF)
EndIf

;4.7.2
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Net F 4.7.2',160,80,0,110)
If FileExists("ndp472-kb4054530-x86-x64-allos-enu.exe") and not FileExists($ProgramFilesDir&'\MenuInstalado\N472') Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Net Framework 4.7.2"&@CRLF)
	ShellExecuteWait("ndp472-kb4054530-x86-x64-allos-enu.exe"," /q /norestart","")
	DirCreate($ProgramFilesDir&'\MenuInstalado')
	FileWrite($ProgramFilesDir&'\MenuInstalado\N472','')
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Net Framework 4.7.2"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Net Framework 4.7.2"&@CRLF)
EndIf

;4.8
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Net F 4.8',160,80,0,110)
If FileExists("ndp48-x86-x64-allos-enu.exe") and not FileExists($ProgramFilesDir&'\MenuInstalado\N480') Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Net Framework 4.8"&@CRLF)
	ShellExecuteWait("ndp48-x86-x64-allos-enu.exe"," /q /norestart","")
	DirCreate($ProgramFilesDir&'\MenuInstalado')
	FileWrite($ProgramFilesDir&'\MenuInstalado\N480','')
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Net Framework 4.8"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Net Framework 4.8"&@CRLF)
EndIf

;4.8.1
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Net F 4.8.1',160,80,0,110)
If FileExists("ndp481-x86-x64-allos-enu.exe") and not FileExists($ProgramFilesDir&'\MenuInstalado\N481') Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Net Framework 4.8.1"&@CRLF)
	ShellExecuteWait("ndp481-x86-x64-allos-enu.exe"," /q /norestart","")
	DirCreate($ProgramFilesDir&'\MenuInstalado')
	FileWrite($ProgramFilesDir&'\MenuInstalado\N481','')
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Net Framework 4.8.1"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Net Framework 4.8.1"&@CRLF)
EndIf



