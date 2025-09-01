;~ Button1 = Windows key
;~ Button2 = Office key
;~ Button4 = Borra el texto
;~ Button6 = Activate Office
;~ Button7 = Activate Windows
;~ Button13 = Windows Reactivation
;~ Button14 = Office Reactivation
;~ MsgBox(0,'',ControlGetText('KMSAuto Lite '&$text&'v1.3.5.1 by Ratiborus','','Button12'))


;~ $rar = 'KMSAuto.Lite.v1.6.5.x86.x64 pass 123.rar'
$rar = 'KMSAuto.Lite.v1.8.3.x86.x64 pass 123.rar'


$debug=0



if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf

splash('')

if @OSArch='X86' then $text=''
if @OSArch<>'X86' then $text='x64 '



If FileExists('UnRAR.exe') and FileExists($rar) Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Validador Off2016"&@CRLF)

;MsgBox(0,'','')

	if @OSVersion='WIN_10' then exclu()

			;DETENER WINDEFENDER
			if @OSVersion='WIN_10' then ShellExecuteWait('WinDefDesact.exe','',menuprogramas()&'\Windows Defender Control')


	nodEx()
	unrar()
	Instalar()
	borrar()

			;ACTIVAR WINDEFENDER
			if @OSVersion='WIN_10' then ShellExecuteWait('WinDefAct.exe','',menuprogramas()&'\Windows Defender Control')



;~ 	FileWrite(@DesktopDir & "\Validador windows ver tema de exclusion.txt","")


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Validador Off2016"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Validador Off2016"&@CRLF)
EndIf


func borrar()
	If FileExists('KMSAuto.exe') or FileExists('KMSAuto x64.exe') then
		Do
			FileDelete('KMSAuto.exe')
			FileDelete('KMSAuto x64.exe')
			FileDelete('readme_bg.txt')
			FileDelete('readme_en.txt')
			FileDelete('readme_ru.txt')
			FileDelete('readme_cn.txt')
		Until not FileExists('KMSAuto.exe') and not FileExists('KMSAuto x64.exe')
	EndIf
EndFunc

func Splash($funcion)
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Val Off2016'&@CRLF&$funcion,160,80,0,110)
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

	ShellExecuteWait('cmd',' /C UnRAR.exe x -p123 -y "' & $rar&'"')
	sleep(500)
	while not FileExists ('KMSAuto.exe') and not FileExists ('KMSAuto x64.exe')
		MsgBox(0,'Antivirus activo','Desactive el antivirus y presiones OK para poder extraer KMSAuto Net')
		sleep(500)
		unrar()
	WEnd
;~ 	MsgBox(0,'','unrar termino')
EndFunc






func instalar()
	Splash('instalar')

	If @OSVersion='WIN_10' Then SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Val Off2016',160,80,0,110)

	While ProcessExists('KMSAuto.exe') or ProcessExists('KMSAuto x64.exe')
		ProcessClose('KMSAuto.exe')
		ProcessClose('KMSAuto x64.exe')
	WEnd

	While FileExists('KMSAutoLite.ini')
		FileDelete('KMSAutoLite.ini')
	WEnd




	if @OSArch='X86' then
		ShellExecuteWait('KMSAuto.exe',' /ofs=act')
		ShellExecuteWait('KMSAuto.exe',' /sched=ofs')
	EndIf

	if @OSArch<>'X86' then
		ShellExecuteWait('KMSAuto x64.exe',' /ofs=act')
		ShellExecuteWait('KMSAuto x64.exe',' /sched=ofs')
	EndIf


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
