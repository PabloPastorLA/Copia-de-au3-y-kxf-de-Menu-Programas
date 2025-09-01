SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. IE8',160,80,0,110)

If FileExists("instalar IE8.bat") and @OSVersion = "WIN_XP" Then
   ShellExecuteWait("instalar IE8.bat","","")
   While ProcessExists("wuauclt.exe")
	  ProcessClose("wuauclt.exe")
   WEnd
   ProcessWaitClose("wuauclt.exe")

   FileWrite(@DesktopDir & "\Bien Instalado.txt","Internet Explorer 8"&@CRLF)
else
   FileWrite(@DesktopDir & "\Mal Instalado.txt","Internet Explorer 8"&@CRLF)
EndIf