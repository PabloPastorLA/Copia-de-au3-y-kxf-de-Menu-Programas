guail()

func guail()
	$salir=0
	if @OSVersion='WIN_10' then $ventana='Propiedades de Usuario'

	while not $salir
		SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'MODIF lusrmgr',160,80,0,110)

		While WinExists($ventana)
			WinClose($ventana)
		WEnd
		;MsgBox(0,'','1')
		While WinExists('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
			WinClose('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
		WEnd
		;MsgBox(0,'','2')
		While WinExists('lusrmgr - [Usuarios y grupos locales (local)]')
			WinClose('lusrmgr - [Usuarios y grupos locales (local)]')
		WEnd
		;MsgBox(0,'','3')
		ShellExecute('mmc',' lusrmgr.msc')

		WinWait('lusrmgr - [Usuarios y grupos locales (local)]')
		;MsgBox(0,'','4')

		$timer=0
		$cant=0
		while $timer<3 And $cant<>2
			$timer=$timer+1
			Sleep(1000)
			$cant=ControlListView('lusrmgr - [Usuarios y grupos locales (local)]','','SysListView321',"GetItemCount") ;<> 4 And $1<7
			;MsgBox(0,'',$cant)
		WEnd
		;MsgBox(0,'','1')

		while not WinExists('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
			WinActivate('lusrmgr - [Usuarios y grupos locales (local)]')
			ControlSend('lusrmgr - [Usuarios y grupos locales (local)]','','SysTreeView321','{right}')
		WEnd
		;MsgBox(0,'','2')

		$cant=99
		if @OSVersion='WIN_7' then
			$cantwin=3
		ElseIf @OSVersion='WIN_10' then
			$cantwin=4
		Else
			MsgBox(0,'','Falla modificar lusrmgr')
		EndIf
		;MsgBox(0,'','asd')
		while WinExists('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]') And $cant<>$cantwin
			$cant=ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"GetItemCount")
 			;MsgBox(0,'',$cant)
		WEnd
		;MsgBox(0,'','A')


		;-- aca obtengo nro de item = a usuario actual -------------------------
		for $i=0 to $cant-1 step 1
			$j=ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"GetText", $i,0)
			if $j=@UserName then ExitLoop
		Next

	;	$usuarioactual = ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"GetText", $i,0)
	;	MsgBox(0,'',$usuarioactual)
	;	MsgBox(0,'',ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"GetText",0,0))
	;	MsgBox(0,'',ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"GetText",1,0))
	;	MsgBox(0,'',ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"GetText",2,0))
	;	MsgBox(0,'',ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"GetText",3,0))

		if @OSVersion='WIN_10' then $ventana='Propiedades de '& @UserName

		While not WinExists($ventana)
			WinActivate('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
			WinWaitActive('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
			ControlClick('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321')
			ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"Select", $i,0)



			Send('{altdown}{enter}{altup}')
			$timer=0
			while $timer<3 And not WinExists($ventana)
				;MsgBox(0,'','r')
				$timer=$timer+1
				Sleep(1000)
			WEnd
	;				MsgBox(0,'','asdasdasd')

		WEnd

		;	HASTA ACA VENTANA


		WHILE WinExists($ventana,'') and not ControlCommand($ventana,'La contraseña n&unca expira','Button3',"IsChecked", "")
			ControlCommand($ventana,'La contraseña n&unca expira','Button3',"Check", "")
			$salir=1
		WEnd
		WHILE WinExists($ventana,'') and ControlCommand($ventana,'La contraseña n&unca expira','Button3',"IsChecked", "")
			ControlClick($ventana,'Aceptar','Button6')
			$salir=1
		WEnd
;		MsgBox(0,'','F')

		WinWaitClose($ventana,'')
;MsgBox(0,'','g')

While not WinExists($ventana,'') And (WinExists('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]') or WinExists('lusrmgr - [Usuarios y grupos locales (local)]'))
			While WinExists('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
				WinClose('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
			WEnd
;MsgBox(0,'','h')

			While WinExists('lusrmgr - [Usuarios y grupos locales (local)]')
				WinClose('lusrmgr - [Usuarios y grupos locales (local)]')
			WEnd
		WEnd

;	MsgBox(0,'','ya sali')
WEnd


EndFunc