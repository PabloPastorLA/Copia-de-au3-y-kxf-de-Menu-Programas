#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Form1", 163, 158, 191, 121)
$Button1 = GUICtrlCreateButton("Button1", 56, 96, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		case $Button1
			boton()
	EndSwitch
WEnd


func boton()






Do
	$ret=BOTONES('Generacion Conectar','','G2','G3','G4','G5','G9','','','','')
until $ret<>0

MsgBox(0,'','el retorno es '&$ret)

Do
	$ret=BOTONES('Generacion Conectar','','G2','G3','G4','G5','G9','','','','')
until $ret<>0

MsgBox(0,'','el retorno es '&$ret)





EndFunc







Func BOTONES($titulo,$tx1,$tx2,$tx3,$tx4,$tx5,$tx6,$tx7,$tx8,$tx9,$tx10)
	Local $hGUI = GUICreate($titulo,340,200)
	Local $boton1  = GUICtrlCreateButton($tx1, 0	, 140, 60, 25)
	Local $boton2  = GUICtrlCreateButton($tx2, 70	, 140, 60, 25)
	Local $boton3  = GUICtrlCreateButton($tx3, 140	, 140, 60, 25)
	Local $boton4  = GUICtrlCreateButton($tx4, 210	, 140, 60, 25)
	Local $boton5  = GUICtrlCreateButton($tx5, 280	, 140, 60, 25)
	Local $boton6  = GUICtrlCreateButton($tx6, 0	, 170, 60, 25)
	Local $boton7  = GUICtrlCreateButton($tx7, 70	, 170, 60, 25)
	Local $boton8  = GUICtrlCreateButton($tx8, 140	, 170, 60, 25)
	Local $boton9  = GUICtrlCreateButton($tx9, 210	, 170, 60, 25)
	Local $boton10 = GUICtrlCreateButton($tx10, 280	, 170, 60, 25)

	GUISetState(@SW_SHOW, $hGUI)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $boton1
				if $tx1<>'' Then
					GUIDelete()
					Return 1
				EndIf
			Case $boton2
				if $tx2<>'' Then
					GUIDelete()
					Return 2
				EndIf
			Case $boton3
				if $tx3<>'' Then
					GUIDelete()
					Return 3
				EndIf
			Case $boton4
				if $tx4<>'' Then
					GUIDelete()
					Return 4
				EndIf
			Case $boton5
				if $tx5<>'' Then
					GUIDelete()
					Return 5
				EndIf
			Case $boton6
				if $tx6<>'' Then
					GUIDelete()
					Return 6
				EndIf
			Case $boton7
				if $tx7<>'' Then
					GUIDelete()
					Return 7
				EndIf
			Case $boton8
				if $tx8<>'' Then
					GUIDelete()
					Return 8
				EndIf
			Case $boton9
				if $tx9<>'' Then
					GUIDelete()
					Return 9
				EndIf
			Case $boton10
				if $tx10<>'' Then
					GUIDelete()
					Return 10
				EndIf

		EndSwitch
	WEnd

	; Delete the previous GUI and all controls.
	GUIDelete($hGUI)
EndFunc