if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. YawCam Webcam',160,80,0,110)

If FileExists("yawcam_install.exe") AND not FileExists (@ProgramFilesDir & "\Yawcam\Yawcam.exe") AND not FileExists (@ProgramFilesDir & " (x86)\Yawcam\Yawcam.exe")  Then
	ShellExecuteWait("yawcam_install.exe"," /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-")

;~ 	ProcessWait('Ares.exe')
;~ 	While ProcessExists('Ares.exe')
;~ 		ProcessClose('Ares.exe')
;~ 	WEnd

;~ 	RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "ares")
;~ 	RegDelete("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "ares")
;~ 	RegWrite("HKEY_CURRENT_USER\Software\Ares", "General.AutoStartUp",'REG_DWORD',0)


;~ 	if FileExists (@ProgramFilesDir & "\Ares\Ares.exe") Then
;~ 		ShellExecuteWait('xcopy',' "skins" "' & @ProgramFilesDir & '\Ares\data\GUI" /I /C /K /Y /E')
;~ 		sleep(2000)
;~ 		ShellExecute(@ProgramFilesDir & "\Ares\Ares.exe")
;~ 	ElseIf FileExists (@ProgramFilesDir & " (x86)\Ares\Ares.exe") Then
;~ 		ShellExecuteWait('xcopy',' "skins" "' & @ProgramFilesDir & ' (x86)\Ares\data\GUI" /I /C /K /Y /E')
;~ 		sleep(2000)
;~ 		ShellExecute(@ProgramFilesDir & " (x86)\Ares\Ares.exe")
;~ 	Else
;~ 		MsgBox(0,'','Fallo copia de skins, no encontre la carpeta del ares')
;~ 	EndIf
;~ 	$salida=0
;~ 	While $salida<6 and not WinExists('Alerta de seguridad de Windows','Ares p2p for windows')
;~ 		sleep(1000)
;~ 		$salida=$salida+1
;~ 	WEnd

;~ 	if WinExists('Alerta de seguridad de Windows','Ares p2p for windows') Then
;~ 		While WinExists('Alerta de seguridad de Windows','Ares p2p for windows')
;~ 			WinActivate('Alerta de seguridad de Windows','Ares p2p for windows')
;~ 			ControlClick('Alerta de seguridad de Windows','&Permitir acceso','Button6')
;~ 			sleep(1000)
;~ 		WEnd
;~ 	EndIf

;~ 	While ProcessExists('ares.exe')
;~ 		ProcessClose('ares.exe')
;~ 	WEnd

	FileWrite(@DesktopDir & "\Bien Instalado.txt","YawCam Webcam"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","YawCam Webcam"&@CRLF)
EndIf


