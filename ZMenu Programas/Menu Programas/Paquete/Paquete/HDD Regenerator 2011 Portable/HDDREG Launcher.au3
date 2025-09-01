#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****



Opt('WinTitleMatchMode',3)
if WinExists('HDD Regenerator 2011','') then
	Opt('WinTitleMatchMode',1)

	MsgBox(0,'HDDReg','No Se permiten 2 instancias. Cerrando')
	Exit
EndIf
Opt('WinTitleMatchMode',1)


SplashTextOn('HDDReg','Cargando, espere',200,100,@DesktopWidth/2-100,@DesktopHeight/2-50,32)

ShellExecuteWait('disable_online.cmd','','','',@SW_HIDE)
ShellExecute('HDD Regenerator.exe')
ProcessWait('HDD Regenerator.exe')
ShellExecute('HDD Regenerator.exe')
Do
until WinGetState('HDD Regenerator 2011','')=15
controlclick('HDD Regenerator 2011','','TPanel3')
ShellExecute('HDDReg Monitor.exe')
$salir=0
Do
	$salir=$salir+1
	if WinExists("Warning",'&No') then
		WinClose("Warning",'&No')
		$salir=1000
	EndIf

	Sleep(100)
until (not ProcessExists('HDD Regenerator.exe') ) or $salir>= 200




;~
;~ 	>>>> Window <<<<
;~ Title:	Warning
;~ Class:	#32770
;~ Position:	558, 259
;~ Size:	366, 234
;~ Style:	0x96C80284
;~ ExStyle:	0x00010101
;~ Handle:	0x00000000000B0460

