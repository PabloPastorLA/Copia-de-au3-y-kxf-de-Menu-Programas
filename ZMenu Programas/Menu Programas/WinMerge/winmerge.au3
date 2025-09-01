if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Winmerge',160,80,0,110)

If FileExists("WinMerge-2.14.0-Setup.exe") AND not FileExists (@ProgramFilesDir & "\WinMerge\WinMergeU.exe") AND not FileExists (@ProgramFilesDir & " (x86)\WinMerge\WinMergeU.exe") Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Winmerge"&@CRLF)
	ShellExecuteWait('"WinMerge-2.14.0-Setup.exe"',' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-')
	ShellExecute('Merge7zInstaller0028-465-920.exe')
	while ControlCommand('Merge7z Interface Plugin Installer (dllbuild 0028, Dec 25 2010)','OK','Button7',"IsVisible", "")=0
		WinActivate('Merge7z Interface Plugin Installer (dllbuild 0028, Dec 25 2010)')
	WEnd
	while WinExists('Merge7z Interface Plugin Installer (dllbuild 0028, Dec 25 2010)')
		ControlClick('Merge7z Interface Plugin Installer (dllbuild 0028, Dec 25 2010)','OK','Button7')
		Sleep(2000)
	WEnd

	;	EJECUTAR
	if FileExists (@ProgramFilesDir & "\WinMerge\WinMergeU.exe")  Then
		ShellExecute(@ProgramFilesDir & "\WinMerge\WinMergeU.exe")
		global $dir=(@ProgramFilesDir & "\WinMerge\")
	ElseIf FileExists (@ProgramFilesDir & " (x86)\WinMerge\WinMergeU.exe")  Then
		ShellExecute(@ProgramFilesDir & " (x86)\WinMerge\WinMergeU.exe")
		global $dir=(@ProgramFilesDir & " (x86)\WinMerge\")
	Else
		MsgBox(0,'','Fallo ejecutar winmerge, no lo encuentro')
	EndIf

	;	ESPERAR QUE VENTANA se cierre y cerrar
	WinWait("[CLASS:Afx:00400000:0:00010003:00000000:00000000]",'',5);, "", 10)
	Sleep(1000)
;~ 	WinWaitClose("[CLASS:Afx:00400000:0:00010003:00000000:00000000]")
	WinClose("[CLASS:WinMergeWindowClassW]")


	;ESPERAR SI APARECE VENTANA DE PODRIA NO HABERSE INSTALADO CORRECTAMENTE, y cerrarla
	$exit=0
	Do
		Sleep(100)
		$exit=$exit+1
	Until $exit>31 or WinExists('Asistente para la compatibilidad de programas','Este programa se instaló correctamente')
	If WinExists('Asistente para la compatibilidad de programas','Este programa se instaló correctamente') then
		Do
			WinClose('Asistente para la compatibilidad de programas','Este programa se instaló correctamente')
		until not WinExists('Asistente para la compatibilidad de programas','Este programa se instaló correctamente')
	EndIf

	reemplazarwinmergeU()

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Winmerge"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Ares"&@CRLF)
EndIf


func reemplazarwinmergeU()
	FileMove($dir&'WinMergeU.exe',$dir&'WinMergeUORIGINAL.exe',1)
	FileCopy(@ScriptDir&'\WinMergeU.exe',$dir&'WinMergeU.exe',1)

	do
		FileDelete(@ProgramsCommonDir&'\WinMerge\WinMerge.lnk')
	until not FileExists(@ProgramsCommonDir&'\WinMerge\WinMerge.lnk')

	FileCreateShortcut($dir&'WinMergeUORIGINAL.exe',@ProgramsCommonDir&'\WinMerge\WinMerge.lnk',$dir)


;~ 	MsgBox(0,'','winerge falta cambiar acceso directo de escritorio al exe ORIGINAL. el del menu programas ya esta')
EndFunc


