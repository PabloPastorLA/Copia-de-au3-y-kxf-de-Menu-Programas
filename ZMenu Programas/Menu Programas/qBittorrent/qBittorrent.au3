#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. qBittorrent',160,80,0,110)


$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


If FileExists("qbittorrent_4.2.5_setup.exe") AND FileExists("qbittorrent_4.2.5_x64_setup.exe") AND not FileExists ($ProgramFilesDir & "\qBittorrent\qbittorrent.exe") AND not FileExists ($ProgramFilesDir & " (x86)\qBittorrent\qbittorrent.exe") Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	qBittorrent"&@CRLF)

	FileCopy('qBittorrent definitivo.ini',@AppDataDir&'\qBittorrent\qBittorrent.ini',9)

	if @OSArch= 'x86' then ShellExecuteWait("qbittorrent_4.2.5_setup.exe"," /S")
	if @OSArch<>'x86' then ShellExecuteWait("qbittorrent_4.2.5_x64_setup.exe"," /S")


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	qBittorrent"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","qBittorrent"&@CRLF)
EndIf

