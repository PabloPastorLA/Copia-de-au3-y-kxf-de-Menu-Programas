	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Desinf. MBAM',160,80,0,110)


If FileExists (@ProgramFilesDir & '\Malwarebytes Anti-Malware\mbam.exe') Then
	ShellExecute(@ProgramFilesDir & '\Malwarebytes Anti-Malware\mbam.exe')
	WinWait('Menú principal de Malwarebytes Anti-Malware','stackPagesWindow')
	WinActivate('Menú principal de Malwarebytes Anti-Malware')
	WinWaitActive('Menú principal de Malwarebytes Anti-Malware')


$positionArray = WinGetPos ("Menú principal de Malwarebytes Anti-Malware", "")

WinActivate('Menú principal de Malwarebytes Anti-Malware')
WinWaitActive('Menú principal de Malwarebytes Anti-Malware')

MouseMove($positionArray[0] + 430 , $positionArray[1] + 520,0)

WinActivate('Menú principal de Malwarebytes Anti-Malware')
WinWaitActive('Menú principal de Malwarebytes Anti-Malware')

MouseClick('left')



;~ 	ProcessWaitClose('mbam.exe')
FileWrite(@DesktopDir & "\Bien Instalado.txt","Limpieza con mbam"&@CRLF)
else
FileWrite(@DesktopDir & "\Mal Instalado.txt","Limpieza con mbam"&@CRLF)
EndIf


