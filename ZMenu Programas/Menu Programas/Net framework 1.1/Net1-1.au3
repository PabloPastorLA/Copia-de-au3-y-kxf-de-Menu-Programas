SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Net F 1.1',160,80,0,110)

If FileExists("instalar NET1.bat") Then
	ShellExecuteWait("instalar NET1.bat","","")
	While ProcessExists("wuauclt.exe")
		ProcessClose("wuauclt.exe")
	WEnd
	ProcessWaitClose("wuauclt.exe")

	RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run","DWQueuedReporting")
	RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run","DWQueuedReporting")


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Net Framework 1"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Net Framework 1"&@CRLF)
EndIf


