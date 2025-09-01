guail()

func guail()
	$salir=0
	while not $salir
		SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'MODIF lusrmgr',160,80,0,110)

		While WinExists('Propiedades: Usuario')
			WinClose('Propiedades: Usuario')
		WEnd

		While WinExists('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
			WinClose('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
		WEnd

		While WinExists('lusrmgr - [Usuarios y grupos locales (local)]')
			WinClose('lusrmgr - [Usuarios y grupos locales (local)]')
		WEnd

		ShellExecute('mmc',' lusrmgr.msc')

		WinWait('lusrmgr - [Usuarios y grupos locales (local)]')
		$timer=0
		$cant=0
		while $timer<3 And $cant<>2
			$timer=$timer+1
			Sleep(1000)
			$cant=ControlListView('lusrmgr - [Usuarios y grupos locales (local)]','','SysListView321',"GetItemCount") ;<> 4 And $1<7
			;MsgBox(0,'',$cant)
		WEnd

		while not WinExists('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
			WinActivate('lusrmgr - [Usuarios y grupos locales (local)]')
			ControlSend('lusrmgr - [Usuarios y grupos locales (local)]','','SysTreeView321','{right}')
		WEnd

		$cant=99
		while WinExists('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]') And $cant<>3
			$cant=ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"GetItemCount")
			;MsgBox(0,'',$cant)
		WEnd


		While not ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"IsSelected",2)
			ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"Select",2)
		WEnd


		While not WinExists('Propiedades: Usuario','')
			ControlClick('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321')
			WinActivate('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
			WinWaitActive('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
			While not ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"IsSelected",2)
				ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"Select",2)
			WEnd
			Send('{altdown}{enter}{altup}')

			$timer=0
			while $timer<3 And not WinExists('Propiedades: Usuario','')
				$timer=$timer+1
				Sleep(1000)
			WEnd
		WEnd

	;	HASTA ACA VENTANA

		WHILE WinExists('Propiedades: Usuario','') and not ControlCommand('Propiedades: Usuario','La contraseña n&unca expira','Button3',"IsChecked", "")
			ControlCommand('Propiedades: Usuario','La contraseña n&unca expira','Button3',"Check", "")
			$salir=1
		WEnd

		WHILE WinExists('Propiedades: Usuario','') and ControlCommand('Propiedades: Usuario','La contraseña n&unca expira','Button3',"IsChecked", "")
			ControlClick('Propiedades: Usuario','Aceptar','Button6')
			$salir=1
		WEnd
		WinWaitClose('Propiedades: Usuario','')
		While not WinExists('Propiedades: Usuario','') And (WinExists('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]') or WinExists('lusrmgr - [Usuarios y grupos locales (local)]'))
			While WinExists('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
				WinClose('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
			WEnd

			While WinExists('lusrmgr - [Usuarios y grupos locales (local)]')
				WinClose('lusrmgr - [Usuarios y grupos locales (local)]')
			WEnd
		WEnd

;	MsgBox(0,'','ya sali')
	WEnd
EndFunc