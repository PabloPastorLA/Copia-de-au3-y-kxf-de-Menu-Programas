#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Inspector Botones Menu", 256, 168, 223, 158)
$Input1 = GUICtrlCreateInput("", 128, 40, 121, 21)
$Label1 = GUICtrlCreateLabel("Nombre de ventana detectado:", 16, 16, 152, 17)
$Input2 = GUICtrlCreateInput("", 128, 104, 121, 21)
$Label2 = GUICtrlCreateLabel("Ingrese texto a comparar:", 16, 80, 124, 17)
$Button1 = GUICtrlCreateButton("Buscar", 8, 136, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$unicavez=0

While 1
	if $unicavez=0 Then
		$unicavez=1
		unicavez()
	EndIf

	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			buscar()
;~ 		Case

	EndSwitch
WEnd

func buscar()
	$texto=ControlGetText($Form1,'',$Input2)
	if $texto='' then
		MsgBox(0,'','El texto a buscar no contiene ningun caracter.')
	Else
		buscar2($texto)
	EndIf

EndFunc

Func buscar2($texto)
;~ 	MsgBox(0,'','a esto no llego'&$texto)
	$ventana=ControlGetText($Form1,'',$Input1)
	$salir=0
	for $i=0 to 300 step 1
		if ControlGetText($ventana,'','Button'&$i)=$texto then
			MsgBox(0,'','Se encontró en Button'&$i&'. Sigo buscando...')
			$salir=1
		EndIf
	Next
	if $salir=0 then MsgBox(0,'Menu Inspector','Terminé de buscar.')
	if $salir=1 then
		MsgBox(0,'Menu Inspector','Terminé de buscar. Cerrando...')
		Exit
	EndIf

EndFunc

func unicavez()
	if WinExists('Menu en modo LOCAL') then
		ControlSetText($Form1,'',$Input1,'Menu en modo LOCAL')
	elseif WinExists('Menu en modo RED') then
		ControlSetText($Form1,'',$Input1,'Menu en modo RED')
	Else
		MsgBox(0,'Menu Inspector','No encontre ventana de Menu. Cerrando...')
		Exit
	EndIf
EndFunc

