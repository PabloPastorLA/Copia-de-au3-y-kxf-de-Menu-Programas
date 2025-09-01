SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'DPInst G9',160,80,0,110)
if @OSVersion <> "WIN_XP" Then
	#RequireAdmin
EndIf









$debug=0


FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Energ G9"&@CRLF)


;OPCIONES ENERGIA G9


;desactivar suspension menu apagar
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab',"ACSettingIndex",'REG_DWORD',0)
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab',"DCSettingIndex",'REG_DWORD',0)

;desactivar hibernar menu apagar
ShellExecuteWait('cmd.exe',' /C powercfg -h off','','',@SW_HIDE)


;desactivar suspension y cambiar suspension por hibernar en boton enc, boton susp y pantalla
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\7648EFA3-DD9C-4E3E-B566-50F929386280',"ACSettingIndex",'REG_DWORD',3)
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\7648EFA3-DD9C-4E3E-B566-50F929386280',"DCSettingIndex",'REG_DWORD',3)

RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\5CA83367-6E45-459F-A27B-476B1D01C936',"ACSettingIndex",'REG_DWORD',0)
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\5CA83367-6E45-459F-A27B-476B1D01C936',"DCSettingIndex",'REG_DWORD',0)

RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\96996BC0-AD50-47EC-923B-6F41874DD9EB',"ACSettingIndex",'REG_DWORD',0)
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\96996BC0-AD50-47EC-923B-6F41874DD9EB',"DCSettingIndex",'REG_DWORD',0)


;suspender/hibernar tras: nunca
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\29F6C1DB-86DA-48C5-9FDB-F2B67B1F44DA',"ACSettingIndex",'REG_DWORD',0)
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\29F6C1DB-86DA-48C5-9FDB-F2B67B1F44DA',"DCSettingIndex",'REG_DWORD',0)

RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\9D7815A6-7EE4-497E-8888-515A05F02364',"ACSettingIndex",'REG_DWORD',0)
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\9D7815A6-7EE4-497E-8888-515A05F02364',"DCSettingIndex",'REG_DWORD',0)




;if @OSArch ='X86' then SinGUIparaX86()
;if @OSArch ='X86' then ConGUIparaX86()
;if @OSArch<>'X86' then ConGUIparaX64()
ConGUI()




FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Drivers G9"&@CRLF)






func ConGUI()
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'DPInst -Con GUI-',160,80,0,110)

	$64=''
	if @OSArch<>'x86' then $64='64'

	ShellExecute('dpinst'&$64&'.exe','','G9 '&@OSVersion&' '&@OSArch)


;~ 	if @OSVersion='WIN_7' Then
;~ 		ShellExecute('dpinst.exe','','G5 W7 X86')
;~ 	Elseif @OSVersion='WIN_10' Then
		;MsgBox(0,'','probando w10 64 drivers de una sola carpeta. si funciona sacar las carpetas de a numeros y la funcion al pedo en este au3')
;~ 		ShellExecuteWait('dpinst.exe','','G5 W10 X86')
;~ 	Else
;~ 		MsgBox(0,'','G5 error en ConGUIparaX86()')
;~ 	EndIf

	$win='Asistente para la instalación de controladores de dispositivos'


	Do
		if WinExists($win,'Siguien&te >') then ControlClick($win,'Siguien&te >','Button2')
		if WinExists($win,'Finalizar') then
			if $debug=1 then MsgBox(0,'','continuar');Sleep(3000)
			ControlClick($win,'Finalizar','Button7')
		EndIf

		if WinExists('Seguridad de Windows','debería instalar software de controlador ') then
 			if ControlGetText('Seguridad de Windows','&Instalar','Button1')='&Instalar' then ControlClick('Seguridad de Windows','&Instalar','Button1')
 			if ControlGetText('Seguridad de Windows','&Instalar','Button2')='&Instalar' then ControlClick('Seguridad de Windows','&Instalar','Button2')
 		EndIf

		if WinExists('Seguridad de Windows','&Instalar este software de controlador de todas formas') then
			if ControlGetText('Seguridad de Windows','&Instalar','Button1')='&Instalar este software de controlador de todas formas' then ControlClick('Seguridad de Windows','&Instalar','Button1')
 			if ControlGetText('Seguridad de Windows','&Instalar','Button2')='&Instalar este software de controlador de todas formas' then ControlClick('Seguridad de Windows','&Instalar','Button2')
 		EndIf
		if WinExists('Microsoft Windows','Reiniciar &más tarde') and ControlGetText('Microsoft Windows','Reiniciar &más tarde','Button2')='Reiniciar &más tarde' then ControlClick('Microsoft Windows','Reiniciar &más tarde','Button2')

		Sleep(500)
	until not ProcessExists('dpinst.exe') and not ProcessExists('dpinst64.exe')
EndFunc






func ConGUIparaX86()
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'DPInst con GUI x86',160,80,0,110)

	if @OSVersion='WIN_7' Then
		ShellExecute('dpinst.exe','','G5 W7 X86')
	Elseif @OSVersion='WIN_10' Then
		;MsgBox(0,'','probando w10 64 drivers de una sola carpeta. si funciona sacar las carpetas de a numeros y la funcion al pedo en este au3')
		ShellExecuteWait('dpinst.exe','','G5 W10 X86')
	Else
		MsgBox(0,'','G5 error en ConGUIparaX86()')
	EndIf

	$win='Asistente para la instalación de controladores de dispositivos'


	Do
		if WinExists($win,'Siguien&te >') then ControlClick($win,'Siguien&te >','Button2')
		if WinExists($win,'Finalizar') then
			if $debug=1 then MsgBox(0,'','continuar');Sleep(3000)
			ControlClick($win,'Finalizar','Button7')
		EndIf

		if WinExists('Seguridad de Windows','debería instalar software de controlador ') then
 			if ControlGetText('Seguridad de Windows','&Instalar','Button1')='&Instalar' then ControlClick('Seguridad de Windows','&Instalar','Button1')
 			if ControlGetText('Seguridad de Windows','&Instalar','Button2')='&Instalar' then ControlClick('Seguridad de Windows','&Instalar','Button2')
 		EndIf

		if WinExists('Seguridad de Windows','&Instalar este software de controlador de todas formas') then
			if ControlGetText('Seguridad de Windows','&Instalar','Button1')='&Instalar este software de controlador de todas formas' then ControlClick('Seguridad de Windows','&Instalar','Button1')
 			if ControlGetText('Seguridad de Windows','&Instalar','Button2')='&Instalar este software de controlador de todas formas' then ControlClick('Seguridad de Windows','&Instalar','Button2')
 		EndIf
		if WinExists('Microsoft Windows','Reiniciar &más tarde') and ControlGetText('Microsoft Windows','Reiniciar &más tarde','Button2')='Reiniciar &más tarde' then ControlClick('Microsoft Windows','Reiniciar &más tarde','Button2')

		Sleep(500)
	until not ProcessExists('dpinst.exe') and not ProcessExists('dpinst64.exe')
EndFunc





func SinGUIparaX86()
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'DPInst sin GUI tarda',160,80,0,110)

	if @OSArch = "X86" and @OSVersion='WIN_10' Then
		ShellExecuteWait('dpinst.exe',' /q','G5 W10 X86')
	Elseif @OSArch = "X86" and @OSVersion='WIN_7' Then
		ShellExecuteWait('dpinst.exe',' /q','G5 W7 X86')
	Else
		MsgBox(0,'','G5 error')
	EndIf

EndFunc




func ConGUIparaX64()
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'DPInst con GUI',160,80,0,110)

	if @OSVersion='WIN_7' Then
		ShellExecute('dpinst64.exe','','G5 W7 X64')
	Elseif @OSVersion='WIN_10' Then
		MsgBox(0,'','probando w10 64 drivers de una sola carpeta. si funciona sacar las carpetas de a numeros y la funcion al pedo en este au3')
		ShellExecute('dpinst64.exe','','G5 W10 X64')
	Else
		MsgBox(0,'','G5 error')
	EndIf

	$win='Asistente para la instalación de controladores de dispositivos'


	Do
		if WinExists($win,'Siguien&te >') then ControlClick($win,'Siguien&te >','Button2')
		if WinExists($win,'Finalizar') then
			if $debug=1 then MsgBox(0,'','continuar');Sleep(3000)
			ControlClick($win,'Finalizar','Button7')
		EndIf

		if WinExists('Seguridad de Windows','debería instalar software de controlador ') then
 			if ControlGetText('Seguridad de Windows','&Instalar','Button1')='&Instalar' then ControlClick('Seguridad de Windows','&Instalar','Button1')
 			if ControlGetText('Seguridad de Windows','&Instalar','Button2')='&Instalar' then ControlClick('Seguridad de Windows','&Instalar','Button2')
 		EndIf

		if WinExists('Seguridad de Windows','&Instalar este software de controlador de todas formas') then
			if ControlGetText('Seguridad de Windows','&Instalar','Button1')='&Instalar este software de controlador de todas formas' then ControlClick('Seguridad de Windows','&Instalar','Button1')
 			if ControlGetText('Seguridad de Windows','&Instalar','Button2')='&Instalar este software de controlador de todas formas' then ControlClick('Seguridad de Windows','&Instalar','Button2')
 		EndIf
		if WinExists('Microsoft Windows','Reiniciar &más tarde') and ControlGetText('Microsoft Windows','Reiniciar &más tarde','Button2')='Reiniciar &más tarde' then ControlClick('Microsoft Windows','Reiniciar &más tarde','Button2')

		Sleep(500)
	until not ProcessExists('dpinst.exe') and not ProcessExists('dpinst64.exe')
EndFunc





func ConGUIparaX64deacarpetas123()

	for $i=1 to 99
		$arch=('Log instalacion '&$i&'.txt')
		if not FileExists($arch) Then ExitLoop
	Next

	for $i=99 to 1 step -1
		$max=$i
		if FileExists($max) Then ExitLoop
	Next

	;MsgBox(0,'',$max)

	$win='Asistente para la instalación de controladores de dispositivos'

	for $i=1 to 50
		if FileExists($i) Then
			SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'DPInst con GUI'& @crlf & 'Log: '&$i&' de '&$max&'.',160,80,0,110)
			$handle=FileWriteLine($arch,'Empece a instalar:	'&$i&' de '&$max&'.')
			FileClose($handle)
			if @OSArch = "X86" Then
				ShellExecute('dpinst.exe','',$i)
			Else
				ShellExecute('dpinst64.exe','',$i)
			EndIf



			Do
				if WinExists($win,'Siguien&te >') then ControlClick($win,'Siguien&te >','Button2')
				if WinExists($win,'Finalizar') then
					if $debug=1 then MsgBox(0,'','continuar');Sleep(3000)
					ControlClick($win,'Finalizar','Button7')
				EndIf

				if WinExists('Seguridad de Windows','debería instalar software de controlador ') then ControlClick('Seguridad de Windows','&Instalar','Button1')
				if WinExists('Seguridad de Windows','&Instalar este software de controlador de todas formas') then ControlClick('Seguridad de Windows','&Instalar este software de controlador de todas formas','Button1')
				if WinExists('Microsoft Windows','Reiniciar &más tarde') and ControlGetText('Microsoft Windows','Reiniciar &más tarde','Button2')='Reiniciar &más tarde' then ControlClick('Microsoft Windows','Reiniciar &más tarde','Button2')

				Sleep(500)
			until not ProcessExists('dpinst.exe') and not ProcessExists('dpinst64.exe')

			$handle=FileWriteLine($arch,'Termine de instalar:	'&$i&' de '&$max&'.')
			FileClose($handle)

	 		;MsgBox(0,'','Termine '&$i&'. Continuo')
		EndIf
	Next

EndFunc
