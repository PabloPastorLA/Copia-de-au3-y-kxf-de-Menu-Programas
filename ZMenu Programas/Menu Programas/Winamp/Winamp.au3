if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Winamp',160,80,0,110)

If FileExists("winamp5666_full_all.exe") AND not FileExists (@ProgramFilesDir & "\Winamp\winamp.exe") AND not FileExists (@ProgramFilesDir & " (x86)\Winamp\winamp.exe") Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Winamp"&@CRLF)


;		REGISTRO		-------------------------
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Nullsoft\Winamp','regname','REG_SZ','INFormatica LA')
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Nullsoft\Winamp','regkey','REG_SZ','~bHFIPKUcjAZAaJaZgCcK')
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Nullsoft\Winamp','regname','REG_SZ','INFormatica LA')
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Nullsoft\Winamp','regkey','REG_SZ','~bHFIPKUcjAZAaJaZgCcK')
;		REGISTRO		-------------------------

	;~ ShellExecuteWait("iNST WINA.bat")
	ShellExecuteWait("winamp5666_full_all.exe",' /S /install=SFQDRA')


	if FileExists (@ProgramFilesDir & "\Winamp\winamp.exe") Then
		ShellExecute(@ProgramFilesDir & "\Winamp\winamp.exe")
	ElseIf FileExists (@ProgramFilesDir & " (x86)\Winamp\winamp.exe") Then
		ShellExecute(@ProgramFilesDir & " (x86)\Winamp\winamp.exe")
	EndIf


	WinWait("Instalación de Winamp v5.666 Build 3516")
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Winamp' & @crlf & 'No tocar el Mouse',160,80,0,110)
	While not WinActive("Instalación de Winamp v5.666 Build 3516")
		WinActivate("Instalación de Winamp v5.666 Build 3516")
	WEnd

	$positionArray = WinGetPos ("Instalación de Winamp v5.666 Build 3516", "")

	While not WinActive("Instalación de Winamp v5.666 Build 3516")
		WinActivate("Instalación de Winamp v5.666 Build 3516")
	WEnd

;~ 	MouseMove($positionArray[0] + 200 , $positionArray[1] + 220,0)
;~ 	if @OSVersion<>'WIN_10' and  @OSVersion<>'WIN_7' then MsgBox(0,'','winamp ver si falla o no y cambiar como cambie para windows 10')
;~ 	if @OSVersion='WIN_10' then MouseMove($positionArray[0] + 200 , $positionArray[1] + 220,0)

;~ 	While not WinActive("Instalación de Winamp v5.666 Build 3516")
;~ 		WinActivate("Instalación de Winamp v5.666 Build 3516")
;~ 	WEnd

;~ 	MouseClick('left')
; MsgBox(0,'','')
$sentido=0
Do
	if $sentido=0 then send('{down}')
	if $sentido=1 then send('{up}')
	if WinExists("Instalación de Winamp v5.666 Build 3516", "Winamp5 Base Skin") then $sentido=1
	if WinExists("Instalación de Winamp v5.666 Build 3516", "Bento") then $sentido=0


	WinActivate("Instalación de Winamp v5.666 Build 3516")
	Sleep(300)

Until WinExists("Instalación de Winamp v5.666 Build 3516", "Clásica de Winamp")

	WinWait("Instalación de Winamp v5.666 Build 3516", "Clásica de Winamp")

	While not WinActive("Instalación de Winamp v5.666 Build 3516")
		WinActivate("Instalación de Winamp v5.666 Build 3516")
	WEnd
;~ MsgBox(0,'','2')

	ControlClick('Instalación de Winamp v5.666 Build 3516','&Siguiente','Button5')
	;~ ;-----------------------------------------------------------------------------
	;~ ;arriba vent 1 abajo vent 2
	;~ ;-----------------------------------------------------------------------------

	$positionArray = WinGetPos ("Instalación de Winamp v5.666 Build 3516", "")
;~ MsgBox(0,'','3')

	While not WinActive("Instalación de Winamp v5.666 Build 3516")
		WinActivate("Instalación de Winamp v5.666 Build 3516")
	WEnd

	MouseMove($positionArray[0] + 212 , $positionArray[1] + 160,0)

	While not WinActive("Instalación de Winamp v5.666 Build 3516")
		WinActivate("Instalación de Winamp v5.666 Build 3516")
	WEnd

	MouseClick('left')

	While not WinActive("Instalación de Winamp v5.666 Build 3516")
		WinActivate("Instalación de Winamp v5.666 Build 3516")
	WEnd

	ControlClick('Instalación de Winamp v5.666 Build 3516','&Finalizar','Button6')
	ControlClick('Instalación de Winamp v5.666 Build 3516','&Finalizar','Button7')


	WinWaitClose("Instalación de Winamp v5.666 Build 3516", "")

	WinWait("Configuración de Winamp",'Omitir')
	WinActivate("Configuración de Winamp",'Omitir')
	WinWaitActive("Configuración de Winamp",'Omitir')
	ControlClick('Configuración de Winamp','Omitir','Button1')

;mute probar
	ShellExecuteWait('nircmd.exe',' mutesysvolume 1')
;mute probar

	WinWaitClose("Configuración de Winamp")
	WinWait("1. DJ Mike Llama")

	WinWait('Agregar medios a la Biblioteca')
	WinActivate('Agregar medios a la Biblioteca')
	WinWaitActive('Agregar medios a la Biblioteca')
	ControlCommand('Agregar medios a la Biblioteca','No mostrar esta ventana nuevamente','Button3',"Check", "")
	ControlClick('Agregar medios a la Biblioteca','Cerrar','Button4')

	ProcessClose('winamp.exe')
	if @OSVersion= "WIN_XP" then
		filecopy(@DesktopDir & '\Winamp.lnk',@ProgramsCommonDir)
	Else
		filecopy(@DesktopCommonDir & '\Winamp.lnk',@ProgramsDir)
	EndIf

	While WinExists('Winamp Portable Music Player Support')
			ControlClick('Winamp Portable Music Player Support','&No','Button2')
	WEnd

	ProcessWaitClose('winamp.exe')

;mute probar
	ShellExecuteWait('nircmd.exe',' mutesysvolume 0')
;mute probar


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Winamp"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Winamp"&@CRLF)
EndIf

