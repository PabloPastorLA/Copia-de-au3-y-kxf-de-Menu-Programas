
If FileExists("KB\instalar KB.bat") and @OSVersion = "WIN_XP" Then
	ShellExecuteWait("instalar KB.bat","","KB")
	While ProcessExists("wuauclt.exe")
		ProcessClose("wuauclt.exe")
	WEnd
	ProcessWaitClose("wuauclt.exe")

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Actualizaciones XP"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Actualizaciones XP"&@CRLF)
EndIf