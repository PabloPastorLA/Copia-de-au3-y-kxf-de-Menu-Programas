if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. RED',160,80,0,110)

;~ If FileExists("Remove Empty Directories") AND not FileExists (@ProgramFilesDir & "\Remove Empty Directories") AND not FileExists (@ProgramFilesDir & " (x86)\Remove Empty Directories")  Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	RED"&@CRLF)

	if @OSArch='x86' then
		DirCopy("Remove Empty Directories",@ProgramFilesDir & "\Remove Empty Directories\",1)
		ShellExecuteWait("AutoIt3.exe",'AgregarAMenuBotonDerecho.au3',@ProgramFilesDir & "\Remove Empty Directories")
	EndIf

	if @OSArch<>'x86' then
		DirCopy("Remove Empty Directories",@ProgramFilesDir & " (x86)\Remove Empty Directories\",1)
		ShellExecuteWait("AutoIt3.exe",'AgregarAMenuBotonDerecho.au3',@ProgramFilesDir & " (x86)\Remove Empty Directories")
	EndIf

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	RED"&@CRLF)
;~ else
;~ 	FileWrite(@DesktopDir & "\Mal Instalado.txt","RED"&@CRLF)
;~ EndIf


