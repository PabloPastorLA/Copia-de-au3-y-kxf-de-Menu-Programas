;C:\Users\Usuario\AppData\Local\Temp




ShellExecute("Nero-7.11.10.0c_all_update.exe")
WinWait('Instalación de la barra de herramientas Ask de Nero')
While WinExists('Instalación de la barra de herramientas Ask de Nero')
	WinClose('Instalación de la barra de herramientas Ask de Nero')
WEnd

;~ MsgBox(0,'',@UserProfileDir&'\AppData\Local\Temp\NERO1005887\SetupX.exe')


;~ ShellExecuteWait("Nero-7.11.10.0c_all_update\SetupX.exe",' /quiet /norestart')