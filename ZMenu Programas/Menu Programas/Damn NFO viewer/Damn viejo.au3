if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf



Global $ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)









If FileExists("DAMN_NFO_Viewer_v2-10-0032-RC3.exe") and not FileExists ($ProgramFilesDir & '\DAMN NFO Viewer\DAMN NFO Viewer.exe') AND not FileExists ($ProgramFilesDir & " (x86)\DAMN NFO Viewer\DAMN NFO Viewer.exe") Then

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Damn NFO Viewer"&@CRLF)

	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. NFO Viewer',160,80,0,110)

	ShellExecute('DAMN_NFO_Viewer_v2-10-0032-RC3.exe')
	WinWait('DAMN NFO Viewer v2.10 Setup')
	WinActivate('DAMN NFO Viewer v2.10 Setup')
	WinWaitActive('DAMN NFO Viewer v2.10 Setup')
	ControlClick('DAMN NFO Viewer v2.10 Setup','&Next >','Button2')

	WinWait('DAMN NFO Viewer v2.10 Setup','I &accept the terms')
	WinActivate('DAMN NFO Viewer v2.10 Setup','I &accept the terms')
	WinWaitActive('DAMN NFO Viewer v2.10 Setup','I &accept the terms')
	ControlClick('DAMN NFO Viewer v2.10 Setup','I &accept the terms in the license agreement','Button5')
	ControlClick('DAMN NFO Viewer v2.10 Setup','&Next >','Button2')

	WinWait('DAMN NFO Viewer v2.10 Setup','Installation Location')
	WinActivate('DAMN NFO Viewer v2.10 Setup','Installation Location')
	WinWaitActive('DAMN NFO Viewer v2.10 Setup','Installation Location')
	ControlClick('DAMN NFO Viewer v2.10 Setup','&Next >','Button2')

	WinWait('DAMN NFO Viewer v2.10 Setup','International Support')
	WinActivate('DAMN NFO Viewer v2.10 Setup','International Support')
	WinWaitActive('DAMN NFO Viewer v2.10 Setup','International Support')
	ControlClick('DAMN NFO Viewer v2.10 Setup','&Next >','Button2')

	WinWait('DAMN NFO Viewer v2.10 Setup','Installation complete!')
	WinActivate('DAMN NFO Viewer v2.10 Setup','Installation complete!')
	WinWaitActive('DAMN NFO Viewer v2.10 Setup','Installation complete!')
	ControlClick('DAMN NFO Viewer v2.10 Setup','OK','Button1')

	WinWaitClose('DAMN NFO Viewer v2.10 Setup','Installation complete!')

	while not WinExists ('DAMN NFO Viewer v2.10') and not WinExists ('DAMN NFO Viewer')
		Sleep(500)
	WEnd

	if WinExists('DAMN NFO Viewer','DAMN NFO Viewer no es actualmente') Then
		ControlClick('DAMN NFO Viewer','&Sí','Button2')
		sleep (2000)
		WinWaitClose('DAMN NFO Viewer','DAMN NFO Viewer no es actualmente')
	EndIf
	while WinExists('DAMN NFO Viewer v2.10')
		WinClose('DAMN NFO Viewer v2.10')
		Sleep(1000)
	WEnd
; en esta linea :ver ventana en w7 la cual pregunta si el programa se instalo correctamente
	if @OSVersion <> "WIN_XP" Then
		$i=0
		While $i<10
			Sleep(1000)
			$i = $i + 1
			if WinExists ('Asistente para la compatibilidad de programas','Este programa se instaló correctamente') Then
				WinClose('Asistente para la compatibilidad de programas','Este programa se instaló correctamente')
				WinWaitClose('Asistente para la compatibilidad de programas','Este programa se instaló correctamente')
				$i = 10
			endif
		WEnd
	EndIf
	ShellExecute('DamnNfoCerrVent.exe')
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Damn NFO Viewer"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Damn Nfo Viewer"&@CRLF)
EndIf


