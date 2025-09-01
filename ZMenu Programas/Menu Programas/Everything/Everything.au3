#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Everything',160,80,0,110)


;~ 	if @OSArch<>'x86' then ShellExecuteWait('regedit',' /s "everythingx64.reg"')


$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


If FileExists("Everything-1.4.1.969.x86-Setup.exe") AND FileExists("Everything-1.4.1.969.x64-Setup.exe") AND not FileExists ($ProgramFilesDir & "\Everything\Everything.exe") AND not FileExists ($ProgramFilesDir & " (x86)\Everything\Everything.exe") Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Everything"&@CRLF)

	if @OSArch= 'x86' then ShellExecuteWait("Everything-1.4.1.969.x86-Setup.exe"," /S")
	if @OSArch<>'x86' then ShellExecuteWait("Everything-1.4.1.969.x64-Setup.exe"," /S")

;borrar inicio
	RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','Everything')

;crear servicio
	if @OSArch='x86' then ShellExecuteWait('regedit',' /s "everythingx86.reg"')
	if @OSArch<>'x86' then ShellExecuteWait('regedit',' /s "everythingx64.reg"')



	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Everything"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Everything"&@CRLF)
EndIf

