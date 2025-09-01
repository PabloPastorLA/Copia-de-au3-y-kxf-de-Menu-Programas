SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst Driv TPLink',160,80,0,110)
if @OSVersion <> "WIN_XP" Then
	#RequireAdmin
EndIf


$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)



if not FileExists($ProgramFilesDir&'\MenuInstalado\TPL') and not FileExists($ProgramFilesDir&' (x86)\MenuInstalado\TPL') then

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Drivers TPLink"&@CRLF)


;~ 	if @OSArch = "X86" Then
;~ 		ShellExecuteWait('dpinst.exe',' /q')
;~ 	Else
;~ 		ShellExecuteWait('dpinst64.exe',' /q')
;~ 	EndIf

ConGUI()

	DirCreate($ProgramFilesDir&'\MenuInstalado')
	FileWrite($ProgramFilesDir&'\MenuInstalado\TPL','')


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Drivers TPLink"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt",'Drivers TPLink'&@CRLF)
EndIf









func ConGUI()
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'DPInst TPLink',160,80,0,110)

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
;~ 			if $debug=1 then MsgBox(0,'','continuar');Sleep(3000)
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


