SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. UltraISO',160,80,0,110)

If FileExists("uiso96pes.exe") AND FileExists("ultraiso.bat") AND not FileExists (@ProgramFilesDir & "\UltraISO\UltraISO.exe")  Then
;~ 	ShellExecuteWait("ultraiso.bat")
	ShellExecuteWait("uiso96pes.exe",' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-')

	if FileExists (@ProgramFilesDir & "\UltraISO\UltraISO.exe") or FileExists (@ProgramFilesDir & " (x86)\UltraISO\UltraISO.exe") Then
		if FileExists (@ProgramFilesDir & "\UltraISO\UltraISO.exe") Then
			while FileExists(@ProgramFilesDir & "\UltraISO\uikey.ini")
				FileDelete (@ProgramFilesDir & "\UltraISO\uikey.ini")
			WEnd
			FileCopy('uikey.ini',@ProgramFilesDir & "\UltraISO\")
		EndIf
		if FileExists (@ProgramFilesDir & " (x86)\UltraISO\UltraISO.exe") Then
			while FileExists(@ProgramFilesDir & " (x86)\UltraISO\uikey.ini")
				FileDelete (@ProgramFilesDir & " (x86)\UltraISO\uikey.ini")
			WEnd
			FileCopy('uikey.ini',@ProgramFilesDir & " (x86)\UltraISO\")
		EndIf

	Else
		MsgBox(0,'','Fallo copia de registro, no encontre la carpeta de instalacion de ultraiso')
	EndIf
	RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Disc Soft Lite Bus Service','Start','REG_DWORD',4)

	FileWrite(@DesktopDir & "\Bien Instalado.txt","UltraISO"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","UltraISO"&@CRLF)
EndIf
