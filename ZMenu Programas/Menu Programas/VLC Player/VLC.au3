#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf

$Nombre='VLC Player'

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. '&$Nombre,160,80,0,110)


$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


If FileExists("vlc-3.0.11-win32.exe") AND not FileExists ($ProgramFilesDir&'\VideoLAN\VLC\vlc.exe') AND not FileExists ($ProgramFilesDir&' (x86)\VideoLAN\VLC\vlc.exe') Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	"&$Nombre&@CRLF)


	ShellExecuteWait("vlc-3.0.11-win32.exe",' /S')



	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	"&$Nombre&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt",$Nombre&@CRLF)
EndIf

