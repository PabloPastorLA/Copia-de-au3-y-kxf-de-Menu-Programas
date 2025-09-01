SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Unlocker',160,80,0,110)


If FileExists("Unlocker1.9.2.exe") AND not FileExists (@ProgramFilesDir & "\Unlocker\Unlocker.exe") AND not FileExists (@ProgramFilesDir & " (x86)\Unlocker\Unlocker.exe")  Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Unlocker"&@CRLF)
	ShellExecuteWait('Unlocker1.9.2.exe',' /S')

	RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "UnlockerAssistant")

	ProcessClose ( "UnlockerAssistant.exe" )

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Unlocker"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Unlocker"&@CRLF)
EndIf

