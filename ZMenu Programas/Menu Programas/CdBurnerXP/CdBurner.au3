if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. CdBurner',160,80,0,110)

If FileExists("cdbxp_setup_4.5.6.5931_minimal.exe") AND not FileExists (@ProgramFilesDir & "\CDBurnerXP\cdbxpp.exe") AND not FileExists (@ProgramFilesDir & " (x86)\CDBurnerXP\cdbxpp.exe")  Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	CdBurnerXp"&@CRLF)

	ShellExecuteWait('cdbxp_setup_4.5.6.5931_minimal.exe',' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-')
	FileCopy('UserSettings.ini',@AppDataDir & '\Canneverbe Limited\CDBurnerXP\',9)

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	CdBurnerXp"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","CdBurnerXp"&@CRLF)
EndIf

