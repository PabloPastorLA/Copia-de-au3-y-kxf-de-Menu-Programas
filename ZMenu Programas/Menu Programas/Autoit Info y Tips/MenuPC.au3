#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
;,$ES_NUMBER)

ventanita()
func ventanita()
#Region ### START Koda GUI section ### Form=g:\programas y tutoriales\MenuPc.kxf
$Form1_1 = GUICreate("Cliente", 152, 91, 192, 124)
Global $NroPC = GUICtrlCreateInput("0", 85, 30, 21, 21,$ES_NUMBER)
GUICtrlSetLimit(-1, 1)
$Label1 = GUICtrlCreateLabel("Ingrese Numero de PC", 20, 10, 111, 17)
$BotonAceptar = GUICtrlCreateButton("Aceptar", 30, 60, 45, 25)
$BotonSalir = GUICtrlCreateButton("Salir", 80, 60, 45, 25)
$Label2 = GUICtrlCreateLabel("PC00", 45, 34, 40, 20)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
EndFunc


;~ loop($BotonSalir*,$BotonAceptar)
func loop(ByRef $BotonSalir , ByRef $BotonAceptar)
	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				Exit
			Case $BotonSalir
				Exit
			Case $BotonAceptar
				if Guictrlread($NroPC)=0 then
;~ 					loop()
				Else
					NroPc()
					ExitLoop
				EndIf
		EndSwitch
	WEnd
EndFunc

func NroPc()
	MsgBox(0,'',Guictrlread($NroPC))

EndFunc

MsgBox(0,'','sali todo '& Guictrlread($NroPC))