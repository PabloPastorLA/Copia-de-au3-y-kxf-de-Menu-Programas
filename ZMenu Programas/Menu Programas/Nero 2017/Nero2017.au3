if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Nero 2k17',160,80,0,110)


If FileExists("nero2017vlplatinum\setup.exe") and FileExists('Nero2017_v18.x_Patch_DFoX_v2.4\Nero2017_v18.x_Patch_DFoX_v2.4.exe') AND not FileExists (@ProgramFilesDir & "\Nero\Nero 2017\Nero Launcher\NeroLauncher.exe") AND not FileExists (@ProgramFilesDir & " (x86)\Nero\Nero 2017\Nero Launcher\NeroLauncher.exe")  Then

	instalar()
	patch()

	if @OSArch='x86' Then MsgBox(0,'','Nero 2017 Verificar si escribe en el registro la sgte linea')
	Regwrite('HKEY_CURRENT_USER\Software\Nero\Nero 11\Shared\NeverShowMeAgain','PDTRMDR','REG_QWORD',9223372036854775807)

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Nero 2017"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Nero 2017"&@CRLF)
EndIf





func patch()
	$ventanita=0
	ShellExecute('Nero2017_v18.x_Patch_DFoX_v2.4\Nero2017_v18.x_Patch_DFoX_v2.4.exe')
	WinWait('.:[DFoX]:.')
	While WinExists('.:[DFoX]:.')
		WinActivate('.:[DFoX]:.')
		Sleep(50)

		If ControlCommand('.:[DFoX]:.','Patch','WindowsForms10.BUTTON.app.0.141b42a_r27_ad14',"IsEnabled", "") Then ;and $ventanita<1 Then
			ControlClick('.:[DFoX]:.','Patch','WindowsForms10.BUTTON.app.0.141b42a_r27_ad14')
			While ControlCommand('','Aceptar','Button1',"IsVisible", "")=0
			WEnd
			While ControlCommand('','Aceptar','Button1',"IsVisible", "")=1
				ControlClick('','Aceptar','Button1')
				$ventanita1=1
			WEnd
		EndIf

		If ControlCommand('','Aceptar','Button1',"IsVisible", "")=1 Then
			While ControlCommand('','Aceptar','Button1',"IsVisible", "")=1
				ControlClick('','Aceptar','Button1')
			WEnd
			$ventanita=$ventanita+1
		EndIf

		If ControlCommand('.:[DFoX]:.','Patch','WindowsForms10.BUTTON.app.0.141b42a_r27_ad14',"IsEnabled", "")=0 and ControlCommand('','Aceptar','Button1',"IsVisible", "")= 0 Then
			ControlClick('.:[DFoX]:.','Serial','WindowsForms10.BUTTON.app.0.141b42a_r27_ad11')
		EndIf

		If $ventanita>2 Then WinClose('.:[DFoX]:.')
	WEnd
EndFunc




Func instalar()
	ShellExecute('nero2017vlplatinum\setup.exe')

	WinWait('InstallShield Wizard','Nero 2017 VL Platinum')
	while WinExists('InstallShield Wizard','Instalar')
		if ControlCommand('InstallShield Wizard','Instalar','Button1',"IsEnabled", "") Then ControlClick('InstallShield Wizard','Instalar','Button1');,"IsEnabled", "")
	WEnd

	WinWait('Nero 2017 VL Platinum - InstallShield Wizard','Bienvenido a la instalación de Nero')
	while WinExists('Nero 2017 VL Platinum - InstallShield Wizard');,'Bienvenido a la instalación de Nero')
		if ControlGetText('Nero 2017 VL Platinum - InstallShield Wizard','Bienvenido a la instalación de Nero','RichEdit20W1')<>'907C-81CC-XM9M-W80H-E6M7-85EM-82H5-XC2W' Then ControlSetText('Nero 2017 VL Platinum - InstallShield Wizard','Bienvenido a la instalación de Nero','RichEdit20W1','907C-81CC-XM9M-W80H-E6M7-85EM-82H5-XC2W')
		if ControlGetText('Nero 2017 VL Platinum - InstallShield Wizard','Bienvenido a la instalación de Nero','RichEdit20W1')='907C-81CC-XM9M-W80H-E6M7-85EM-82H5-XC2W' Then ControlClick('Nero 2017 VL Platinum - InstallShield Wizard','&Siguiente >','Button2')

		if ControlCommand('Nero 2017 VL Platinum - InstallShield Wizard','Ac&epto los términos del contrato de licencia','Button3',"IsChecked", "")=0 Then ControlCommand('Nero 2017 VL Platinum - InstallShield Wizard','Ac&epto los términos del contrato de licencia','Button3',"Check", "")
		if ControlCommand('Nero 2017 VL Platinum - InstallShield Wizard','Ac&epto los términos del contrato de licencia','Button3',"IsChecked", "")=1 Then ControlClick('Nero 2017 VL Platinum - InstallShield Wizard','&Siguiente >','Button4');,"Check", "")

		if ControlCommand('Nero 2017 VL Platinum - InstallShield Wizard','Abrir siempre los archivos multimedia con Nero 2017 VL Platinum.','Button7',"IsChecked", "")=1 Then ControlCommand('Nero 2017 VL Platinum - InstallShield Wizard','Abrir siempre los archivos multimedia con Nero 2017 VL Platinum.','Button7',"UnCheck", "")
		if ControlCommand('Nero 2017 VL Platinum - InstallShield Wizard','No, gracias.','Button10',"IsChecked", "")=0 Then ControlCommand('Nero 2017 VL Platinum - InstallShield Wizard','No, gracias.','Button10',"Check", "")
		if ControlCommand('Nero 2017 VL Platinum - InstallShield Wizard','Abrir siempre los archivos multimedia con Nero 2017 VL Platinum.','Button7',"IsChecked", "")=0 And ControlCommand('Nero 2017 VL Platinum - InstallShield Wizard','No, gracias.','Button10',"IsChecked", "")=1 Then ControlClick('Nero 2017 VL Platinum - InstallShield Wizard','&Instalar','Button2')

		if WinExists('Nero 2017 VL Platinum - InstallShield Wizard','InstallShield Wizard ha instalado') Then
			if ControlCommand('Nero 2017 VL Platinum - InstallShield Wizard','','Button2',"IsChecked", "") Then ControlCommand('Nero 2017 VL Platinum - InstallShield Wizard','','Button2',"UnCheck", "")
			if ControlCommand('Nero 2017 VL Platinum - InstallShield Wizard','','Button2',"IsChecked", "")=0 Then ControlClick('Nero 2017 VL Platinum - InstallShield Wizard','&Finalizar','Button1')
		EndIf
	WEnd
EndFunc






