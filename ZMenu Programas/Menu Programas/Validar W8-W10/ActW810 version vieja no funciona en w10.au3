;~ Button1 = Windows key
;~ Button2 = Office key
;~ Button4 = Borra el texto
;~ Button6 = Activate Office
;~ Button7 = Activate Windows
;~ Button13 = Windows Reactivation
;~ Button14 = Office Reactivation
;~ MsgBox(0,'',ControlGetText('KMSAuto Lite '&$text&'v1.3.5.1 by Ratiborus','','Button12'))

$debug=0



MsgBox(0,'','activador de windows. me cierro. despues probar el activador nuevo')
MsgBox(0,'','el cativador nuevo va como trompada. crear au3')

Exit





if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf

splash('')

if @OSArch='X86' then $text=''
if @OSArch<>'X86' then $text='x64 '



If FileExists('UnRAR.exe') and FileExists('KMSLite PASS 123.rar') Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Validador W8-10"&@CRLF)



	if @OSVersion='WIN_10' then exclu()

			;DETENER WINDEFENDER
			if @OSVersion='WIN_10' then ShellExecuteWait('WinDefDesact.exe','',menuprogramas()&'\Windows Defender Control')


	nodEx()
	unrar()
	Instalar()
	borrar()

			;ACTIVAR WINDEFENDER
			if @OSVersion='WIN_10' then ShellExecuteWait('WinDefAct.exe','',menuprogramas()&'\Windows Defender Control')



	FileWrite(@DesktopDir & "\Validador windows ver tema de exclusion.txt","")


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Validador W8-10"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Validador W8-10"&@CRLF)
EndIf


func borrar()
	If FileExists('KMSAuto.exe') or FileExists('KMSAuto x64.exe') then
		Do
			FileDelete('KMSAuto.exe')
			FileDelete('KMSAuto x64.exe')
		Until not FileExists('KMSAuto.exe') and not FileExists('KMSAuto x64.exe')
	EndIf
EndFunc

func Splash($funcion)
	If @OSVersion='WIN_10' Then SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Val. W10'&@CRLF&$funcion,160,80,0,110)
	If @OSVersion='WIN_81' Then SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Val. W81'&@CRLF&$funcion,160,80,0,110)
	If @OSVersion='WIN_8'  Then SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Val. W8' &@CRLF&$funcion,160,80,0,110)
EndFunc

func nodEx()
	Splash('nodEx')
	$ProgramFilesDir=@ProgramFilesDir
	if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)
	If FileExists ($ProgramFilesDir &'\ESET\ESET NOD32 Antivirus\egui.exe') Or FileExists ($ProgramFilesDir &' (x86)\ESET\ESET NOD32 Antivirus\egui.exe') Then nodexclu()
EndFunc



func Exclu()
	Splash('Exclu')
	If @OSVersion='WIN_10' then

		;EXCLUSIONES WINDEFENDER
		global $ruta=@WindowsDir&'\KMSAutoS'
		ShellExecuteWait('WinDefExclusion.exe','"'&$ruta&'"',menuprogramas()&'\Windows Defender Control')
;~ 		global $ruta=@ScriptDir&'\KMSAuto.exe'
;~ 		ShellExecuteWait('WinDefExclusion.exe','"'&$ruta&'"',menuprogramas()&'\Windows Defender Control')
;~ 		global $ruta=@ScriptDir&'\KMSAuto x64.exe'
;~ 		ShellExecuteWait('WinDefExclusion.exe','"'&$ruta&'"',menuprogramas()&'\Windows Defender Control')


	Else
		MsgBox(0,'ActW810','Falla exclusion windefender')
	EndIf
EndFunc

func menuprogramas()
	Splash('menuprogramas')
	$MenuProgramas=@ScriptDir
	Do
	$MenuProgramas=StringTrimRight($MenuProgramas,1)
	until StringRight($MenuProgramas,1)='\'
	$MenuProgramas=StringTrimRight($MenuProgramas,1)
	Return $MenuProgramas
EndFunc

func unrar()
	Splash('unrar')
	if $debug=1 Then SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Val. DEBUG'& @crlf & 'UnRAR',160,80,0,110)

	ShellExecuteWait('UnRAR.exe','x -p123 -y "KMSLite PASS 123.rar"')
	sleep(500)
	while not FileExists ('KMSAuto.exe') and not FileExists ('KMSAuto x64.exe')
		MsgBox(0,'Antivirus activo','Desactive el antivirus y presiones OK para poder extraer KMSAuto Net')
		sleep(500)
		unrar()
	WEnd
EndFunc






func instalar()
	Splash('instalar')

	If @OSVersion='WIN_10' Then SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Val. W10',160,80,0,110)
	If @OSVersion='WIN_81' Then SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Val. W81',160,80,0,110)
	If @OSVersion='WIN_8'  Then SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Val. W8' ,160,80,0,110)

	While ProcessExists('KMSAuto.exe') or ProcessExists('KMSAuto x64.exe')
		ProcessClose('KMSAuto.exe')
		ProcessClose('KMSAuto x64.exe')
	WEnd

	While FileExists('KMSAutoLite.ini')
		FileDelete('KMSAutoLite.ini')
	WEnd

	if @OSArch='X86' then
		ShellExecute('KMSAuto')
	EndIf

	if @OSArch<>'X86' then
		ShellExecute('KMSAuto x64')
	EndIf

	WinWait('KMSAuto Lite '&$text&'v1.3.5.1 by Ratiborus','=== KMSAuto Lite '&$text&'v1.3.5.1 ===')

	moversinecesario()

	;------------------	DESDE ACA ACTIVAR WINDOWS ------------------------

	;click en activate office
	while Not WinExists ('KMSAuto Lite '&$text&'v1.3.5.1 by Ratiborus','===== Performing =====')
		ControlCommand('KMSAuto Lite '&$text&'v1.3.5.1 by Ratiborus','','Button7',"Check", "")
		Sleep(3000)
	WEnd

	;esperar a que termine activate
	while WinExists ('KMSAuto Lite '&$text&'v1.3.5.1 by Ratiborus','===== Performing =====') And Not WinExists ('KMSAuto Lite '&$text&'v1.3.5.1 by Ratiborus','****** Completed *****')
		Sleep(3000)
	WEnd

	;~ ;------------------	HASTA ACA FUE ACTIVAR WINDOWS, SIGUE PROG TAREA ------------------------

	;click en Scheduler
	if ControlCommand('KMSAuto Lite '&$text&'v1.3.5.1 by Ratiborus','','Button11',"IsChecked", "")=0 then ControlCommand('KMSAuto Lite '&$text&'v1.3.5.1 by Ratiborus','','Button11',"Check", "")
	Sleep(2000)

	;click en Reactivate Windows
	while Not WinExists ('KMSAuto Lite '&$text&'v1.3.5.1 by Ratiborus','Correcto: se creó correctamente la tarea programada')
		ControlCommand('KMSAuto Lite '&$text&'v1.3.5.1 by Ratiborus','','Button13',"Check", "")
		Sleep(3000)
	WEnd

	;------------------	HASTA ACA FUE TAREA PROG, TERMINO ------------------------

	while WinExists ('KMSAuto Lite '&$text&'v1.3.5.1 by Ratiborus')
		WinClose('KMSAuto Lite '&$text&'v1.3.5.1 by Ratiborus')
	WEnd

	;------------------	TERMINÉ ------------------------
EndFunc




func moversinecesario()
	Splash('moversinecesario')
	if $debug=1 then SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Val. Office' & @crlf & 'Func MOVER',160,80,0,110)
	$POSICION=WinGetPos('KMSAuto Lite '&$text&'v1.3.5.1 by Ratiborus');,'=== KMSAuto Lite '&$text&'v1.3.5.1 ===')
	if $POSICION[0]<300 then WinMove('KMSAuto Lite '&$text&'v1.3.5.1 by Ratiborus','',300,$POSICION[1])
EndFunc


Func NodExclu()
	Splash('NodExclu')
;	MsgBox(0,'','estoy en nodexclu')
	$ProgramFilesDir=@ProgramFilesDir
	if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)
	If FileExists ($ProgramFilesDir &'\ESET\ESET NOD32 Antivirus\egui.exe') Then
		ShellExecute($ProgramFilesDir &'\ESET\ESET NOD32 Antivirus\egui.exe')
	Elseif FileExists ($ProgramFilesDir &' (x86)\ESET\ESET NOD32 Antivirus\egui.exe') Then
		ShellExecute($ProgramFilesDir &' (x86)\ESET\ESET NOD32 Antivirus\egui.exe')
	Else
		MsgBox(0,'Val w8 w10','No encontre nod32 para verificar exclusion office 2010')
		if MsgBox(1,'Val w8 w10','Continuo con la verificacion?')=2 then
			Exit
		Else
			Return
		EndIf

	EndIf


	While not WinExists ('ESET NOD32 Antivirus','Predeterminado')
		WinWait('ESET NOD32 Antivirus')
		WinActivate('ESET NOD32 Antivirus')
		Send('{F5}')
	WEnd

	$exit=0
	while $exit<20
		Sleep(100)
		if WinExists('ESET NOD32 Antivirus','Protección Antivirus y antiespía') then
			$exit=20
			WinActivate('ESET NOD32 Antivirus','Protección Antivirus y antiespía')
			WinWaitActive('ESET NOD32 Antivirus','Protección Antivirus y antiespía')
			Send('{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}')
		Else
			$exit=20;$exit+1
		EndIf
	WEnd

	$sentido=0
	while not WinExists('ESET NOD32 Antivirus','Exclusiones')
		Sleep(500)
		if not WinActive('ESET NOD32 Antivirus','') then WinActivate('ESET NOD32 Antivirus','')

		if WinExists('ESET NOD32 Antivirus','Integración con el cliente de correo electrónico') then $sentido=1
		if WinExists('ESET NOD32 Antivirus','Protección Antivirus y antiespía') then $sentido=0
		if $sentido=0 then Send('{down}')
		if $sentido=1 then Send('{up}')
	WEnd








	$agregar=@WindowsDir&"\KMSAutoS\*.*"
	agregar($agregar)
	ControlClick('Agregar exclusión','Acep&tar','Button2')

	WinWaitClose('Agregar exclusión')
	For $p=0 to 200 Step 1
		If ControlGetText('ESET NOD32 Antivirus','Acep&tar','Button'&$p) = 'Acep&tar' then ControlClick('ESET NOD32 Antivirus','Acep&tar','Button'&$p)
	Next
	WinWaitClose('ESET NOD32 Antivirus','Exclusiones')

	while WinGetState('ESET NOD32 Antivirus')<> 5 And WinGetState('ESET NOD32 Antivirus')<> 13
		WinsetState('ESET NOD32 Antivirus','',@SW_HIDE )
	WEnd

EndFunc




Func agregar($agregar)
	Splash('agregar')
	ControlClick('ESET NOD32 Antivirus','&Agregar...','Button2')
	WinWait('Agregar exclusión')
	While ControlGetText('Agregar exclusión','','Edit1')<> $agregar
		ControlSetText('Agregar exclusión','','Edit1','')
		ControlSetText('Agregar exclusión','','Edit1',$agregar)
		Sleep(1000)
	WEnd
EndFunc
