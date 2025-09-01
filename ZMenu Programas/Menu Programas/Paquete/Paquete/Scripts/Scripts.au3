#include <Misc.au3>

Scripts()


func Scripts()
	#include <ButtonConstants.au3>
	#include <GUIConstantsEx.au3>
	#include <WindowsConstants.au3>
	#Region ### START Koda GUI section ### Form=
	$ApagarReiniciar = GUICreate("Scripts", 126, 152, 202, 141)
	$Button101 = GUICtrlCreateButton("Comun", 24, 16, 75, 25)
	$Button102 = GUICtrlCreateButton("ElAmigos", 24, 48, 75, 25)
	$Button103 = GUICtrlCreateButton("MasterEga", 24, 80, 75, 25)
	$Button104 = GUICtrlCreateButton("Desinstalar", 24, 112, 75, 25)
	GUISetState(@SW_SHOW)
	#EndRegion ### END Koda GUI section ###

	While 1
		$nMsg = GUIGetMsg(1)
		Switch $nMsg[0]
			Case $GUI_EVENT_CLOSE
				Switch $nMsg[1]
					case $ApagarReiniciar
						GUISetState(@SW_HIDE,$ApagarReiniciar)
						ExitLoop

;~ 					Case $Paquete
;~ 						Exit
				EndSwitch
 			Case $Button101
				_ClipPutFile(FileGetLongName('Comun.au3',1))
				MsgBox(0,'Script Comun','Copiado al portapapeles',1)
 			Case $Button102
				_ClipPutFile(FileGetLongName('ElAmigos.au3',1))
				MsgBox(0,'Script Elamigos','Copiado al portapapeles',1)
 			Case $Button103
				_ClipPutFile(FileGetLongName('MasterEga.au3',1))
				MsgBox(0,'Script MasterEga','Copiado al portapapeles',1)
 			Case $Button104
				_ClipPutFile(FileGetLongName('Desinstalar.au3',1))
				MsgBox(0,'Script Desinstalar','Copiado al portapapeles',1)
		EndSwitch
	WEnd
EndFunc

