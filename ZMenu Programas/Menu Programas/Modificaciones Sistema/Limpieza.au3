SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Limp. Sistema',160,80,0,110)
RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','MSConfig')

If FileExists (@ProgramFilesDir & "\TuneUp Utilities 2010\OneClick.exe") Then
	Limpiar2k10 ()
	Limpiar2k10 ()
	RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','MSConfig')
ElseIf FileExists (@ProgramFilesDir & "\TuneUp Utilities 2008\OneClick.exe") Then
	Limpiar2k8 ()
	Limpiar2k8 ()
	RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','MSConfig')
Else
	MsgBox(0,'','Tuneup no instalado o no encontrado')
EndIf
RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','MSConfig')








Func Limpiar2k8()
	ShellExecute(@ProgramFilesDir & "\TuneUp Utilities 2008\OneClick.exe")

	while not WinExists ('Mantenimiento con 1 clic de TuneUp','Cerrar') and Not WinExists('Mantenimiento con 1 clic de TuneUp','Solucionar prob.')
		Sleep(300)
	WEnd

	If WinExists('Mantenimiento con 1 clic de TuneUp','Solucionar prob.') Then
		WinActivate('Mantenimiento con 1 clic de TuneUp','Solucionar prob.')
		WinWaitActive('Mantenimiento con 1 clic de TuneUp','Solucionar prob.')
		ControlClick('Mantenimiento con 1 clic de TuneUp','Solucionar prob.','TButton2')
	EndIf

	WinWait ('Mantenimiento con 1 clic de TuneUp','Cerrar')
	WinActivate('Mantenimiento con 1 clic de TuneUp','Cerrar')
	WinWaitActive('Mantenimiento con 1 clic de TuneUp','Cerrar')
	ControlClick('Mantenimiento con 1 clic de TuneUp','Cerrar','TButton1')
	ProcessWaitClose('OneClick.exe')
EndFunc

Func Limpiar2k10 ()
	ShellExecute(@ProgramFilesDir & "\TuneUp Utilities 2010\OneClick.exe")

	while not WinExists ('TuneUp Mantenimiento con 1 clic','Llevar a cabo las tareas de mantenimiento') and Not WinExists('TuneUp Mantenimiento con 1 clic','Cerrar')
		Sleep(300)
	WEnd

	if WinExists ('TuneUp Mantenimiento con 1 clic','Llevar a cabo las tareas de mantenimiento') Then
		WinActivate('TuneUp Mantenimiento con 1 clic','Llevar a cabo las tareas de mantenimiento')
		WinWaitActive('TuneUp Mantenimiento con 1 clic','Llevar a cabo las tareas de mantenimiento')
		ControlClick('TuneUp Mantenimiento con 1 clic','Llevar a cabo las tareas de mantenimiento','TButton2')
	EndIf

	WinWait ('TuneUp Mantenimiento con 1 clic','Cerrar')
	WinActivate('TuneUp Mantenimiento con 1 clic','Cerrar')
	WinWaitActive('TuneUp Mantenimiento con 1 clic','Cerrar')
	ControlClick('TuneUp Mantenimiento con 1 clic','Cerrar','TButton1')
	ProcessWaitClose('OneClick.exe')
EndFunc


