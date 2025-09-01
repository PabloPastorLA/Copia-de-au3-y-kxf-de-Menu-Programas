#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Teracopy',160,80,0,110)

$fallo=0

If FileExists("Teracopy.exe") AND not FileExists (@ProgramFilesDir & "\Teracopy\Teracopy.exe") AND not FileExists (@ProgramFilesDir & " (x86)\Teracopy\Teracopy.exe")  Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Teracopy"&@CRLF)

	ShellExecuteWait("Teracopy.exe"," /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-")
	RegWrite('HKCU\Software\Code Sector\TeraCopy','ConfirmDrag','REG_SZ',0)
	FileCopy('license',@AppDataDir&'\TeraCopy\license',9)

	if not FileExists (@ProgramFilesDir & "\Teracopy\Teracopy.exe") AND not FileExists (@ProgramFilesDir & " (x86)\Teracopy\Teracopy.exe") Then
		FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Teracopy - (CREO FALTO REINICIAR POR HABERLO DESINSTALADO ANTES)"&@CRLF)
		FileWrite(@DesktopDir & "\Mal Instalado.txt","Teracopy - (CREO FALTO REINICIAR POR HABERLO DESINSTALADO ANTES)"&@CRLF)
		Exit
	EndIf


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Teracopy"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Teracopy"&@CRLF)
EndIf

