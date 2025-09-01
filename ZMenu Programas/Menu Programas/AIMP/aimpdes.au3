#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. AIMP',160,80,0,110)

$programfiles=@ProgramFilesDir
if StringRight($programfiles,6)=' (x86)' then $programfiles=StringTrimRight($programfiles,6)


If FileExists ($programfiles & "\AIMP\AIMP.exe") or FileExists ($programfiles & " (x86)\AIMP\AIMP.exe")  Then
	FileWrite(@DesktopDir & "\Bien DesInstalado.txt","Empecé a desinstalar:	   AIMP"&@CRLF)

	if FileExists($programfiles&' (x86)\AIMP\Uninstall.exe') then
		ShellExecute($programfiles&' (x86)\AIMP\Uninstall.exe')
	ElseIf FileExists($programfiles&'\AIMP\Uninstall.exe') then
		ShellExecute($programfiles&'\AIMP\Uninstall.exe')
	Else
		MsgBox(0,'Aimp','No encontre desinstalador aimp. Cerrando')
		Execute
	EndIf

	WinWait('Select Language')
	Do
		ControlClick('Select Language','','TACLButton1')
		Sleep(300)
	Until not WinExists('Select Language')


	WinWait('Asistente de Instalación de AIMP')
	Do
		if ControlCommand('Asistente de Instalación de AIMP','','TACLButton1','isenabled','')=1 then ControlClick('Asistente de Instalación de AIMP','','TACLButton1')
		Sleep(300)
	Until not WinExists('Asistente de Instalación de AIMP')



	DirRemove(@AppDataDir&'\AIMP',1)
	DirRemove(@ProgramFilesDir & "\AIMP\",1)
	DirRemove(@ProgramFilesDir & " (x86)\AIMP\",1)


	FileWrite(@DesktopDir & "\Bien DesInstalado.txt","Terminé de desinstal:	   AIMP"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal DesInstalado.txt","AIMP"&@CRLF)
EndIf

