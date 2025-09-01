if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Paintnet',160,80,0,110)

If @OSVersion='WIN_XP' and FileExists("Paint.NET.3.5.11.Install.exe") then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	PaintNET 3"&@CRLF)
	;MsgBox(0,'','xp')
	ShellExecute('Paint.NET.3.5.11.Install.exe')
	$Ventana='Paint.NET v3.5.11'
	$sgte='WindowsForms10.BUTTON.app.0.33c0d9d4'
	$finalizar='WindowsForms10.BUTTON.app.0.33c0d9d3'
	$iniciar='WindowsForms10.BUTTON.app.0.33c0d9d1'
	$painttexto='Iniciar Paint.NET'
	instalarXP()
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	PaintNET 3"&@CRLF)
;ElseIf (@OSVersion = 'WIN_10' or @OSVersion = 'WIN_7') and FileExists("Paint.NET.4.0.9.Install.exe") and not FileExists(@ProgramFilesDir & "\Paint.NET\PaintDotNet.exe") and not FileExists(@ProgramFilesDir & " (x86)\Paint.NET\PaintDotNet.exe")  Then
ElseIf (@OSVersion = 'WIN_10' or @OSVersion = 'WIN_81' or @OSVersion = 'WIN_7') and FileExists("Paint.NET.4.0.9.Install.exe") and not FileExists(@ProgramFilesDir & "\Paint.NET\PaintDotNet.exe") and not FileExists(@ProgramFilesDir & " (x86)\Paint.NET\PaintDotNet.exe")  Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	PaintNET 4"&@CRLF)

	instalarOTROS()

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	PaintNET 4"&@CRLF)
ElseIf @OSVersion <> 'WIN_XP' and @OSVersion <> 'WIN_7' and @OSVersion <> 'WIN_10' and FileExists("Paint.NET.4.0.9.Install.exe") and not FileExists(@ProgramFilesDir & "\Paint.NET\PaintDotNet.exe") and not FileExists(@ProgramFilesDir & " (x86)\Paint.NET\PaintDotNet.exe")  Then
	MsgBox(0,'','paintnet falta codigo')
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","PaintNet NO INSTALADO POSIBLEMENTE POR @OSServicePack DISTINTO A Service Pack 1"&@CRLF)
EndIf







func instalarOTROS()


	ShellExecute('Paint.NET.4.0.9.Install.exe')

;	espero a que aparezca una ventana. si no aparece en 1 min salta falla
;~ Si aparece la ventana de instalar net framework le da a instalat
	$condicion=0
	while not WinExists('paint.net v4.0.9','&Siguiente >'); or not winexist			<---   aca agregar las otras ventanas
		if WinExists('paint.net','The following will be installed') then ControlClick('paint.net','','Button1')
		if WinExists('Extracting files') or WinExists('Microsoft .NET 2015') then $condicion=0
		Sleep(100)
		$condicion=$condicion+1
		if $condicion>600 then
			while 1
				MsgBox(0,'','PaintNet falla en que no aparecio la ventana o que hay que subir tiempo de $condicion a mas de 600')
			WEnd
		EndIf
	WEnd
;	Termine de esperar

;	Asigno valor de ventana, si no aparecio entonces falla
	$Ventana='ERROR'
	if WinExists('paint.net v4.0.9','&Siguiente >') then $Ventana='paint.net v4.0.9'
;	if WinExists('paint.net v4.0.9') then $Ventana='paint.net v4.0.9'				<---   aca agregar las otras ventanas

	if $Ventana='ERROR' then
		while 1
			MsgBox(0,'','PaintNet falla en asignacion de valor a variable ventana')
		WEnd
	EndIf
;	Termino de asignar valor

; MsgBox(0,'',$Ventana)

	WinActivate($Ventana,'&Siguiente >')
	WinWaitActive($Ventana,'&Siguiente >')


	$painttexto='Iniciar paint.net'

;~ MsgBox(0,'','1')

	while WinExists($Ventana,'&Siguiente >') and not WinExists ($Ventana,'&Acepto')
		WinActivate($Ventana,'&Siguiente >')
		WinWaitActive($Ventana,'&Siguiente >')
;~ 		ControlClick ($Ventana,'&Siguiente >',$sgte)
;~ MsgBox(0,'','2')
		send('{enter}')
		Sleep(800)
	WEnd
;~ MsgBox(0,'','3')

	WinWait($Ventana,'&Acepto')
;~ MsgBox(0,'','4')

	while WinExists($Ventana,'&Acepto') and  not WinExists ($Ventana,'Paint.NET es gratuito')
		WinActivate($Ventana,'&Acepto')
		WinWaitActive($Ventana,'&Acepto')
;~ 		ControlClick ($Ventana,'&Acepto',$sgte)
		send('{altdown}{a}{s}{altup}')

		Sleep(800)
	WEnd
;~ MsgBox(0,'','5')

	WinWait($Ventana,$painttexto)
;~ MsgBox(0,'','6')
	while WinExists($Ventana,$painttexto) ;and ControlCommand($Ventana,$painttexto,$iniciar,"IsChecked", "") = 1
		WinActivate($Ventana,$painttexto)
		WinWaitActive($Ventana,$painttexto)
		send('{enter}')
		Sleep(1000)
	WEnd
	WinWaitClose($Ventana,$painttexto)

	ProcessWait('PaintDotNet.exe')
	Processclose('PaintDotNet.exe')


	If FileExists(@ProgramFilesDir & "\Paint.NET\PaintDotNet.exe") Then DirCopy('Effects',@ProgramFilesDir & "\Paint.NET\Effects\",1)
	If FileExists(@ProgramFilesDir & " (x86)\Paint.NET\PaintDotNet.exe") Then DirCopy('Effects',@ProgramFilesDir & " (x86)\Paint.NET\Effects\",1)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Paint.NET','CHECKFORBETAS','REG_SZ',0)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Paint.NET','CHECKFORUPDATES','REG_SZ',0)
	If @OSArch<> 'X86' then RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Paint.NET','CHECKFORBETAS','REG_SZ',0)
	If @OSArch<> 'X86' then RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Paint.NET','CHECKFORUPDATES','REG_SZ',0)



;	FileWrite(@DesktopDir & "\Bien Instalado.txt","PaintNet"&@CRLF)
EndFunc

;~ en 2 un enter
;~ en 5 altdown con a




















func instalarXP()
	WinWait($Ventana,'&Siguiente >')
	while WinExists($Ventana,'&Siguiente >') and not WinExists ($Ventana,'&Acepto')
		WinActivate($Ventana,'&Siguiente >')
		WinWaitActive($Ventana,'&Siguiente >')
		ControlClick ($Ventana,'&Siguiente >',$sgte)
		Sleep(800)
	WEnd

	WinWait($Ventana,'&Acepto')
	while WinExists($Ventana,'&Acepto') and  not WinExists ($Ventana,'Paint.NET es gratuito')
		WinActivate($Ventana,'&Acepto')
		WinWaitActive($Ventana,'&Acepto')
		ControlClick ($Ventana,'&Acepto',$sgte)
		Sleep(800)
	WEnd

	WinWait($Ventana,$painttexto)
	while WinExists($Ventana,$painttexto) and ControlCommand($Ventana,$painttexto,$iniciar,"IsChecked", "") = 1
		WinActivate($Ventana,$painttexto)
		WinWaitActive($Ventana,$painttexto)
		ControlCommand($Ventana,$painttexto,$iniciar,"UnCheck", "")
		Sleep(1000)
	WEnd

	while WinExists($Ventana,$painttexto) and ControlCommand($Ventana,$painttexto,$iniciar,"IsChecked", "") = 0
		WinActivate($Ventana,$painttexto)
		WinWaitActive($Ventana,$painttexto)
		ControlClick($Ventana,'Finalizar',$finalizar)
		Sleep(800)
	WEnd

	WinWaitClose($Ventana,$painttexto)




	If FileExists(@ProgramFilesDir & "\Paint.NET\PaintDotNet.exe") Then DirCopy('Effects',@ProgramFilesDir & "\Paint.NET\Effects\",1)
	If FileExists(@ProgramFilesDir & " (x86)\Paint.NET\PaintDotNet.exe") Then DirCopy('Effects',@ProgramFilesDir & " (x86)\Paint.NET\Effects\",1)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Paint.NET','CHECKFORBETAS','REG_SZ',0)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Paint.NET','CHECKFORUPDATES','REG_SZ',0)
	If @OSArch<> 'X86' then RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Paint.NET','CHECKFORBETAS','REG_SZ',0)
	If @OSArch<> 'X86' then RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Paint.NET','CHECKFORUPDATES','REG_SZ',0)



	FileWrite(@DesktopDir & "\Bien Instalado.txt","PaintNet"&@CRLF)
EndFunc
