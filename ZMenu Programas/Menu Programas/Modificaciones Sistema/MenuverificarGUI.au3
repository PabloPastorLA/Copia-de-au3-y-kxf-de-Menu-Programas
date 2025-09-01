#include <Array.au3>
#include <File.au3>
#include <WinAPIShellEx.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

#RequireAdmin


Global $x,$y
Global $rta
Global $rta2
global $ProcessID

$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)
global $auto=0
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <MsgBoxConstants.au3>
#include <ColorConstants.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=MenuverificarGUI.kxf
$MenuVerificarGUI = GUICreate("MenuVerificar GUI", 133, 472, 192, 124)
$Button1 = GUICtrlCreateButton("Sonido", 24, 40, 75, 25)
$Button2 = GUICtrlCreateButton("Mal Instalado", 24, 64, 75, 25)
$Button3 = GUICtrlCreateButton("Backup", 24, 88, 75, 25)
$Button4 = GUICtrlCreateButton("Prog Tareas", 24, 112, 75, 25)
$Button5 = GUICtrlCreateButton("Nod Exclu", 24, 136, 75, 25)
$Button6 = GUICtrlCreateButton("Pass Expira", 24, 160, 75, 25)
$Button7 = GUICtrlCreateButton("Drivers", 24, 184, 75, 25)
$Button8 = GUICtrlCreateButton("Rest Sistema", 24, 208, 75, 25)
$Button9 = GUICtrlCreateButton("Win Activado", 24, 232, 75, 25)
$Button10 = GUICtrlCreateButton("Win Update", 24, 256, 75, 25)
$Button11 = GUICtrlCreateButton("MsConfig", 24, 280, 75, 25)
$Button12 = GUICtrlCreateButton("Office", 24, 304, 75, 25)
$Button13 = GUICtrlCreateButton("Pavada Esc", 24, 328, 75, 25)
$Button14 = GUICtrlCreateButton("Pinned Taskb", 24, 352, 75, 25)
$Button15 = GUICtrlCreateButton("UBlock", 24, 376, 75, 25)
$Button16 = GUICtrlCreateButton("Internet", 24, 400, 75, 25)
$Button17 = GUICtrlCreateButton("AUTO", 24, 8, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

UNICAVEZ()

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button17
			BotonAUTO()
		Case $Button1
			sonido()
		Case $Button2
			MalInstalado()
		Case $Button3
			backup()
		Case $Button4
			togglecolor('B4')
		Case $Button5
			togglecolor('B5')
		Case $Button6
			togglecolor('B6')
		Case $Button7
			togglecolor('B7')
		Case $Button8
			togglecolor('B8')
		Case $Button9
			togglecolor('B9')
		Case $Button10
			togglecolor('B10')
		Case $Button11
			togglecolor('B11')
		Case $Button12
			togglecolor('B12')
		Case $Button13
			togglecolor('B13')
		Case $Button14
			togglecolor('B14')
		Case $Button15
			togglecolor('B15')
		Case $Button16
			togglecolor('B16')

	EndSwitch
WEnd

func UNICAVEZ()
	$pos=WinGetPos($MenuVerificarGUI,'')
	WinMove($MenuVerificarGUI,'',@DesktopWidth-$pos[2],(@DesktopHeight-$pos[3])/2)
	for $i=1 to 20 step 1	;Programas
		Assign("B"&$i, "R",2)
		GUICtrlSetBkColor(Eval('Button'&$i), $COLOR_RED)
	Next
EndFunc




func BotonAUTO()
	if 6=MsgBox(4,'Modo AUTO','Probar todo en automatico?') then AUTO()
EndFunc

func auto()
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Menu Verif',160,80,0,220)
	WinMinimizeAll()
	Sleep(500)
	WinSetState($MenuVerificarGUI,'',@SW_RESTORE)
	$auto=1
	; LANZAR TODO
	$pregbackup=backup()
	$pregmalins=MalInstalado()
	sonido()




	;PREGUNTAR TODO
	if $pregmalins Then preguntaMalInstalado()
	preguntasonido()



	;DESPUES DE PREGUNTAR TODO
	WinSetState($MenuVerificarGUI,'',@SW_RESTORE)
	$auto=0
	SplashOff()
EndFunc

func sonido()
	SoundPlay('Apagado de Windows XP.wav', 1)
	if $auto=0 then preguntasonido()
;~ 	preguntasonido()
EndFunc

func preguntasonido()
	movermouse(0,80)
	$textoB201='Si'
	$textoB202='No'
	$textoB203='Reproducir'
	$textoventana2='El sonido funciona bien?'
	ventana2($textoventana2,$textoB201,$textoB202,$textoB203)

	if $rta2=1 Then
		toggleverde('B1')
	Elseif $rta2=2 Then
		togglerojo('B1')
	ElseIf $rta2=3 Then
		sonido()
		if $auto=1 then preguntasonido()
	EndIf

EndFunc

func MalInstalado()
	Global $pregmalins=0

	If FileExists(@DesktopDir & "\Mal Instalado.txt") then
		$ProcessID=ShellExecute(@DesktopDir & "\Mal Instalado.txt")
		while not WinExists('Mal Instalado: Bloc de notas') and not WinExists('Mal Instalado.txt: Bloc de notas')
			Sleep(100)
		WEnd
		if WinExists('Mal Instalado: Bloc de notas') Then WinActivate('Mal Instalado: Bloc de notas')
		if WinExists('Mal Instalado.txt: Bloc de notas') then WinActivate('Mal Instalado.txt: Bloc de notas')

		if $auto=0 then preguntaMalInstalado()
	ElseIf $auto=1 and not FileExists(@DesktopDir & "\Mal Instalado.txt") then
		toggleverde('B2')
		Return 1
	ElseIf $auto=0 and not FileExists(@DesktopDir & "\Mal Instalado.txt") then
		toggleverde('B2')
		movermouse(45,47)
		MsgBox(0,'','No existe Mal Instalado.txt')

	EndIf

EndFunc

func preguntaMalInstalado()

	movermouse(0,10)
	$textoB201='Si'
	$textoB202='No'
	$textoB203=''
	$textoventana2='Desea borrar el archivo Mal "Instalado.txt"?'
	GLOBAL $retorno=ventana2($textoventana2,$textoB201,$textoB202,$textoB203)


	if $rta2=1 Then
		ProcessClose($ProcessID)
		borrarconwhile(@DesktopDir&'\Mal Instalado.txt')

		toggleverde('B2')
	Elseif $rta2=2 Then
		togglerojo('B2')
	ElseIf $rta2=3 Then
	EndIf
EndFunc

func BackUp()

	if FileExists(@HomeDrive&'\Bup') and DirGetSize(@HomeDrive&'\Bup')<>0 and FileExists(@DesktopDir&'\Backup.lnk') Then
		if $auto=0 then PreguntarBackUp(0)
		return 0
	Elseif FileExists(@HomeDrive&'\Bup') and DirGetSize(@HomeDrive&'\Bup')<>0 and not FileExists(@DesktopDir&'\Backup.lnk') Then
		if $auto=0 then PreguntarBackUp(1)
		return 1
	Else
		if $auto=0 then PreguntarBackUp(2)
		return 2
	EndIf
EndFunc

func PreguntarBackUp($pregbackup)
	if $pregbackup=0 Then
		toggleverde('B3')

	Elseif $pregbackup=1 Then
		movermouse(40,50)
		if MsgBox(4,'Backup','Encontré carpeta backup pero no acceso directo. Crear?')=6 then
			FileCreateShortcut(@HomeDrive&'\Bup',@DesktopDir&'\Backup.lnk',@HomeDrive&'\Bup')
			toggleverde('B3')
		EndIf
	Else
		movermouse(80,50)



		if 6=MsgBox(4,'Backup','No encontré backup. Esta PC lleva?') Then
			DirCreate(@HomeDrive&'\Bup')
			ShellExecute(@HomeDrive&'\Bup')
			ShellExecute(@HomeDrive)
			ShellExecute('"cleanmgr"')
			MsgBox(0,'Backup','Cuando termine de ordenar presione OK')
			BackUp()
		Else
			toggleverde('B3')
		EndIf
	EndIf
EndFunc



;~ ;--------------------------------------------------------------------------------------------------------

;~ ;FUNCIONES AUXILIARES
func borrarconwhile($rutacompleta)
	while FileExists($rutacompleta)
		FileDelete($rutacompleta)
	WEnd
EndFunc

func movermouse($x,$y)
	MouseMove(@DesktopWidth/2+$x,@DesktopHeight/2+$y,0)
EndFunc

;~ func ventana($textoventana,$textoB101,$textoB102,$textoB103)

;~ 	#Region ### START Koda GUI section ### Form=
;~ 	$Ventana = GUICreate("Pregunta", 150, 180, 202, 141)
;~ 	$Button101 = GUICtrlCreateButton($textoB101, 32, 64, 75, 25)
;~ 	$Button102 = GUICtrlCreateButton($textoB102, 32, 96, 75, 25)
;~ 	$Button103 = GUICtrlCreateButton($textoB103, 32, 128, 75, 25)
;~ 	$Label1 = GUICtrlCreateLabel($textoventana, 24, 16, 95, 17)
;~ 	WinMove($Ventana,'',(@DesktopWidth-150)/2,(@DesktopHeight-180)/2)
;~ 	GUISetState(@SW_SHOW)
;~ 	#EndRegion ### END Koda GUI section ###

;~ 	While 1
;~ 		$nMsg = GUIGetMsg(1)
;~ 		Switch $nMsg[0]
;~ 			Case $GUI_EVENT_CLOSE
;~ 				Switch $nMsg[1]
;~ 					case $Ventana
;~ 						GUISetState(@SW_HIDE,$Ventana)
;~ 						ExitLoop

;~ 					Case $MenuVerificarGUI
;~ 						Exit
;~ 				EndSwitch
;~  			Case $Button101
;~  				toggleverde('B1')
;~ 				GUISetState(@SW_HIDE,$Ventana)
;~ 				ExitLoop
;~  			Case $Button102
;~ 				togglerojo('B1')
;~ 				GUISetState(@SW_HIDE,$Ventana)
;~ 				ExitLoop
;~  			Case $Button103
;~ 				SoundPlay('Apagado de Windows XP.wav', 1)

;~ 		EndSwitch
;~ 	WEnd
;~ EndFunc


func ventana2($textoventana2,$textoB201,$textoB202,$textoB203)

	#Region ### START Koda GUI section ### Form=
	global $Ventana2 = GUICreate("Pregunta", 150, 180, 202, 141)
	$Button201 = GUICtrlCreateButton($textoB201, 32, 64, 75, 25)
	$Button202 = GUICtrlCreateButton($textoB202, 32, 96, 75, 25)
	$Button203 = GUICtrlCreateButton($textoB203, 32, 128, 75, 25)
	$Label2 = GUICtrlCreateLabel($textoventana2, 24, 16, 95, 17)
	WinMove($Ventana2,'',(@DesktopWidth-150)/2,(@DesktopHeight-180)/2)
	GUISetState(@SW_SHOW)
	#EndRegion ### END Koda GUI section ###

	While 1
		$nMsg = GUIGetMsg(1)
		Switch $nMsg[0]
			Case $GUI_EVENT_CLOSE
				Switch $nMsg[1]
					case $Ventana2
						$rta2=0
						GUISetState(@SW_HIDE,$Ventana2)
						ExitLoop
					Case $MenuVerificarGUI
						Exit
				EndSwitch
 			Case $Button201
				$rta2=1
				GUISetState(@SW_HIDE,$Ventana2)
				ExitLoop
 			Case $Button202
				$rta2=2
				GUISetState(@SW_HIDE,$Ventana2)
				ExitLoop
 			Case $Button203
				$rta2=3
				GUISetState(@SW_HIDE,$Ventana2)
				ExitLoop
		EndSwitch
	WEnd
EndFunc


Func togglecolor($Bx)
;~ 	Switch Eval($Bx)
;~ 		Case "R"
;~ 			GUICtrlSetBkColor(Eval('Button' & StringTrimLeft($Bx,1)), $COLOR_GREEN)
;~ 			Assign($Bx, "G",2)
;~ 		Case "G"
;~ 			GUICtrlSetBkColor(Eval('Button' & StringTrimLeft($Bx,1)), $COLOR_RED)
;~ 			Assign($Bx, "R",2)
;~ 		Case Else
;~ 			MsgBox(0,'','mmm')
;~ 	EndSwitch
EndFunc

Func toggleverde($Bx)
	GUICtrlSetBkColor(Eval('Button' & StringTrimLeft($Bx,1)), $COLOR_GREEN)
	Assign($Bx, "G",2)
EndFunc

func togglerojo($Bx)
	GUICtrlSetBkColor(Eval('Button' & StringTrimLeft($Bx,1)), $COLOR_RED)
	Assign($Bx, "R",2)
EndFunc