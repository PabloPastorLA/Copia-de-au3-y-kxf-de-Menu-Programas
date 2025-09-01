$debug=1



If @OSVersion='WIN_10' Then SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Val. W10',160,80,0,110)
If @OSVersion='WIN_81' Then SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Val. W81',160,80,0,110)
If @OSVersion='WIN_8' Then SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Val. W8',160,80,0,110)
If FileExists('UnRAR.exe') and FileExists('KMSAuto Net pass 123.rar') Then

	unrar()
	Instalar()

	If @OSVersion='WIN_10' Then FileWrite(@DesktopDir & "\Bien Instalado.txt","Validador W10"&@CRLF)
	If @OSVersion='WIN_81' Then FileWrite(@DesktopDir & "\Bien Instalado.txt","Validador W81"&@CRLF)
	If @OSVersion='WIN_8' Then FileWrite(@DesktopDir & "\Bien Instalado.txt","Validador W8"&@CRLF)
else
	If @OSVersion='WIN_10' Then FileWrite(@DesktopDir & "\Mal Instalado.txt","Validador W10"&@CRLF)
	If @OSVersion='WIN_81' Then FileWrite(@DesktopDir & "\Mal Instalado.txt","Validador W81"&@CRLF)
	If @OSVersion='WIN_8' Then FileWrite(@DesktopDir & "\Mal Instalado.txt","Validador W8"&@CRLF)
EndIf


func unrar()
	if $debug=1 Then SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Val. DEBUG'& @crlf & 'UnRAR',160,80,0,110)

	ShellExecuteWait('UnRAR.exe','x -p123 -y "KMSAuto Net pass 123.rar"')
	sleep(500)
	while not FileExists ('KMSAuto Net.exe')
	MsgBox(0,'Antivirus activo','Desactive el antivirus y presiones OK para poder extraer KMSAuto Net')
	sleep(500)
	unrar()
	WEnd
EndFunc

func Instalar()
	if $debug=1 Then SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Val. DEBUG'& @crlf & '/win=act',160,80,0,110)


;~ 	ShellExecuteWait('cmd',' /C "KMSAuto Net.exe" /win=act','','',@SW_HIDE)
;~ 	ShellExecuteWait('cmd',' /C "KMSAuto Net.exe" /task=yes','','',@SW_HIDE)


	$handle=ShellExecute('cmd',' /C "KMSAuto Net.exe" /win=act','','',@SW_HIDE)
	while ProcessExists($handle)
		if WinExists('Seguridad de Windows','Solo debería instalar software') then ControlClick('Seguridad de Windows','Solo debería instalar software','Button1')
	WEnd
	ProcessWaitClose($handle)


	if $debug=1 Then SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Val. DEBUG'& @crlf & '/task=yes',160,80,0,110)

	$handle=ShellExecute('cmd',' /C "KMSAuto Net.exe" /task=yes','','',@SW_HIDE)
	while ProcessExists($handle)
		if WinExists('Seguridad de Windows','Solo debería instalar software') then ControlClick('Seguridad de Windows','Solo debería instalar software','Button1')
	WEnd
	ProcessWaitClose($handle)
EndFunc


func vieja()
ShellExecute('KMSAuto Net.exe')

WinWait('KMSAuto Net 2015 v1.4.2 by Ratiborus')
WinActivate('KMSAuto Net 2015 v1.4.2 by Ratiborus')
WinWaitActive('KMSAuto Net 2015 v1.4.2 by Ratiborus')

$seguir=1
	While WinExists('KMSAuto Net 2015 v1.4.2 by Ratiborus') and not WinExists('KMSAuto Net 2015 v1.4.2 by Ratiborus','=====    Producto activado con éxito    =====') and $seguir = 1
		if ControlCommand('KMSAuto Net 2015 v1.4.2 by Ratiborus','Activación','WindowsForms10.BUTTON.app.0.141b42a_r14_ad16',"IsVisible", "") = 1 Then
			ControlClick('KMSAuto Net 2015 v1.4.2 by Ratiborus','Activación','WindowsForms10.BUTTON.app.0.141b42a_r14_ad16')
			Sleep(1000)
		EndIf
		if ControlCommand('KMSAuto Net 2015 v1.4.2 by Ratiborus','Activación','WindowsForms10.BUTTON.app.0.141b42a_r14_ad18',"IsVisible", "") = 1 then
			ControlClick('KMSAuto Net 2015 v1.4.2 by Ratiborus','Activación','WindowsForms10.BUTTON.app.0.141b42a_r14_ad18')
			Sleep(1000)
		EndIf
		sleep(1000)
	WEnd





WinWait('KMSAuto Net 2015 v1.4.2 by Ratiborus','=====    Producto activado con éxito    =====')
;~ MsgBox(0,'','termine')

While WinExists('KMSAuto Net 2015 v1.4.2 by Ratiborus','=====    Producto activado con éxito    =====')
	WinClose('KMSAuto Net 2015 v1.4.2 by Ratiborus','=====    Producto activado con éxito    =====')
	Sleep(1000)
WEnd

EndFunc




