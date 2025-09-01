#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=SilentInstallSwitch.kxf
$Form1_1 = GUICreate("Form1", 125, 94, 192, 124)
$Button1 = GUICtrlCreateButton("USSF", 24, 8, 75, 25)
$Button2 = GUICtrlCreateButton("SKF", 24, 32, 75, 25)
$Button3 = GUICtrlCreateButton("SIH", 24, 56, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			WinActivate('Paquete','Windows.old')
			Exit
		Case $Button1
			USSF()
		Case $Button2
			SKF()
		Case $Button3
			SIH()
	EndSwitch
WEnd



func USSF()
	ShellExecute('ussf.exe')
EndFunc

func SKF()
	ShellExecute('skf.exe')
EndFunc

func SIH()
	ShellExecute('sih.4.0.1.0.exe','','Silent Install Helper')
EndFunc


