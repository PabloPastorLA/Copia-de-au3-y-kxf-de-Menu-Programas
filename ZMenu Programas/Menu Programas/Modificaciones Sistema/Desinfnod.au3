	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Desinf. NOD',160,80,0,110)
If FileExists (@ProgramFilesDir & '\ESET\ESET NOD32 Antivirus\egui.exe') Then
	ShellExecute(@ProgramFilesDir & '\ESET\ESET NOD32 Antivirus\egui.exe')
	WinWait('ESET NOD32 Antivirus')
	WinActivate('ESET NOD32 Antivirus')
	WinWaitActive('ESET NOD32 Antivirus')

primerclick()

segundoclick()

tercerclick()
FileWrite(@DesktopDir & "\Bien Instalado.txt","Limpieza con Nod"&@CRLF)
else
FileWrite(@DesktopDir & "\Mal Instalado.txt","Limpieza con Nod"&@CRLF)
EndIf


func primerclick()
$positionArray = WinGetPos ("ESET NOD32 Antivirus", "")

WinActivate('ESET NOD32 Antivirus')
WinWaitActive('ESET NOD32 Antivirus')

MouseMove($positionArray[0] + 130 , $positionArray[1] + 140,0)

WinActivate('ESET NOD32 Antivirus')
WinWaitActive('ESET NOD32 Antivirus')

MouseClick('left')
EndFunc


func segundoclick()
$positionArray = WinGetPos ("ESET NOD32 Antivirus", "")

WinActivate('ESET NOD32 Antivirus')
WinWaitActive('ESET NOD32 Antivirus')

MouseMove($positionArray[0] + 130 , $positionArray[1] + 240,0)

WinActivate('ESET NOD32 Antivirus')
WinWaitActive('ESET NOD32 Antivirus')

MouseClick('left')
EndFunc


func tercerclick()
$positionArray = WinGetPos ("ESET NOD32 Antivirus", "")

WinActivate('ESET NOD32 Antivirus')
WinWaitActive('ESET NOD32 Antivirus')

MouseMove($positionArray[0] + 340 , $positionArray[1] + 220,0)

WinActivate('ESET NOD32 Antivirus')
WinWaitActive('ESET NOD32 Antivirus')

MouseClick('left')
EndFunc
