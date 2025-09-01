SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Desac NOD',160,80,0,110)

Global $ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)

If FileExists ($ProgramFilesDir &'\ESET\ESET NOD32 Antivirus\egui.exe') Then
	$file=$ProgramFilesDir &'\ESET\ESET NOD32 Antivirus\egui.exe'
Elseif FileExists ($ProgramFilesDir &' (x86)\ESET\ESET NOD32 Antivirus\egui.exe') Then
	$file=$ProgramFilesDir &' (x86)\ESET\ESET NOD32 Antivirus\egui.exe'
Else
	MsgBox(0,'Desactivar NOD','FALLA Cerrando')
	Exit
EndIf

ShellExecute($file)
WinWaitActive('ESET NOD32 Antivirus')





;abrir ventana configuracion
	while not WinExists('ESET NOD32 Antivirus','Desactivar temporalmente la protección antivirus')
		WinActivate('ESET NOD32 Antivirus')
		if not WinActive('ESET NOD32 Antivirus','') then WinActivate('ESET NOD32 Antivirus','')
		ControlClick('ESET NOD32 Antivirus','','ESET Menu Window1')
		Send('{up}')

		$exit=0
		Do
			Sleep(10)
			$exit=$exit+1
		until $exit>=50 or WinExists('ESET NOD32 Antivirus','Desactivar temporalmente la protección antivirus')
	WEnd

;~ MsgBox(0,'','asdasd')

;click en Desactivar
	while not WinExists('ESET NOD32 Antivirus','Activar la protección antivirus y antiespía')
		do
		WinActivate('ESET NOD32 Antivirus')
		until WinActive('ESET NOD32 Antivirus')
		opt('MouseClickDownDelay',100)
		ControlCommand(
		;$handle=ControlGetHandle('ESET NOD32 Antivirus','Desactivar temporalmente la protección antivirus y antiespía','Static2');,'check','')
		;ControlClick('ESET NOD32 Antivirus','',$handle)
		;Sleep(1000)
		;ControlClick('ESET NOD32 Antivirus','Desactivar temporalmente la protección antivirus y antiespía','Static2');,'check','')
;~ 		MsgBox(0,'',ControlGetText('ESET NOD32 Antivirus','','Static2'))
;~ 		MsgBox(0,'',ControlGetFocus('ESET NOD32 Antivirus'))
		opt('MouseClickDownDelay',10)
;~ 		Send('{up}')


		$exit=0
		Do
			Sleep(10)
			$exit=$exit+1
		until $exit>=300 or WinExists('ESET NOD32 Antivirus','Activar temporalmente la protección antivirus')
	WEnd

