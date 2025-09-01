#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Limpiando Iconos',160,80,0,110)

;~ If FileExists("setup.exe") AND not FileExists (@ProgramFilesDir & "\Ares\Ares.exe") AND not FileExists (@ProgramFilesDir & " (x86)\Ares\Ares.exe")  Then
;~ 	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Ares"&@CRLF)

ShellExecute("IconCache Rebuilder.exe","")
WinWait('Icon Cache Rebuilder')
;MsgBox(0,'','')
Do
	Sleep(100)
until ControlCommand('Icon Cache Rebuilder','','WindowsForms10.BUTTON.app.0.378734a4','isvisible') or ControlCommand('Icon Cache Rebuilder','','WindowsForms10.BUTTON.app.0.33c0d9d4','isvisible')
if ControlCommand('Icon Cache Rebuilder','','WindowsForms10.BUTTON.app.0.378734a4','isvisible')=1 Then
	$boton='WindowsForms10.BUTTON.app.0.378734a4'
ElseIf ControlCommand('Icon Cache Rebuilder','','WindowsForms10.BUTTON.app.0.33c0d9d4','isvisible')=1 Then
	$boton='WindowsForms10.BUTTON.app.0.33c0d9d4'
Else
	Do
		MsgBox(0,'icon cache rebuilder','No Encontre boton')
	Until 0
EndIf


If ControlCommand('Icon Cache Rebuilder','',$boton,'isenabled')=0 Then
	for $i=5 to 1 step -1
		MsgBox(0,'Icon Cache','Boton grisado. Cerrando en '&$i&'s',1)
	Next


;	MsgBox(0,'Icon Cache','Boton grisado. Cerrando')
	WinClo()
	Exit
EndIf


;MsgBox(0,'','0.5')
;~ if ControlGetText('Icon Cache Rebuilder','',$boton)='Rebuild' and ControlCommand('Icon Cache Rebuilder','',$boton,'isenabled','') then
Opt('MouseClickDownDelay',100)
ControlClick('Icon Cache Rebuilder','',$boton,'left',1)

Opt('MouseClickDownDelay',10)

;MsgBox(0,'','1')
Do
	Sleep(300)
Until WinExists('IconCache Rebuilder','Computer must Restart to apply change') or WinExists('Icon Cache Rebuilder','Icon Cache could not be located')
;MsgBox(0,'','2')

Do
	ControlClick('IconCache Rebuilder','','Button1')
	Sleep(300)
Until not WinExists('IconCache Rebuilder')
;MsgBox(0,'','3')

WinClo()

func WinClo()
	Do
		WinClose('Icon Cache Rebuilder')
	Until not WinExists('Icon Cache Rebuilder')
EndFunc
