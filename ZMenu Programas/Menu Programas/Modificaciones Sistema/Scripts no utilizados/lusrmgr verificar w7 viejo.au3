SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'VERIF lusrmgr',160,80,0,110)
FileWrite(@DesktopDir & "\HAY QUE VER LUSRMGR.txt",""&@CRLF)
ShellExecute('mmc',' lusrmgr.msc')

WinWait('lusrmgr - [Usuarios y grupos locales (local)]')
$timer=0
$cant=0
while $timer<3 And $cant<>2
	$timer=$timer+1
	Sleep(1000)
	$cant=ControlListView('lusrmgr - [Usuarios y grupos locales (local)]','','SysListView321',"GetItemCount") ;<> 4 And $1<7
WEnd

while not WinExists('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
	WinActivate('lusrmgr - [Usuarios y grupos locales (local)]')
	ControlSend('lusrmgr - [Usuarios y grupos locales (local)]','','SysTreeView321','{right}')
WEnd

$cant=99
while WinExists('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]') And $cant<>3
	$cant=ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"GetItemCount")
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

;	HASTA ACA VENTANA desde aca borro o no borro el txt

WHILE WinExists('Propiedades: Usuario','') and ControlCommand('Propiedades: Usuario','La contraseña n&unca expira','Button3',"IsChecked", "") and FileExists(@DesktopDir & "\HAY QUE VER LUSRMGR.txt")
	FileDelete(@DesktopDir & "\HAY QUE VER LUSRMGR.txt")
WEnd
		While WinExists('Propiedades: Usuario')
			WinClose('Propiedades: Usuario')
		WEnd
		While WinExists('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
			WinClose('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
		WEnd
		While WinExists('lusrmgr - [Usuarios y grupos locales (local)]')
			WinClose('lusrmgr - [Usuarios y grupos locales (local)]')
		WEnd
