#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Icon2.ico
#AutoIt3Wrapper_Compression=0
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
MsgBox(0,'','Enchufar EasyCAP')
LOCAL $nro=9999
Do
	if $nro=9999 then
		$Nro=InputBox('NRO de VHS','Ingrese NRO de VHS','nnn')
	Else
		$Nro=InputBox('NRO de VHS','Reintente (Ingrese NRO de VHS)','nnn')
	EndIf
	if $nro='' Then Exit
until $NRO>=1 AND $NRO<=999 ;and StringLen($nro)=3
If StringLen($nro)=1 Then $nro=0&$nro
If StringLen($nro)=2 Then $nro=0&$nro

SplashTextOn('','poner play a la video',500,200)
#include <GuiComboBox.au3>
if not WinExists('AVS Video Recorder') then ShellExecute('C:\Program Files (x86)\AVS4YOU\AVSVideoRecorder\AVSVideoRecorder.exe')
SplashTextOn('','poner play a la video',500,200,@DesktopWidth/2,100)
WinWait('AVS Video Recorder (AV In - OEM Device)','Iniciar captura')
WinActivate('AVS Video Recorder')
SplashTextOn('','poner play a la video',500,200,@DesktopWidth/2,600)

if ControlCommand('AVS Video Recorder','','TspSkinPageControl1',"CurrentTab", "")=1 then 	ControlCommand('AVS Video Recorder','','TspSkinPageControl1',"TabRight", "")
;~ while ControlCommand('AVS Video Recorder','','TspSkinPageControl1',"CurrentTab", "")<>2
;~ 	ControlCommand('AVS Video Recorder','','TspSkinPageControl1',"TabRight", "")
;~ WEnd
WinWait('AVS Video Recorder','Detener captura automáticamente')
SplashOff()
	ControlCommand('AVS Video Recorder','','TspSkinCheckRadioBox6','check','')

	ControlClick('AVS Video Recorder','','TspSkinCheckRadioBox5')
	ControlClick('AVS Video Recorder','','TspSkinCheckRadioBox5')
	ControlClick('AVS Video Recorder','','TspSkinCheckRadioBox5')


;~ MsgBox(0,'',ControlGetText('AVS Video Recorder','','TspSkinTimeEdit1'))
ControlsetText('AVS Video Recorder','','TspSkinTimeEdit1','03:00:00')
;~ MsgBox(0,'',ControlGetText('AVS Video Recorder','','TspSkinTimeEdit1'))
;~ exit








while ControlCommand('AVS Video Recorder','','TspSkinPageControl1',"CurrentTab", "")<>3
	ControlCommand('AVS Video Recorder','','TspSkinPageControl1',"TabRight", "")
WEnd

$text=ControlGetText('AVS Video Recorder','','TspSkinComboBox8')&@CRLF
$text=$text&ControlGetText('AVS Video Recorder','','TspSkinComboBox7')&@CRLF
$text=$text&ControlGetText('AVS Video Recorder','','TspSkinComboBox3')&@CRLF

;video compuesto
Do
;~ 	ControlClick('AVS Video Recorder','','TspSkinComboBox8')
	ControlSend('AVS Video Recorder','','TspSkinComboBox8','{down}')
;~ 	Sleep(100)
until ControlGetText('AVS Video Recorder','','TspSkinComboBox8')='Video Composite'

pal()

if MsgBox(4,'','Cambiar a NTSC?')=6 then
	ntsc()
	if MsgBox(4,'','Cambiar a PAL?')=6 then
		pal()
	EndIf
EndIf

Do
	ControlCommand('AVS Video Recorder','','TspSkinPageControl1',"Tableft", "")
Until ControlCommand('AVS Video Recorder','','TspSkinPageControl1',"CurrentTab", "")=1

WinWait('AVS Video Recorder','Examinar')
ControlClick('AVS Video Recorder','Examinar','TspSkinButton5')

DirCreate(@DesktopDir&'\VHS\'&$nro)
WinWait('Guardar')
Do
	ControlSetText('Guardar','','Edit1',@DesktopDir&'\VHS\'&$nro&'\'&$nro&'-Original')
until ControlgetText('Guardar','','Edit1')=@DesktopDir&'\VHS\'&$nro&'\'&$nro&'-Original'

Do
	ControlClick('Guardar','','Button2')
until not WinExists('Guardar')






Opt("WinDetectHiddenText", 1)
if WinExists('AVS Video Recorder (AV In - OEM Device)','48000 Hz') and WinExists('AVS Video Recorder (AV In - OEM Device)','256 kbps') and WinExists('AVS Video Recorder (AV In - OEM Device)','MP2') and WinExists('AVS Video Recorder (AV In - OEM Device)','MPEG-2; 720x480; 29,97 fps; 6,58 Mbits') and WinExists('AVS Video Recorder (AV In - OEM Device)',@DesktopDir&'\VHS\'&$nro&'\'&$nro&'-Original') Then
	MsgBox(0,'','Listo! Rebobiná y al darle aceptar solo va a grabar')
	ControlClick('AVS Video Recorder','','TspSkinButton7')
Else
	if not WinExists('AVS Video Recorder (AV In - OEM Device)','48000 Hz') then MsgBox(0,'','Falta Sonido a 48000 Hz')
	if not WinExists('AVS Video Recorder (AV In - OEM Device)','256 kbps') then MsgBox(0,'','Falta Sonido a 256 kbps')
	if Not WinExists('AVS Video Recorder (AV In - OEM Device)','MP2') then MsgBox(0,'','Falta Sonido en MP2')
	if not WinExists('AVS Video Recorder (AV In - OEM Device)','MPEG-2; 720x480; 29,97 fps; 6,58 Mbits') then MsgBox(0,'','Falta Video')
	if not WinExists('AVS Video Recorder (AV In - OEM Device)',@DesktopDir&'\VHS\'&$nro&'\'&$nro&'-Original') Then MsgBox(0,'','Falta ubicacion correcta')
EndIf














func pal()
	ShellExecute('avserror.exe')

	ventanapropiedades()

	;pal
	$sentido=0
	if ControlGetText('Propiedades','','Edit1')='NTSC_M' then ControlSend('Propiedades','','Edit1','{down}{down}{down}{down}{down}{down}{down}')
	Do
		if $sentido=0 then ControlSend('Propiedades','','Edit1','{down}')
		if $sentido=1 then ControlSend('Propiedades','','Edit1','{up}')

		if ControlGetText('Propiedades','','Edit1')='PAL_N_COMBO' then
			$sentido=1
		ElseIf  ControlGetText('Propiedades','','Edit1')='NTSC_M' then
			$sentido=0
		EndIf
	;~ 	Sleep(100)
	until ControlGetText('Propiedades','','Edit1')='PAL_N'


	cerrarventana()
	sonido256k()
	ProcessWaitClose('avserror.exe')
	Sleep(1000)
	ControlClick('AVS Video Recorder','','TspSkinButton4')

EndFunc

func ntsc()
	ShellExecute('avserror.exe')

	ventanapropiedades()

	;ntsc
	$sentido=1
	if ControlGetText('Propiedades','','Edit1')='PAL_N' then ControlSend('Propiedades','','Edit1','{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}')
	Do
		if $sentido=0 then ControlSend('Propiedades','','Edit1','{down}')
		if $sentido=1 then ControlSend('Propiedades','','Edit1','{up}')

		if ControlGetText('Propiedades','','Edit1')='PAL_N_COMBO' then
			$sentido=1
		ElseIf  ControlGetText('Propiedades','','Edit1')='NTSC_M' then
			$sentido=0
		EndIf
	;~ 	Sleep(100)
	until ControlGetText('Propiedades','','Edit1')='NTSC_M'

	cerrarventana()
	sonido256k()
	ProcessWaitClose('avserror.exe')
	Sleep(1000)
	ControlClick('AVS Video Recorder','','TspSkinButton4')

EndFunc



func cerrarventana()
	do
		ControlClick('Propiedades','','Button3')
	until not WinExists('Propiedades')
EndFunc

func sonido256k()
	;256 kbps
;~ 	Do
		ControlSend('AVS Video Recorder','','TspSkinComboBox3','{down}{down}')
	;~ 	Sleep(100)
;~ 	until ControlGetText('AVS Video Recorder','','TspSkinComboBox3')='256 kbps'

EndFunc

func ventanapropiedades()
	;ventana propiedades
	Do
		ControlClick('AVS Video Recorder','','TspSkinButton5')
		Sleep(100)
	until WinExists('Información') or WinExists('Propiedades')
	if WinExists('Información') then ControlClick('Información','','TspSkinButton1')
	WinWait('Propiedades')

EndFunc
