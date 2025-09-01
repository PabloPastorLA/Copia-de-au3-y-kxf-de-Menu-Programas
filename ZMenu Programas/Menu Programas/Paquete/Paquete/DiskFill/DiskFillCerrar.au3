#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#RequireAdmin


#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("DiskFill", 180, 26, 192, 124)
$Button1 = GUICtrlCreateButton("Cerrar Todo", 45, 0, 90, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

WinMove($Form1,'',@DesktopWidth-183,(@DesktopHeight)/2-129)

While 1
	check()
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			cerrartodo('diskfill.exe')
			cerrartodo('DummyCMD.exe')
			cerrartodo('DiskFillOrdenarVentana.exe')
			Exit
	EndSwitch
WEnd

func check()
	if not ProcessExists('DummyCMD.exe') and not ProcessExists('Diskfill.exe') and not ProcessExists('DiskFillOrdenarVentana.exe') then exit
EndFunc

Func cerrartodo($proc)
	do
		ProcessClose($proc)
	until not ProcessExists($proc)
EndFunc
