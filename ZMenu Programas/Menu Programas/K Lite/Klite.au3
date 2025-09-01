if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Klite',160,80,0,110)


$programfilesdir=@ProgramFilesDir
if StringRight($programfilesdir,6)=' (x86)' then $programfilesdir=StringTrimRight($programfilesdir,6)

If @OSVersion<>'WIN_XP' and FileExists("K-Lite_Codec_Pack_1526_Standard.exe") AND not FileExists ($programfilesdir & "\K-Lite Codec Pack") AND not FileExists ($programfilesdir & " (x86)\K-Lite Codec Pack") Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Klite"&@CRLF)

	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\KLCodecPack\InstallSettings','update_check_freq','REG_DWORD',0)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KLCodecPack\InstallSettings','update_check_freq','REG_DWORD',0)

	ShellExecuteWait("K-Lite_Codec_Pack_1526_Standard.exe"," /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-")

	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\KLCodecPack\InstallSettings','update_check_freq','REG_DWORD',0)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KLCodecPack\InstallSettings','update_check_freq','REG_DWORD',0)

	ShellExecuteWait('cmd.exe',' /C schtasks /end /TN "klcp_update"','','',@SW_HIDE)
	ShellExecuteWait('cmd.exe',' /C schtasks /delete /TN "klcp_update" /F','','',@SW_HIDE)


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Klite"&@CRLF)

ElseIf @OSVersion='WIN_XP' and FileExists("K-Lite_Codec_Pack_1385_Standard.exe") AND not FileExists ($programfilesdir & "\K-Lite Codec Pack") AND not FileExists ($programfilesdir & " (x86)\K-Lite Codec Pack") Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Klite"&@CRLF)

	ShellExecuteWait("K-Lite_Codec_Pack_1385_Standard.exe"," /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-")
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Klite"&@CRLF)

Else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Klite"&@CRLF)
EndIf
