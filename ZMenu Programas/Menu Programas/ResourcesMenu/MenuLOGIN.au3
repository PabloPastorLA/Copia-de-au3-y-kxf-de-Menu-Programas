#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
$exit=0

;MODIFICACION PARA MENU DE INSTALADORES, NO PARA MenuRED2.exe
;while ProcessExists('MenuRED2.exe') and $exit=0
while (ProcessExists('MenuRED2.exe') Or ProcessExists('Menu.exe')) and $exit=0
	;MODIFICACION PARA MENU DE INSTALADORES, NO PARA MenuRED2.exe
	;While not WinExists('Seguridad de Windows') and ProcessExists('MenuRED2.exe')
	While not WinExists('Seguridad de Windows') and (ProcessExists('MenuRED2.exe') or ProcessExists('Menu.exe'))
		Sleep(300)
	WEnd
	if @OSVersion='WIN_7' Then
		;MODIFICACION PARA MENU DE INSTALADORES, NO PARA MenuRED2.exe
		;While $exit=0 and ProcessExists('MenuRED2.exe')
		While $exit=0 and (ProcessExists('MenuRED2.exe') or ProcessExists('Menu.exe'))
			Sleep(300)
			if WinExists('Seguridad de Windows') Then
				ControlSetText('Seguridad de Windows','','Edit1','USUARIO')
				ControlSetText('Seguridad de Windows','','Edit2','123')
				ControlClick('Seguridad de Windows','Aceptar','Button2')
				Sleep(5000)
				if not WinExists('Seguridad de Windows') Then $exit=1
			EndIf
		WEnd
	EndIf
	if @OSVersion='WIN_10' Then
		;MODIFICACION PARA MENU DE INSTALADORES, NO PARA MenuRED2.exe
		;While $exit=0 and ProcessExists('MenuRED2.exe')
		While $exit=0 and (ProcessExists('MenuRED2.exe') or ProcessExists('Menu.exe'))
			Sleep(300)
			if WinExists('Seguridad de Windows') Then
				WinActivate('Seguridad de Windows')
				$pos=WinGetPos('Seguridad de Windows')
				MouseMove($Pos[0]+10,$Pos[1]+10,0)
				MouseClick('',$Pos[0]+10,$Pos[1]+10,1,0)
				send('Usuario')
				send('{tab}')
				send('123')
				send('{enter}')
				Sleep(5000)
				if WinExists('Seguridad de Windows') then
					While WinExists('Seguridad de Windows')
						MsgBox(0,'','LOGUEARSES A MANO, LUEGO ACEPTAR ESTA VENTANA')
					WEnd
				EndIf
				if not WinExists('Seguridad de Windows') Then $exit=1
			EndIf
		WEnd
	EndIf

	;MODIFICACION PARA MENU DE INSTALADORES, NO PARA MenuRED2.exe
	;if not ProcessExists('MenuRED2.exe') then $exit=1
	if not ProcessExists('MenuRED2.exe') and not ProcessExists('MenuRED2.exe') then $exit=1
WEnd
