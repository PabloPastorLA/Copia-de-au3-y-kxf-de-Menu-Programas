SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'DPInst Auto X86 X64',160,80,0,110)
if @OSVersion <> "WIN_XP" Then
	#RequireAdmin
EndIf





if 7=MsgBox(4,'','Voy a correr DPInst desde el dir raiz. Continuar?') then Exit


$debug=0




if @OSArch ='X86' then SinGUIparaX86()
if @OSArch<>'X86' then ConGUIparaX64()







func SinGUIparaX86()

	if @OSArch = "X86" Then
		ShellExecuteWait('dpinst.exe',' /q','G5 W10 X86')
	Else
		MsgBox(0,'','Error x86 x64')
	EndIf
EndFunc




func ConGUIparaX64()

	if @OSVersion='WIN_7' Then
		ShellExecute('dpinst64.exe');,'','G5 W7 X64')
	Elseif @OSVersion='WIN_10' Then
;		MsgBox(0,'','probando w10 64 drivers de una sola carpeta. si funciona sacar las carpetas de a numeros y la funcion al pedo en este au3')
		ShellExecute('dpinst64.exe');,'','G5 W10 X64')
	Else
		MsgBox(0,'','DPInst Os error, corregir codigo')
	EndIf

	$win='Asistente para la instalación de controladores de dispositivos'


	Do
		if WinExists($win,'Siguien&te >') then ControlClick($win,'Siguien&te >','Button2')
		if WinExists($win,'Finalizar') then
			if $debug=1 then MsgBox(0,'','continuar');Sleep(3000)
			ControlClick($win,'Finalizar','Button7')
		EndIf

		if WinExists('Seguridad de Windows','debería instalar software de controlador ') then MsgBox(0,'','cartel1');
;~ 			if ControlGetText('Seguridad de Windows','&Instalar','Button1')='&Instalar este software de controlador de todas formas' then ControlClick('Seguridad de Windows','&Instalar','Button1')
;~ 			if ControlGetText('Seguridad de Windows','&Instalar','Button2')='&Instalar este software de controlador de todas formas' then ControlClick('Seguridad de Windows','&Instalar','Button2')
;~ 		EndIf

		if WinExists('Seguridad de Windows','&Instalar este software de controlador de todas formas') then ;MsgBox(0,'','cartel1');ControlClick('Seguridad de Windows','&Instalar este software de controlador de todas formas','Button1')
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
