if @OSVersion <> 'WIN_XP' Then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. TotalCMD',160,80,0,110)
If @OSArch="X86" Then
	x86()
Else
	x64()
EndIf




Func x86()

	If FileExists("tcm801x32_64\INSTALL.EXE") AND not FileExists ("C:\totalcmd\TOTALCMD.EXE")  Then
		FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Total Commander"&@CRLF)
	;~ 	ShellExecuteWait('Instalar TC x86.bat','')
		ShellExecuteWait('tcm801x32_64\INSTALL.EXE','')

		FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Total Commander"&@CRLF)
	else
		FileWrite(@DesktopDir & "\Mal Instalado.txt","Total Commander"&@CRLF)
	EndIf
EndFunc

Func x64()
	If FileExists("tcm801x32_64\INSTALL64.EXE") AND not FileExists ("C:\totalcmd\TOTALCMD.EXE")  Then
		FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Total Commander"&@CRLF)

	;~ 	ShellExecuteWait('Instalar TC x64.bat','')
		ShellExecuteWait('tcm801x32_64\INSTALL64.EXE','');'tcm801x32_64')

		FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Total Commander"&@CRLF)
	else
		FileWrite(@DesktopDir & "\Mal Instalado.txt","Total Commander"&@CRLF)
	EndIf

EndFunc