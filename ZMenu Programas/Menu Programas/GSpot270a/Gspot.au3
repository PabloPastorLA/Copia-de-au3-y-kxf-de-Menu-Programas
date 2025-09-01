	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Gspot',160,80,0,110)

;~ ConsoleWrite(@AppDataDir & '\Microsoft\Windows\SendTo')
;~ C:\Users\pccasa\AppData\Roaming\Microsoft\Windows\SendTo
If FileExists("GSpot270a\GSpot.exe") AND not FileExists (@ProgramFilesDir & "\GSpot270a\") Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	GSpot"&@CRLF)

	DirCopy("GSpot270a",@ProgramFilesDir & "\GSpot270a\")

	$exe=@ProgramFilesDir & '\GSpot270a\GSpot.exe'
	$send = 0

	if @OSVersion = 'WIN_XP' Then
		$send = @UserProfileDir&'\SendTo'
	ElseIf @OSVersion <> 'WIN_XP' Then
		$send = @AppDataDir & '\Microsoft\Windows\SendTo'
	Else
		MsgBox(0,'','Falta codigo, revisar. Se cierra')
		FileWrite(@DesktopDir & "\Mal Instalado.txt","GSpot270a"&@CRLF)
		Exit
	EndIf

	RegWrite("HKEY_CURRENT_USER\Software\GSpot Appliance Corp\GSpot\v2.6 Settings", "LicenseDisplayed",'REG_DWORD',1)

	ShellExecuteWait('nircmd.exe',' shortcut "'&$exe&'" "'&$send&'" "GSpot"')

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	GSpot"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","GSpot270a"&@CRLF)
EndIf

