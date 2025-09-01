if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Val. W7',160,80,0,110)
If FileExists('UnRAR.exe') and FileExists('Windows 7 Loader pass123.rar') Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Validador W7"&@CRLF)

	unrar()
	Instalar()

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Validador W7"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Validador W7"&@CRLF)
EndIf


func unrar()
	ShellExecuteWait('UnRAR.exe','x -p123 -y "Windows 7 Loader pass123.rar"')
	sleep(500)
	while not FileExists ('W7 Loader\w7lxe.exe')
	MsgBox(0,'Antivirus activo','Desactive el antivirus y presiones OK para poder extraer Purefix')
	sleep(500)
	unrar()
	WEnd
EndFunc

func Instalar()
	ShellExecute('W7 Loader\w7lxe.exe','')
	WinWait('Activation (Basic Mode)','')
	While WinGetState('Activation (Basic Mode)','') <> 15 and WinGetState('Activation (Basic Mode)','') <> 7
	   sleep (1000)
	WEnd
	Sleep(1000)

	WinActivate('Activation (Basic Mode)','')
	WinWaitActive('Activation (Basic Mode)','')
	ControlClick('Activation (Basic Mode)','','TButton12')

;~ ;cambiamos a advanced

	WinWait('Windows 7 Loader eXtreme Edition v3','')
	WinActivate('Windows 7 Loader eXtreme Edition v3','')
	WinWaitActive('Windows 7 Loader eXtreme Edition v3','')
	ControlClick('Windows 7 Loader eXtreme Edition v3','','TButton3')

;~ ;configuramos timeout

	WinWait('Set Timeoutes','')
	WinActivate('Set Timeoutes','')
	WinWaitActive('Set Timeoutes','')
	ControlSetText('Set Timeoutes','','TEdit2','0')
	ControlClick('Set Timeoutes','','TButton2')

;~ ;volvemos a advanced y le damos a instalargestor de arranque

	WinActivate('Windows 7 Loader eXtreme Edition v3','')
	WinWaitActive('Windows 7 Loader eXtreme Edition v3','')
	ControlClick('Windows 7 Loader eXtreme Edition v3','','TButton2')

;~ ;Esperamos ventana

	pleasewait()

;~ ;clave y certificado

	WinActivate('Windows 7 Loader eXtreme Edition v3','')
	WinWaitActive('Windows 7 Loader eXtreme Edition v3','')
	ControlClick('Windows 7 Loader eXtreme Edition v3','','TButton10')

;Esperamos ventana

	pleasewait()

	WinActivate('Windows 7 Loader eXtreme Edition v3','')
	WinWaitActive('Windows 7 Loader eXtreme Edition v3','')
	ControlClick('Windows 7 Loader eXtreme Edition v3','','TButton7')

;Esperamos ventana

	pleasewait()

;Logotipo y OEM

	WinActivate('Windows 7 Loader eXtreme Edition v3','')
	WinWaitActive('Windows 7 Loader eXtreme Edition v3','')
	ControlClick('Windows 7 Loader eXtreme Edition v3','','TButton15')

	sleep(3000)

	WinActivate('Windows 7 Loader eXtreme Edition v3','')
	WinWaitActive('Windows 7 Loader eXtreme Edition v3','')
	WinClose('Windows 7 Loader eXtreme Edition v3','')

;~ 	if @OSArch = 'x86' Then ShellExecuteWait ('AutoIt3.exe',"Logow7.au3", "Logo W7")
	ShellExecuteWait ('AutoIt3.exe',"Logow7.au3", "Logo W7")
;~ 	if @OSArch <> 'x86' Then ShellExecuteWait ('AutoIt3_x64.exe',"Logow7.au3", "Logo W7")
EndFunc

Func pleasewait()
   While WinGetState("[CLASS:TWaitBox]") <> 15 And WinGetState("[CLASS:TWaitBox]") <> 7
	  Sleep(200)
   WEnd
   while WinGetState("[CLASS:TWaitBox]") = 15 or WinGetState("[CLASS:TWaitBox]") = 7
	  sleep(500)
   wend
EndFunc

