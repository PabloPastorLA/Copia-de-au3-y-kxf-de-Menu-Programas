if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Actualiz. W7',160,80,0,110)

If @OSVersion = "WIN_7" Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Actualiz. W7"&@CRLF)

	ShellExecuteWait("WindowsUpdateAgent30.exe"," /quiet /norestart /nobackup")

	if @OSArch='x86' then ShellExecuteWait('windows6.1-kb4474419-v3-x86.msu',' /quiet /norestart /nobackup')
	if @OSArch<>'x86' then ShellExecuteWait('windows6.1-kb4474419-v3-x64.msu',' /quiet /norestart /nobackup')

;~ 	if ProcessExists('Menu.exe') then
;~ 		Do
;~ 			ProcessClose('Menu.exe')
;~ 		UNTIL NOT ProcessExists('Menu.exe')
;~ 		ShellExecute('shutdown',' -r -t 00')
;~ 	EndIf

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Actualiz. W7"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Actualiz. W7"&@CRLF)
EndIf