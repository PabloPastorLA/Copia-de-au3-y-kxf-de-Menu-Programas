#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=menuotroicono.ico
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#RequireAdmin
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Menu - Cancelar Lista", 244, 160, 210, 139)
$Button1 = GUICtrlCreateButton("Cancelar Lista", 40, 10, 163, 41)
$Button2 = GUICtrlCreateButton("Solo Cerrar", 40, 60, 163, 41)
$Button3 = GUICtrlCreateButton("Continuar Lista", 40, 110, 163, 41)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
sleep(10000)
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			CancelarLista()
		Case $Button2
			SoloCerrar()
		Case $Button3
			Exit
	EndSwitch
WEnd


func SoloCerrar()
	ProcessClose('Menu.exe')
	ProcessClose('DontSleep.exe')
	ProcessClose('DontSleep_x64.exe')
	Exit
EndFunc




func CancelarLista()
	ProcessClose('Menu.exe')
	$dir=@ScriptDir
	Do
		$dir=StringTrimRight($dir,1)
	until StringRight($dir,1)='\'


	for $i=1 to 99 step 1
		;MsgBox(0,'',$dir&'ListaInstalar.txt')
		if FileExists($dir&'ListaInstalar.txt') then FileMove($dir&'ListaInstalar.txt',$dir&'ListaInstalar - Cancelada '&$i&'.txt')
	Next
	ShellExecute($dir&'menu.exe','',$dir)
	Exit
EndFunc


