#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Form1", 406, 221, 192, 124)
$Button1 = GUICtrlCreateButton("Button1", 96, 64, 75, 25)
$Button2 = GUICtrlCreateButton("Button2", 128, 128, 75, 25)
$Checkbox1 = GUICtrlCreateCheckbox("Checkbox1", 232, 72, 97, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
#include <File.au3>

$inicio=1
While 1
	if $inicio=1 then $inicio=Inicio()
	$nMsg = GUIGetMsg()

	Switch $nMsg

		Case $GUI_EVENT_CLOSE
			Exit
		case $Button1
;~ 			ToolTip('asd')

	EndSwitch
WEnd



func Inicio()

	escribirToolTip()



	return 0
EndFunc

Func escribirToolTip()
	$handle=FileOpen('HintBotones.txt')
	for $i=1 to 80 step 1
		$linea=FileReadLine($handle,$i)
		$lineapartida = StringSplit($linea,',')
		if ControlGetText('Menu en modo LOCAL','',$lineapartida[1])=$lineapartida[2] then GUICtrlSetTip($lineapartida[1],$lineapartida[3])
	Next
EndFunc



