SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'VERIF lusrmgr',160,80,0,110)
FileWrite(@DesktopDir & "\HAY QUE VER LUSRMGR.txt",""&@CRLF)

if @OSVersion='WIN_7' then $ventana='Propiedades: Usuario'
if @OSVersion='WIN_10' then $ventana='Propiedades de Usuario'


ShellExecute('mmc',' lusrmgr.msc')

WinWait('lusrmgr - [Usuarios y grupos locales (local)]')
$timer=0
$cant=0
while $timer<3 And $cant<>2
	$timer=$timer+1
	Sleep(1000)
	$cant=ControlListView('lusrmgr - [Usuarios y grupos locales (local)]','','SysListView321',"GetItemCount") ;<> 4 And $1<7
WEnd
;MsgBox(0,'','1')
while not WinExists('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
	WinActivate('lusrmgr - [Usuarios y grupos locales (local)]')
	ControlSend('lusrmgr - [Usuarios y grupos locales (local)]','','SysTreeView321','{right}')
WEnd
;MsgBox(0,'','2')
$cant=99
if @OSVersion='WIN_7' then $cantwin=3
if @OSVersion='WIN_10' then $cantwin=4
while WinExists('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]') And $cant<>$cantwin
	$cant=ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"GetItemCount")
WEnd
;MsgBox(0,'','3')
if @OSVersion='WIN_7' then $cantwin2=2
if @OSVersion='WIN_10' then $cantwin2=3
While not ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"IsSelected",$cantwin2)
	ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"Select",$cantwin2)
WEnd
;MsgBox(0,'','4')
if @OSVersion='WIN_7' then $cantwin2=2
if @OSVersion='WIN_10' then $cantwin2=3

While not WinExists($ventana,'')
	ControlClick('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321')
	WinActivate('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
	WinWaitActive('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
	While not ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"IsSelected",$cantwin2)
		ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"Select",$cantwin2)
	WEnd
	Send('{altdown}{enter}{altup}')
;MsgBox(0,'','5')
	$timer=0
	while $timer<3 And not WinExists($ventana,'')
		$timer=$timer+1
		Sleep(1000)
	WEnd
WEnd
;MsgBox(0,'','6')

;	HASTA ACA VENTANA desde aca borro o no borro el txt

$salida=0
While not ControlCommand($ventana,'La contraseña n&unca expira','Button3',"IsChecked", "") and $salida<11
	$salida=$salida+1
	Sleep(100)
WEnd

WHILE WinExists($ventana,'') and ControlCommand($ventana,'La contraseña n&unca expira','Button3',"IsChecked", "") and FileExists(@DesktopDir & "\HAY QUE VER LUSRMGR.txt")
	FileDelete(@DesktopDir & "\HAY QUE VER LUSRMGR.txt")
WEnd
		While WinExists($ventana)
			WinClose($ventana)
		WEnd
		While WinExists('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
			WinClose('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
		WEnd
		While WinExists('lusrmgr - [Usuarios y grupos locales (local)]')
			WinClose('lusrmgr - [Usuarios y grupos locales (local)]')
		WEnd
