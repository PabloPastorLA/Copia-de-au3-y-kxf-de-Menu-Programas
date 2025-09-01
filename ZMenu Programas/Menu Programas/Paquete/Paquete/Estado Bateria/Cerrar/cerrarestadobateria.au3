#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****






#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=g:\programas y tutoriales\estado bateria\cerrar\cerrarestadobateria.kxf
$Form1_1 = GUICreate("Cerrar", 117, 90, 192, 124)
$Cerrar = GUICtrlCreateButton("Cerrar", 24, 32, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Cerrar
			Cerrar()
	EndSwitch
WEnd

Func cerrar()

	While ProcessExists('Estado Bateria.exe')
		ProcessClose('Estado Bateria.exe')
	WEnd
	Exit
EndFunc
