#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. AIMP',160,80,0,110)


If FileExists("aimp_4.60.2180.exe") AND not FileExists (@ProgramFilesDir & "\AIMP\AIMP.exe") AND not FileExists (@ProgramFilesDir & " (x86)\AIMP\AIMP.exe")  Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	AIMP"&@CRLF)

	ShellExecuteWait("aimp_4.60.2180.exe"," /AUTO /SILENT")

	FileCopy('AIMP.ini',@AppDataDir&'\AIMP\AIMP.ini',9)
	FileCopy('Pandemic.acs4.ini',@AppDataDir&'\AIMP\Skins\Pandemic.acs4.ini',9)



	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	AIMP"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","AIMP"&@CRLF)
EndIf

