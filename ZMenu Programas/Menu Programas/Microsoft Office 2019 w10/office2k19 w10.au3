#include <File.au3>
#RequireAdmin
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Off 2019 w10',160,80,0,110)


If 1 then ;not FileExists (@ProgramFilesDir & "\Microsoft Office\root\office16\WINWORD.EXE") Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Microsoft Office 2K19"&@CRLF)


	$proceso=0
	If @OSArch='X86' then
		$proceso=ShellExecute("setup32.exe","",'Office');,'',@SW_HIDE)

	EndIf

	If @OSArch='X64' then
		$proceso=ShellExecute("setup64.exe","",'Office');,'',@SW_HIDE)

	EndIf

;~ MsgBox(0,'','aca1')
	Do
		;if WinExists then WinClose('','')
;~ 		ControlClick('‪Microsoft Office‬','','NetUIHWND1')
;~ 		EndIf

		Sleep(1000)
	until not ProcessExists($proceso)
;~ MsgBox(0,'','aca2')


	do
		if ControlCommand('‪Microsoft Office‬','','NetUICtrlNotifySink1','IsVisible','')=1 then
			;ControlSend('‪Microsoft Office‬','','NetUIHWND1','{altdown}{C}{altup}')
			WinActivate('‪Microsoft Office‬')
			Sleep(2000)
			Send('{altdown}{C}{altup}')
		EndIf
	until not ProcessExists('OfficeC2RClient.exe')
	;if ControlCommand('‪Microsoft Office‬','','NetUIHWND1','IsEnabled','')=1 then MsgBox(0,'','Es Visible')
;~ MsgBox(0,'','aca3')


$programfiles=@homedrive&'\Program Files'
if FileExists($programfiles&' (x86)\Microsoft OneDrive\21.030.0211.0002\OneDriveSetup.exe') then ShellExecuteWait($programfiles&' (x86)\Microsoft OneDrive\21.030.0211.0002\OneDriveSetup.exe',' /uninstall  /allusers  /quiet')
if FileExists($programfiles&'\Microsoft OneDrive\21.030.0211.0002\OneDriveSetup.exe') then ShellExecuteWait($programfiles&'\Microsoft OneDrive\21.030.0211.0002\OneDriveSetup.exe',' /uninstall  /allusers  /quiet')

;~ MsgBox(0,'','aca4')


;val viejo
;~ 					SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Val. Off 2019 w10',160,80,0,110)

;~ 					;DETENER WINDEFENDER
;~ 					if @OSVersion='WIN_10' then ShellExecuteWait('WinDefDesact.exe','',menuprogramas()&'\Windows Defender Control')

;~ 					;nodEx()
;~ 					unrar()
;~ 					Instalar()
;~ 					borrar()

;~ 					;ACTIVAR WINDEFENDER
;~ 					if @OSVersion='WIN_10' then ShellExecuteWait('WinDefAct.exe','',menuprogramas()&'\Windows Defender Control')
;fin val viejo

;~ MsgBox(0,'','ahora sigo con validar')


	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Off 2019 Validar',160,80,0,110)
	If @OSArch='X86' Then
		AbrirVentanasCerrar()
		ShellExecuteWait('AutoIt3.exe',"ActOff2k.au3")
		AbrirVentanasCerrar()
		ShellExecuteWait('AutoIt3.exe',"ActOff2k.au3")

	ElseIf @OSArch='X64' Then
		AbrirVentanasCerrar()
		ShellExecuteWait('AutoIt3_x64.exe',"ActOff2k.au3")
		AbrirVentanasCerrar()
		ShellExecuteWait('AutoIt3_x64.exe',"ActOff2k.au3")
	EndIf



;~ 	sacarservicios()


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Microsoft Office 2K19"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Microsoft Office 2K19"&@CRLF)
EndIf



Func AbrirVentanasCerrar()
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Off 2019 Ventanas',160,80,0,110)

	ShellExecute('test.docx')

	while not WinExists('test - Microsoft Word') and not WinExists('test - Word') and not WinExists('Word') and not WinExists('Microsoft Word')
		Sleep(300)
	WEnd
MsgBox(0,'','falla 2k09 en ventana al continuar')
	$exit=0
;	while (WinExists('test - Word') or WinExists('Word') or WinExists('Microsoft Word')) and $exit < 20
	while $exit < 30
		SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Off 2019 '&$exit&' de 30',160,80,0,110)

		Sleep(1000)
		$exit=$exit+1
		if WinExists('Cuentas') or WinExists('Iniciar sesión') then
			$exit=10
			WinClose('Iniciar sesión')	;OFFICE 2013
			WinClose('Cuentas')			;OFFICE 2016
		EndIf
		if WinExists('Lo primero es lo primero.') Then
			$exit=10
			WinActivate('Lo primero es lo primero.')
			WinWaitActive('Lo primero es lo primero.')
			Send('{altdown}{u}{a}{altup}')
		EndIf
		if WinExists('Microsoft Office 2013','NUIDocumentWindow') then
			$exit=10
			WinClose('Microsoft Office 2013','NUIDocumentWindow')
		EndIf

		if WinExists('Asistente para la activación de Microsoft Office') Then
			$exit=10
			WinClose('Asistente para la activación de Microsoft Office')
		EndIf

		if WinExists('Acepte el contrato de licencia') then
			$exit=10
			ControlSend('Acepte el contrato de licencia','','NetUIHWND1','{enter}')
		EndIf
	WEnd
;~ 	if WinExists('test - Word') then WinActivate('test - Word')
;~ 	if WinExists('test - Word') then WinWaitActive('test - Word')
;~ 	if WinExists('Word') then WinActivate('Word')
;~ 	if WinExists('Word') then WinWaitActive('Word')
;~ 	if WinExists('Microsoft Word') then WinActivate('Microsoft Word')
;~ 	if WinExists('Microsoft Word') then WinWaitActive('Microsoft Word')
;	Send('{ctrldown}{n}{ctrlup}')
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Off 2019 5 seg',160,80,0,110)
	Sleep(5000)

	while WinExists('test - Microsoft Word') or WinExists('test - Word'); or WinExists('Word') or WinExists('Microsoft Word') or WinExists('Documento1 - Word')
		WinClose('test - Microsoft Word')
		WinClose('test - Word')
	WEnd
EndFunc



func menuprogramas()
	$MenuProgramas=@ScriptDir
	Do
	$MenuProgramas=StringTrimRight($MenuProgramas,1)
	until StringRight($MenuProgramas,1)='\'
	$MenuProgramas=StringTrimRight($MenuProgramas,1)
	Return $MenuProgramas
EndFunc


func sacarservicios()

;	MsgBox(0,'Office 2016','Hasta aca instalé y valide todo. abrir word y verificar que funciones y este validado')
;	MsgBox(0,'Office 2016','voy a modificar servicios. darle aceptar y ver que cambien')
	If RegRead("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ose64", "Start")=3 Then RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ose64", "Start", "REG_DWORD", 4)
	If RegRead("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ose", "Start")=3 Then RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ose", "Start", "REG_DWORD", 4)
;ESTE SIEMPRE TIENE QUE CORRER, SINÓ FALLA	If RegRead("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClickToRunSvc", "Start")=2 Then RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClickToRunSvc", "Start", "REG_DWORD", 4)
;	MsgBox(0,'','ya modifique servicios. ver que cambiaron ahora.')
;	if @OSArch='X86' then 	MsgBox(0,'','ver servicios office. en x86 no los modifique')


EndFunc




func borrar()
	If FileExists('KMSAuto.exe') or FileExists('KMSAuto x64.exe') then
		Do
			FileDelete('KMSAuto.exe')
			FileDelete('KMSAuto x64.exe')
		Until not FileExists('KMSAuto.exe') and not FileExists('KMSAuto x64.exe')
	EndIf
EndFunc



func unrar()

	ShellExecuteWait('UnRAR.exe','x -p123 -y "KMSAuto.Lite.v1.6.5.x86.x64 pass 123.rar"')
	sleep(500)
	while not FileExists ('KMSAuto.exe') and not FileExists ('KMSAuto x64.exe')
		MsgBox(0,'Antivirus activo','Desactive el antivirus y presiones OK para poder extraer KMSAuto Net')
		sleep(500)
		unrar()
	WEnd
EndFunc





func instalar()
	While ProcessExists('KMSAuto.exe') or ProcessExists('KMSAuto x64.exe')
		ProcessClose('KMSAuto.exe')
		ProcessClose('KMSAuto x64.exe')
	WEnd

	While FileExists('KMSAutoLite.ini')
		FileDelete('KMSAutoLite.ini')
	WEnd





	if @OSArch='X86' then
		ShellExecuteWait('KMSAuto.exe',' /off=act')
		ShellExecuteWait('KMSAuto.exe',' /sched=off')
	EndIf

	if @OSArch<>'X86' then
		ShellExecuteWait('KMSAuto x64.exe',' /off=act')
		ShellExecuteWait('KMSAuto x64.exe',' /sched=off')
	EndIf


EndFunc



