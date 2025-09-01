#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf

$Nombre='LiLi USB'

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. '&$Nombre,160,80,0,110)


$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


If FileExists("LinuxLive USB Creator 2.9.4.exe") AND FileExists("LinuxLive USB Creator 2.9.4.exe") AND not FileExists ($ProgramFilesDir & "\LinuxLive USB Creator\LiLi USB Creator.exe") AND not FileExists ($ProgramFilesDir & " (x86)\LinuxLive USB Creator\LiLi USB Creator.exe") Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	"&$Nombre&@CRLF)

;~ 	FileCopy('qBittorrent definitivo.ini',@AppDataDir&'\qBittorrent\qBittorrent.ini',9)

	ShellExecuteWait("LinuxLive USB Creator 2.9.4.exe",' /S')


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	"&$Nombre&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt",$Nombre&@CRLF)
EndIf

