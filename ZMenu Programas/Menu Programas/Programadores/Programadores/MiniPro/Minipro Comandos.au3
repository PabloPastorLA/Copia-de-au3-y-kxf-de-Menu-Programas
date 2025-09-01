#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>







#Region ### START Koda GUI section ### Form=Minipro Comandos.kxf
$Form1_1 = GUICreate("MiniPro Comandos", 205, 132, 192, 124)
$Button1 = GUICtrlCreateButton("Leer", 24, 32, 75, 25)
$Button2 = GUICtrlCreateButton("Detectar SPI 25", 24, 8, 155, 25)
$Button3 = GUICtrlCreateButton("Programar", 104, 56, 75, 25)
$Button4 = GUICtrlCreateButton("Guardar Buffer", 24, 56, 75, 25)
$Button5 = GUICtrlCreateButton("Borrar y Blank", 24, 88, 75, 25)
$Button6 = GUICtrlCreateButton("Abrir", 104, 32, 75, 25)
$Button7 = GUICtrlCreateButton("Cerrar Todo", 104, 88, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Unicavez()

While 1
	loop()
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			Leer()
		Case $Button2
			Detectar()
		Case $Button3
			Programar()
		Case $Button4
			Guardar()
		Case $Button5
			BorraryBlank()
		Case $Button6
			Abrir()
		Case $Button7
			CerrarTodo()
	EndSwitch
WEnd





;detectar()
;leer()
;guardar()
;Programar()
;cerrarventanas()
;MsgBox(0,'',ControlCommand('Chip Program','Program','Button1',"IsEnabled", ""))

func Unicavez()

	global $cerrar=0
	global $win='MiniPro v6'
	global $pos=WinGetPos($Form1_1)

	WinWait($win,'',6)
	if not WinExists($win) then
		MsgBox(0,'MiniproComandos','No encontre MiniPro. Cerrando...')
		if not WinExists($win) then
			Exit
		Else
			MsgBox(0,'MiniproComandos','Ahora si encontre MiniPro. Continuo funcionando')
		EndIf
	EndIf


	global $posMiniPro=WinGetPos($win)


	WinMove($win,'',0,$posMiniPro[1])
	WinActivate($win)
	WinWaitActive($win)
	WinMove($Form1_1,'',$posMiniPro[2],$posMiniPro[1]);+$posMiniPro[1]-300,'','',10)
	global $cambioventana=0
EndFunc

func loop()
	$cerrar=$cerrar + 1
	if $cerrar>=20 Then
		acomodarventana()
		$cerrar=0
		if not ProcessExists('MiniPro.exe') then Exit
	EndIf


EndFunc

func acomodarventana()
	;Sleep(1000)
	;MsgBox(0,'',WinGetState($win),2)
	;MsgBox(0,'',WinGetState($Form1_1),2)
;	MsgBox(0,'',WinGetState($Form1_1),3)
;	if WinActive($win) and (WinGetState($Form1_1)<>15 and WinGetState($Form1_1)<>7) then WinActivate($Form1_1)
;	if WinActive($win) and (WinGetState($Form1_1)<>15) then WinActivate($Form1_1)
	;WinSetState($Form1_1,'',WinGetState($win))
;ok	if WinGetState($Form1_1)=15 and (WinGetState($win)<>15 and WinGetState($win)<>7) then WinSetState($win,'',15)
if WinGetState($Form1_1)=15 then
	;WinActivate($win)
Else
if WinGetState($win)=7 then $cambioventana=1
	if WinGetState($win)=15 and $cambioventana=1 then
		$cambioventana=0
		WinActivate($Form1_1)
		;WinActivate($win)

	EndIf
EndIf

;if WinGetState($Form1_1)=15 and (WinGetState($win)<>15 and WinGetState($win)<>7) then WinSetState($win,'',7)

	$posMiniPro=WinGetPos($win)

	WinMove($Form1_1,'',$posMiniPro[0]+$posMiniPro[2],$posMiniPro[1]);+$posMiniPro[1]-300,'','',10)
	$pos=WinGetPos($Form1_1)
EndFunc

func cerrarventanas()
	WinClose('Chip Read')
	WinClose('Chip Program')
	WinClose('Chip Blank')
	WinClose('Chip Erase')
	WinClose('Auto Select 25 Flash')
	WinClose('Mini_Programmer','File has been saved to')
	WinClose('Abrir','All_Files(*.*)')
EndFunc

func CerrarTodo()
	Do
		cerrarventanas()
		;WinClose($win)
		processclose('MiniPro.exe')
	until not ProcessExists('MiniPro.exe')
	Exit
EndFunc

func BorraryBlank()
	splash('Borrar y Blank')
	do
		WinActivate($win)
	until WinActive($win)
	cerrarventanas()

	send('{altdown}{d}{e}{altup}')
	WinWait('Chip Erase')

	Do
		ControlClick('Chip Erase','Erase','Button1')
	until ControlCommand('Chip Erase','Erase','Button1',"IsEnabled", "")=0
	Do
		Sleep(300)
	until ControlCommand('Chip Erase','Erase','Button1',"IsEnabled", "")=1

	cerrarventanas()

	send('{altdown}{d}{b}{altup}')
	WinWait('Chip Blank')

	Do
		ControlClick('Chip Blank','Blank','Button1')
	until ControlCommand('Chip Blank','Blank','Button1',"IsEnabled", "")=0
	Do
		Sleep(300)
	until ControlCommand('Chip Blank','Blank','Button1',"IsEnabled", "")=1

	SplashOff()
EndFunc

func Programar()
	if WinExists('Auto Select 25 Flash') then
		MsgBox(0,'MiniproComandos','Falta elegir IC y cargar BUFFER antes de programar.')
		Return
	EndIf

	splash('Programando')
	do
		WinActivate($win)
	until WinActive($win)
	cerrarventanas()

	send('{altdown}{d}{p}{altup}')

	WinWait('Chip Program')
	Do
		ControlClick('Chip Program','Program','Button1')
	until ControlCommand('Chip Program','Program','Button1',"IsEnabled", "")=0
	Do
		Sleep(300)
	until ControlCommand('Chip Program','Program','Button1',"IsEnabled", "")=1
	splashoff()
EndFunc

func guardar()
	splash('Guardando')
	do
		WinActivate($win)
	until WinActive($win)

;~ 	while WinExists('Chip Read')
;~ 		controlclick('Auto Select 25 Flash','Select','Button1')
;~ 	WEnd

	cerrarventanas()

	send('{ctrldown}{s}{ctrlup}')

	SplashOff()

EndFunc

func Abrir()
;~ 	if WinExists('Auto Select 25 Flash') and then
;~ 		MsgBox(0,'MiniproComandos','Falta elegir IC antes de abrir archivo.')
;~ 		Return
;~ 	EndIf
	if ControlGetText('Auto Select 25 Flash','','ComboBox1')='' then Return

	splash('Abriendo')

	while WinExists('Auto Select 25 Flash')
		controlclick('Auto Select 25 Flash','Select','Button1')
	WEnd

	do
		WinActivate($win)
	until WinActive($win)

	cerrarventanas()

	send('{ctrldown}{o}{ctrlup}')

	SplashOff()

EndFunc

func leer()
	if ControlGetText('Auto Select 25 Flash','','ComboBox1')='' then Return
	splash('Leyendo')
	do
		WinActivate($win)
	until WinActive($win)

;~ MsgBox(0,'',ControlGetText('Auto Select 25 Flash','','ComboBox1'))
	while WinExists('Auto Select 25 Flash')
		controlclick('Auto Select 25 Flash','Select','Button1')
	WEnd

	cerrarventanas()

	send('{altdown}{d}{r}{altup}')

 	ControlClick('Chip Read','Read','Button1')


	WinWait('Chip Read')
	Do
		ControlClick('Chip Read','Read','Button1')
	until ControlCommand('Chip Read','Read','Button1',"IsEnabled", "")=0
	Do
		Sleep(300)
	until ControlCommand('Chip Read','Read','Button1',"IsEnabled", "")=1
splashoff()

EndFunc

func splash($texto)
	SplashTextOn('',$texto,$pos[2],40,$pos[0],$pos[1]+$pos[3],3)
EndFunc


func detectar()
	if WinExists('CODE_Memory save as: ') then
		MsgBox(0,'MiniproComandos','Falta guardar')
		Return
	EndIf

	splash('Detectando')
	do
		WinActivate($win)
	until WinActive($win)

	cerrarventanas()

	send('{altdown}{s}{2}{altup}')

	do
		WinActivate('Auto Select 25 Flash')
	until WinActive('Auto Select 25 Flash')
	ControlClick('Auto Select 25 Flash','','Button4')
	SplashOff()
EndFunc

