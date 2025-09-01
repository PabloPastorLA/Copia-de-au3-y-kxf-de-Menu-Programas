SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Corr. Maconfig',160,80,0,110)

If @OSArch = 'X86' and FileExists('X86\MCSettings.exe') Then
	ShellExecute ('X86\MCSettings.exe')
	seguir()
ElseIf @OSArch = 'X64' and FileExists('X64\MCSettings.exe') Then
	ShellExecute ('X64\MCSettings.exe')
	seguir()
EndIf



func seguir()
	WinWait('Preferencias')
	WinActivate('Preferencias')
	WinWaitActive('Preferencias')

	ControlClick('Preferencias','','Button7')

	WinWait('Guardar como','Configuration')
	WinActivate('Guardar como','Configuration')
	WinWaitActive('Guardar como','Configuration')
	$Configur=ControlGetText('Guardar como','','Edit1')

;~ MsgBox(0,'',@DesktopDir &'\'&$Configur)

	While FileExists(@DesktopDir &'\'&$Configur)
		FileDelete (@DesktopDir &'\'&$Configur)
		Sleep(1500)
;~ MsgBox(0,'','while')
	WEnd
;~ MsgBox(0,'','cambio texto')

	ControlSetText('Guardar como','','Edit1',@DesktopDir &'\'&$Configur)
;~ MsgBox(0,'','recien cambie texto')
	if ControlGetText('Guardar como','','Button1')='&Guardar' Then ControlClick('Guardar como','&Guardar','Button1')
	if ControlGetText('Guardar como','','Button2')='&Guardar' Then ControlClick('Guardar como','&Guardar','Button2')
;~ MsgBox(0,'','2')

	while (not WinExists('Confirmar Guardar como','&Sí')) and (not WinExists('Guardar como','¿Desea reemplazarlo?')) And (WinExists('Guardar como','Configuration'))
	sleep(500)
	WEnd

;~ MsgBox(0,'','sali del whhhhhile')

	If WinExists('Guardar como','Configuration') and @OSVersion = 'WIN_XP' Then
		While WinExists('Guardar como','Configuration')
			ControlClick('Guardar como','&Sí','Button1')
		WEnd
		WinWaitClose('Guardar como','Configuration')

	EndIf

	If WinExists('Confirmar Guardar como','&Sí') Then
		while WinExists ('Confirmar Guardar como','&Sí')
			ControlClick('Confirmar Guardar como','&Sí','Button1')
		WEnd
		WinWaitClose('Confirmar Guardar como','&Sí')
	EndIf


	WinWaitClose('Guardar como','Configuration')
	while WinExists('Preferencias')
		WinActivate('Preferencias')
		ControlClick('Preferencias','','Button6')
	WEnd

	WinWaitClose('Preferencias')
EndFunc




