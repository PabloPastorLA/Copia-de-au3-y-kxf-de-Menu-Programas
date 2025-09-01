FileWrite(@DesktopDir & "\HAY QUE VER LUSRMGR.txt",""&@CRLF)

if @OSVersion='WIN_7' then $ventana='Propiedades: '&@UserName
if @OSVersion='WIN_10' then $ventana='Propiedades de '&@UserName

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'VERIF lusrmgr',160,80,0,110)

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
;~ MsgBox(0,'','4')

$timer=0
$cant=0
while $timer<30 And $cant<>2
	$timer=$timer+1
	Sleep(100)
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
;~ MsgBox(0,'','asd')
while WinExists('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]') And $cant<>$cantwin
	$cant=ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"GetItemCount")
;~ 			MsgBox(0,'',$cant)
WEnd
;~ MsgBox(0,'','3')


;-- aca obtengo nro de item = a usuario actual -------------------------
for $i=0 to $cant-1 step 1
	$j=ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"GetText", $i,0)
	if $j=@UserName then ExitLoop
Next
;~ $usuarioactual = ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"GetText", $i,0)
;~ MsgBox(0,'',$usuarioactual)


ControlCommand('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"Check", "")
Opt('WinDetectHiddenText',1)
WinWait('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','usuarios de Usuarios')
Opt('WinDetectHiddenText',0)

ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"Select", $i,0)


;-------------------------------------------------

			if @OSVersion='WIN_7' then $ventana='Propiedades: '& @UserName
			if @OSVersion='WIN_10' then $ventana='Propiedades de '& @UserName


		While not WinExists($ventana)
			Send('{altdown}{enter}{altup}')

			$timer=0
			while $timer<3 And not WinExists($ventana)
				;MsgBox(0,'','r')
				$timer=$timer+1
				Sleep(1000)
			WEnd
		WEnd
















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

