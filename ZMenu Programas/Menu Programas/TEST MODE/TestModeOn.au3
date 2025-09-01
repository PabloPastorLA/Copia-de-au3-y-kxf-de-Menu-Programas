#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf

$NombrePrograma='Test Mode On'
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. '&$NombrePrograma,160,80,0,110)

$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


If @OSArch='x64' Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	"&$NombrePrograma&@CRLF)

	ShellExecute('ENABLE TEST MODE.exe')
	WinWait('ENABLE TEST MODE V1.0 Setup')



;MsgBox(0,'','1')
	ShellExecuteWait('bcdedit',' /set TESTSIGNING OFF')


	Sleep(2000)
;MsgBox(0,'','2')

;con 1 y 2 no aparece falla
;con 1 no aparece falla


	Do
		if ControlGetText('ENABLE TEST MODE V1.0 Setup','','Button1')='&Sí' Then ControlClick('ENABLE TEST MODE V1.0 Setup','','Button1')
		if ControlGetText('ENABLE TEST MODE V1.0 Setup','','Button2')='&Sí' Then ControlClick('ENABLE TEST MODE V1.0 Setup','','Button2')
	until not WinExists('ENABLE TEST MODE V1.0 Setup')


;MsgBox(0,'','3')



	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	"&$NombrePrograma&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt",$NombrePrograma&@CRLF)
EndIf



