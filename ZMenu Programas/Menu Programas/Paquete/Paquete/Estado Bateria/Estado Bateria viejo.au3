SplashOff()
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <WinAPISys.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=Estadobateria.kxf
$EstadoBateria = GUICreate("Estado Bateria", 409, 233, 323, 168)
$Checkbox1 = GUICtrlCreateCheckbox("", 172, 206, 23, 17)
$Desactivar_Splash = GUICtrlCreateCheckbox("Desactivar Splash", 172, 190, 119, 17)
$Ignorar_msg_ERROR = GUICtrlCreateCheckbox("Ignorar msg ERROR", 172, 174, 119, 17)
$Prueba = GUICtrlCreateButton("Prueba", 28, 190, 55, 25)
$Salir = GUICtrlCreateButton("Salir", 96, 190, 55, 25)
$Label1 = GUICtrlCreateLabel("Cargador:", 16, 16, 132, 28)
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
$Label2 = GUICtrlCreateLabel("Estado bateria:", 16, 48, 132, 28)
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
$Label3 = GUICtrlCreateLabel("Porcentaje:", 16, 80, 132, 28)
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
$Label4 = GUICtrlCreateLabel("Carga restante:", 16, 112, 132, 28)
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
$Label5 = GUICtrlCreateLabel("Carga maxima:", 16, 144, 132, 28)
GUICtrlSetFont(-1, 14, 400, 0, "MS Sans Serif")
$Input1 = GUICtrlCreateInput("", 168, 16, 169, 21)
$Input2 = GUICtrlCreateInput("", 168, 48, 169, 21)
$Input3 = GUICtrlCreateInput("", 168, 80, 169, 21)
$Input4 = GUICtrlCreateInput("", 168, 112, 169, 21)
$Input5 = GUICtrlCreateInput("", 168, 144, 169, 21)
$Input6 = GUICtrlCreateInput("", 360, 16, 41, 21)
$Input7 = GUICtrlCreateInput("", 360, 48, 41, 21)
$Input8 = GUICtrlCreateInput("", 360, 80, 41, 21)
$Input9 = GUICtrlCreateInput("", 360, 112, 41, 21)
$Input10 = GUICtrlCreateInput("", 360, 144, 41, 21)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

if ProcessExists('Estado Bateria.exe') and not ProcessExists('cerrardontsleep.exe') Then ShellExecute('Cerrar\cerrardontsleep.exe')


While 1
	bucle()
	;ControlHide('Estado Bateria','Leyendo API, espere','Static6')
	$dessplash=ControlCommand('Estado Bateria','Desactivar Splash','Button2','IsChecked','')
	$IgnorERROR=ControlCommand('Estado Bateria','Ignorar msg ERROR','Button3','IsChecked','')

	$loop=0
	While $loop<80
		Sleep(1)
		$loop=$loop+1
		$nMsg = GUIGetMsg()
		Switch $nMsg

			Case $GUI_EVENT_CLOSE
				Exit
			Case $Salir
				Exit
			Case $Prueba
				Prueba()
		EndSwitch
	WEnd
WEnd

func bucle()
	;ControlShow('Estado Bateria','','Static6')

	$aData = _WinAPI_GetSystemPowerStatus()
	;MsgBox(0,'', $aData[0]) ;1 con cargador 0 sin cargador;
	;MsgBox(0,'', $aData[1])
	;MsgBox(0,'', $aData[2]) ;  porcentaje
	;MsgBox(0,'', $aData[3]) ; nro
	;MsgBox(0,'', $aData[4])

	if $aData[0] = 0 Then ControlSetText('Estado Bateria','','Edit1','Sin Cargador')
	if $aData[0] = 1 Then ControlSetText('Estado Bateria','','Edit1','Con Cargador')
	if $aData[0] = 255 Then ControlSetText('Estado Bateria','','Edit1','Error')
	ControlSetText('Estado Bateria','','Edit6',$aData[0])

	if $aData[1] = 0 Then ControlSetText('Estado Bateria','','Edit2','Entre 66% y 33%')
	if $aData[1] = 1 Then ControlSetText('Estado Bateria','','Edit2','Mayor o igual a 67%')
	if $aData[1] = 2 Then ControlSetText('Estado Bateria','','Edit2','Menor  o igual a 32%')
	if $aData[1] = 4 Then ControlSetText('Estado Bateria','','Edit2','MENOR A 5%')

	if $aData[1] = 8 Then ControlSetText('Estado Bateria','','Edit2','Entre 66% y 33% - Cargando')

	if $aData[1] = 9 Then ControlSetText('Estado Bateria','','Edit2','Mayor o igual a 67% - Cargando')
	if $aData[1] = 10 Then ControlSetText('Estado Bateria','','Edit2','Menor  o igual a 32% - Cargando')
	;if $aData[1] = 12 Then ControlSetText('Estado Bateria','','Edit2','asdasd jh66%')

	if $aData[1] = 128 Then ControlSetText('Estado Bateria','','Edit2','Sin Bateria')
	if $aData[1] = 255 Then ControlSetText('Estado Bateria','','Edit2','Error')
	if $aData[1] <> 0 and $aData[1] <> 1 and $aData[1] <> 2 and $aData[1] <> 4 and $aData[1] <> 8 and $aData[1] <> 9 and $aData[1] <> 10 and $aData[1] <> 128 and $aData[1] <> 255 then ControlSetText('Estado Bateria','','Edit2','')
	ControlSetText('Estado Bateria','','Edit7',$aData[1])

	if $aData[2] >=0 and $aData[2] <=100 Then ControlSetText('Estado Bateria','','Edit3',$aData[2]&'%')
	if $aData[2] = 255 Then ControlSetText('Estado Bateria','','Edit3','Error')
	ControlSetText('Estado Bateria','','Edit8',$aData[2])

	;if $aData[3] =(-1) Then ControlSetText('Estado Bateria','','Edit4','Error')
	;if $aData[3] >= 0 Then ControlSetText('Estado Bateria','','Edit4',$aData[3])

	;$aData[3]=59

	If ($aData[3]/3600) >= 1 Then
	;	MsgBox(0,'','1')
		ControlSetText('Estado Bateria','','Edit4',Int($aData[3]/3600)&' Hs '&Int((Mod($aData[3],3600)/60))&' Min')
	;	ControlSetText('Estado Bateria','','Edit4','1')
	ElseIf ($aData[3]/60) >= 1 Then
	;	MsgBox(0,'','2')
		ControlSetText('Estado Bateria','','Edit4',Int($aData[3]/60)&' Min '&(Mod($aData[3],60))&' Seg')
	;	ControlSetText('Estado Bateria','','Edit4','2')
	ElseIf $aData[3] >= 0 Then
	;	MsgBox(0,'','2')
		ControlSetText('Estado Bateria','','Edit4',$aData[3]&' Seg')
	;	ControlSetText('Estado Bateria','','Edit4','2')
	ElseIf $aData[3] = -1 And $aData[0] = 0 Then
		ControlSetText('Estado Bateria','','Edit4','Desconocido')
	ElseIf $aData[3] = -1 And $aData[0] = 1 Then
		ControlSetText('Estado Bateria','','Edit4','Indica sin cargador')
	EndIf
	ControlSetText('Estado Bateria','','Edit9',$aData[3])

	If ($aData[4]/3600) >= 1 Then
	;	MsgBox(0,'','1')
		ControlSetText('Estado Bateria','','Edit5',Int($aData[4]/3600)&' Hs '&Int((Mod($aData[4],3600)/60))&' Min')
	;	ControlSetText('Estado Bateria','','Edit4','1')
	ElseIf ($aData[4]/60) >= 1 Then
	;	MsgBox(0,'','2')
		ControlSetText('Estado Bateria','','Edit5',Int($aData[4]/60)&' Min '&(Mod($aData[4],60))&' Seg')
	;	ControlSetText('Estado Bateria','','Edit4','2')
	ElseIf $aData[4] >= 0 Then
	;	MsgBox(0,'','2')
		ControlSetText('Estado Bateria','','Edit5',$aData[4]&' Seg')
	;	ControlSetText('Estado Bateria','','Edit4','2')
	ElseIf $aData[4] = -1 Then
		ControlSetText('Estado Bateria','','Edit5','Probar cargar al maximo')
	;	ControlSetText('Estado Bateria','','Edit5','Desconocido')
	EndIf
	ControlSetText('Estado Bateria','','Edit10',$aData[4])


	;MsgBox(0,'',$aData[3])
	;MsgBox(0,'',$aData[2])
	;[2] - The percentage of full battery charge remaining. This member can be a value in the range 0 to 100, or 255 if status is unknown.
	;[3] - The number of seconds of battery life remaining, or if remaining seconds are unknown.
	;[4] - The number of seconds of battery life when at full charge, or if full battery lifetime is unknown.


EndFunc





;-----------------------------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------------------------




func prueba()

	$aData = _WinAPI_GetSystemPowerStatus()
	WinSetState('Estado Bateria','',@SW_MINIMIZE)
	cerrar()

	dontsleep()

	condicioncargadorbateria()

	generarreporte()
EndFunc

func cerrar()
	ShellExecute('Cerrar\cerrarestadobateria.exe')
	WinWait('Cerrar')
	$aPos = WinGetPos("Cerrar")
;~ 	MsgBox(0,'',$aPos[2])
	WinMove('Cerrar','',(@DesktopWidth-$aPos[2])/2,(@DesktopHeight-$aPos[3])/2)
EndFunc

func generarreporte()
	$acum=0
	FileWrite('tiempobateriadesenchufada.txt',$acum & ' min'&@CRLF)
	While 1
		$aData = _WinAPI_GetSystemPowerStatus()
		If $dessplash = 0 Then SplashTextOn('Espera','No tocar NADA! ' & @crlf & 'Cargador desconectado, realizando la prueba. NO TOQUE NADA!!! Bat: '&$aData[2]&'%',620,63,@DesktopWidth/2-310,110)

		Sleep(60000)
		$acum=$acum+1
		FileWrite('tiempobateriadesenchufada.txt',$acum & ' min'&@CRLF)
	WEnd
EndFunc


func condicioncargadorbateria()
	$aData = _WinAPI_GetSystemPowerStatus()
	;SplashTextOn('Espera','No tocar NADA! ' & @crlf & 'Probando bateria',160,80,0,110)
	error()
	SplashTextOn('Espera','No tocar NADA! ' & @crlf & 'Debe conectar el cargador para realizar la prueba. Conectelo y espere.',620,63,@DesktopWidth/2-310,110)
	While $aData[0]=0
		$aData = _WinAPI_GetSystemPowerStatus()
		Sleep(2000)
	WEnd
	SplashTextOn('Espera','No tocar NADA! ' & @crlf & 'Cargador conectado, espere a que la bateria se cargue al 100%, carga actual: '&$aData[2]&'%',620,63,@DesktopWidth/2-310,110)
	error()
	While $aData[2]<>100
		if $aData[0]=0 then SplashTextOn('Espera','No tocar NADA! ' & @crlf & 'Cargador desconectado, conectelo y espere',620,63,@DesktopWidth/2-310,110)
		if $aData[0]=1 then SplashTextOn('Espera','No tocar NADA! ' & @crlf & 'Cargador conectado, espere a que la bateria se cargue al 100%, carga actual: '&$aData[2]&'%',620,63,@DesktopWidth/2-310,110)
		$aData = _WinAPI_GetSystemPowerStatus()
		Sleep(2000)
	WEnd
	SplashTextOn('Espera','No tocar NADA! ' & @crlf & 'Carga al 100%, desconecte el cargador y comenzara la prueba',620,63,@DesktopWidth/2-310,110)
	error()
	While $aData[0]=1
		$aData = _WinAPI_GetSystemPowerStatus()
		Sleep(2000)
	WEnd
	If $dessplash = 0 Then SplashTextOn('Espera','No tocar NADA! ' & @crlf & 'Cargador desconectado, realizando la prueba. NO TOQUE NADA!!!',620,63,@DesktopWidth/2-310,110)
	If $dessplash = 1 Then SplashOff()
	error()
EndFunc




func error()
	$aData = _WinAPI_GetSystemPowerStatus()
	If $aData[0]=255 Or $aData[1]=128 Or $aData[1]=255 or $aData[2]=255 Then
		If $IgnorERROR <> 1 Then
			While 1
				MsgBox(0,'','ERROR valores no concuerdan')
				ProcessClose('cerrarestadobateria.exe')
				Exit
			WEnd
		EndIf
	EndIf
EndFunc

func dontsleep()
	While ProcessExists('DontSleep.exe') or ProcessExists('DontSleep_x64.exe')
		ProcessClose('DontSleep.exe')
		ProcessClose('DontSleep_x64.exe')
	WEnd
	if @OSArch='x86' Then
		ShellExecute('Dont Sleep\DontSleep.exe','','','',@SW_MINIMIZE)
	Else
		ShellExecute('Dont Sleep\DontSleep_x64.exe','','','',@SW_MINIMIZE)
	EndIf
	WinWait("Don't Sleep")

	While WinGetState("Don't Sleep",'') <> 23
		WinSetState("Don't Sleep",'',@SW_MINIMIZE)
		Sleep(1000)
	WEnd
EndFunc
