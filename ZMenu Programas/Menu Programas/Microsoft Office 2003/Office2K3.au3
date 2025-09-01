SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Off. 2003',160,80,0,110)


If FileExists("Microsoft Office 2003\SETUP.EXE") AND not FileExists (@ProgramFilesDir & "\Microsoft Office\Office11\WINWORD.EXE") AND not FileExists (@ProgramFilesDir & "\Microsoft Office\Office12\WINWORD.EXE") AND not FileExists (@ProgramFilesDir & "\Microsoft Office\Office14\WINWORD.EXE") Then
;~ 	ShellExecuteWait('office2k3.bat')
	ShellExecuteWait("Microsoft Office 2003\setup.exe",' TRANSFORMS=auto.MST /qb-')
	ProcessWaitClose ('SETUP.EXE')
	Sleep(2000)

	While ProcessExists('OSE.EXE')
		ProcessClose('OSE.EXE')
	WEnd



    SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Off. 2K3 SP3',160,80,0,110)

;~ 	ShellExecuteWait('office2k3 SP3.bat')
	ShellExecuteWait('Office2003SP3\ohotfix.exe')
	ProcessWaitClose('ohotfix.exe')
;~ 	WinWait('Service Pack 3 (SP3) de Office 2003','La actualización se ha aplicado correctamente.')
;~ 	WinActivate('Service Pack 3 (SP3) de Office 2003','La actualización se ha aplicado correctamente.')
;~ 	WinWaitActive('Service Pack 3 (SP3) de Office 2003','La actualización se ha aplicado correctamente.')
;~ 	ControlClick('Service Pack 3 (SP3) de Office 2003','Aceptar','Button1')
;~ 	ProcessWaitClose('ohotfix.exe')

    SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. 2K3 Compatib',160,80,0,110)
;~ 	ShellExecuteWait('fileformatsconv.bat')
	ShellExecuteWait("msiexec.exe",' /i "FileFormatConverters\O12Conv.msi" /qb')
	sleep (3000)

	While ProcessExists('OSE.EXE')
		ProcessClose('OSE.EXE')
	WEnd

	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ose", "Start", "REG_DWORD", 4)
	RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "ctfmon.exe")

	$exit=0
	While Not WinExists('Asistente para la compatibilidad de programas','Este programa se instaló correctamente') And $exit<10
		Sleep(1000)
		$exit=$exit+1
	WEnd

	If WinExists('Asistente para la compatibilidad de programas','Este programa se instaló correctamente') Then
		While WinExists('Asistente para la compatibilidad de programas','Este programa se instaló correctamente')
			ControlClick('Asistente para la compatibilidad de programas','Este programa se instaló correctamente','Button2')
			sleep(1000)
		WEnd
	EndIf

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Microsoft Office 2K3 + SP3 + compatibilidad"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Microsoft Office 2K3 + SP3 + compatibilidad"&@CRLF)
EndIf
