#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=menuotroicono.ico
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Compile_Both=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#RequireAdmin
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ColorConstants.au3>

$xbot=163
$ybot=41
$xvent=244
$yvent=210

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("MenuNOReinicio", 154, 89, 200, 155)
$Button1 = GUICtrlCreateButton("Reinicio", 8, 8, 139, 33)
$Button2 = GUICtrlCreateButton("Ejecucion", 8, 48, 139, 33)
#EndRegion ### END Koda GUI section ###

WinMove('MenuNOReinicio','',628,459)
GUISetState(@SW_SHOW)

unicavez()

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			if 6=MsgBox(4,'Cerrar?','Está seguro de Cerrar?'&@CRLF&'Menu lo va a cerrar solo.') then Exit
		Case $Button1
			Reinicio()
		Case $Button2
			Ejecucion()
	EndSwitch
WEnd


func unicavez()
	textoReinicio()
	textoEjecucion()
EndFunc

func textoReinicio()
	if 		FileExists('MenuPausarReinicio') then
		GUICtrlSetData($Button1,"Habilitar Reinicio")
		GUICtrlSetBkColor($Button1,$COLOR_red)
		GUICtrlSetColor($Button1,$COLOR_white)
	EndIf
	if not  FileExists('MenuPausarReinicio') then
		GUICtrlSetData($Button1,"Pausar Reinicio")
		GUICtrlSetBkColor($Button1,$COLOR_green)
		GUICtrlSetColor($Button1,$COLOR_white)
	EndIf
EndFunc

func textoEjecucion()
	if 		FileExists('MenuPausarEjecucion') then
		GUICtrlSetData($Button2,"Habilitar ejecucion")
		GUICtrlSetBkColor($Button2,$COLOR_red)
		GUICtrlSetColor($Button2,$COLOR_white)
	EndIf
	if not  FileExists('MenuPausarEjecucion') then
		GUICtrlSetData($Button2,"Pausar ejecucion")
		GUICtrlSetBkColor($Button2,$COLOR_GREEN)
		GUICtrlSetColor($Button2,$COLOR_white)
	EndIf
EndFunc

func Reinicio()
	if FileExists('MenuPausarReinicio') Then
		FileDelete('MenuPausarReinicio')
	Else
		FileWrite('MenuPausarReinicio','')
	EndIf
	textoReinicio()
EndFunc

func Ejecucion()
	if FileExists('MenuPausarEjecucion') Then
		FileDelete('MenuPausarEjecucion')
	Else
		FileWrite('MenuPausarEjecucion','')
	EndIf
	textoEjecucion()
EndFunc




func SoloCerrar()
	ProcessClose('Menu.exe')
	ProcessClose('DontSleep.exe')
	ProcessClose('DontSleep_x64.exe')
	Exit
EndFunc

func PausarReinicio()
	FileWrite('MenuPausarReinicio','')
EndFunc

func HabilitarReinicio()
	Do
		FileDelete('MenuPausarReinicio')
	until not FileExists('MenuPausarReinicio')
EndFunc

func PausarEjecucionMenu()
	FileWrite('MenuPausarEjecucion','')
EndFunc

func HabilitarEjecucionMenu()
	Do
		FileDelete('MenuPausarEjecucion')
	until not FileExists('MenuPausarEjecucion')
EndFunc
