#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

if ProcessExists('firefox.exe') then Sleep(5000)
if ProcessExists('firefox.exe') then
	Do
		ProcessClose('firefox.exe')
	until Not ProcessExists('firefox.exe')
EndIf

ProcessWaitClose('firefox.exe')

ShellExecuteWait('firefox.EXE','"'&@ScriptDir&'\universal_bypass-13.15.2.1-an+fx.xpi"')
Clickear(498,203)
ShellExecuteWait('firefox.EXE','"'&@ScriptDir&'\ublock_origin-1.41.8-an+fx.xpi"')
Clickear(498,253)

FileDelete(@DesktopDir&'\ublock_origin-1.41.8-an+fx.xpi')
FileDelete(@DesktopDir&'\universal_bypass-13.15.2.1-an+fx.xpi')
Func Clickear($x,$y)
	Do
	until WinExists('Mozilla Firefox')
;	MsgBox(0,'','0',3)
	$win=''
	if WinExists('Mozilla Firefox') then $win=('Mozilla Firefox')
	Do
		WinSetState($win,'',@SW_MAXIMIZE)
		WinActivate($win)
		;MsgBox(0,'',WinGetState($win))
		Sleep(1000)
	until WinGetState($win)=47

;	MsgBox(0,'','1',3)


	MouseMove($x,$y,0)

;	MsgBox(0,'','2',3)

	;ESPERAR A QUE SE VALLA PANTALLA EN BLANCO
	SplashTextOn('','2222',100,100,0,0)
	Do
		Sleep(100)
	until PixelGetColor($x,$y)<>16382459 And PixelGetColor($x,$y)<>16777215

	;ESPERAR panbtalla cn boton
	SplashTextOn('','3333',100,100,0,0)
	do
		Sleep(1000)
	Until PixelGetColor($x,$y)=15724530 or PixelGetColor($x,$y)=14671845 or PixelGetColor($x,$y)=1381402 or PixelGetColor($x,$y)=9424882 or PixelGetColor($x,$y)=8831461

	;Cliquear bton hasta que se valla
	SplashTextOn('','4444',100,100,0,0)
	do
		MouseClick('Left',$x,$y,2)
		Sleep(1000)
	Until PixelGetColor($x,$y)<>15724530 and PixelGetColor($x,$y)<>14671845 and PixelGetColor($x,$y)<>1381402 and PixelGetColor($x,$y)<>9424882 and PixelGetColor($x,$y)<>8831461

	SplashTextOn('','5555',100,100,0,0)
	MouseMove(@DesktopWidth-200,200,0)
	MouseClick('Left',@DesktopWidth-200,200,2)

	MouseMove(@DesktopWidth-355,167,0)

	Do
		MouseClick('Left',@DesktopWidth-355,170,1,100)
		Sleep(1000)
	until PixelGetColor(@DesktopWidth-355,167)=151739;     MouseClick('Left',@DesktopWidth-355,$y-30,1,100)

	Do
		send('{altdown}{o}{altup}')
		Sleep(1000)
	until PixelGetColor(@DesktopWidth-355,167)<>151739;     MouseClick('Left',@DesktopWidth-355,$y-30,1,100)
	Sleep(500)
	Do
		WinClose($win)
		Sleep(1000)
	until not WinExists($win)

	SplashOff()

;MsgBox(0,'',PixelGetColor(@DesktopWidth-355,$y-30),5)

;151739 ok
;15724530 no

;~ MsgBox(0,'',PixelGetColor($x,$y),5)
;~ 	MsgBox(0,'',PixelGetColor($x,$y),5)
;~ 	MsgBox(0,'',PixelGetColor($x,$y),5)

;16777215 pantalla en blanco
;16382459 pantalla en GRIS
;15724530 ok
;14671845 ok
;1381402 ok
;9424882 ok
;8831461 ok

	;Exit
EndFunc
