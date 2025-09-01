if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Letasoft',160,80,0,110)

If FileExists("Setup.exe") AND not FileExists (@ProgramFilesDir & "\Letasoft Sound Booster\SoundBooster.exe")  AND not FileExists (@ProgramFilesDir & " (x86)\Letasoft Sound Booster\SoundBooster.exe")  Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Letasoft Sound Booster"&@CRLF)

	ShellExecuteWait('Setup.exe',' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-')
	if FileExists (@ProgramFilesDir & "\Letasoft Sound Booster\SoundBooster.exe") Then
		FileCopy('Crack\SoundBooster.exe',@ProgramFilesDir & '\Letasoft Sound Booster\SoundBooster.exe',9)
		FileCopy('Crack\TurboActivate.dll',@ProgramFilesDir & '\Letasoft Sound Booster\TurboActivate.dll',9)
	elseif FileExists (@ProgramFilesDir & " (x86)\Letasoft Sound Booster\SoundBooster.exe") Then
		FileCopy('Crack\SoundBooster.exe',@ProgramFilesDir & ' (x86)\Letasoft Sound Booster\SoundBooster.exe',9)
		FileCopy('Crack\TurboActivate.dll',@ProgramFilesDir & ' (x86)\Letasoft Sound Booster\TurboActivate.dll',9)
	Else
		FileWrite(@DesktopDir & "\Mal Instalado.txt","Letasoft Sount Booster INICIO"&@CRLF)
	EndIf

	Sleep(1000)
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Letasoft Sound Booster"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Letasoft Sound Booster"&@CRLF)
EndIf


