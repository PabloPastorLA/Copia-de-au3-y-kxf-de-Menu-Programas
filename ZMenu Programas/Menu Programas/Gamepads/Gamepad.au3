#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("GP", 141, 84, 251, 149)
$Button1 = GUICtrlCreateButton("Reset Serv", 32, 8, 75, 25)
$Button2 = GUICtrlCreateButton("Cerr Todo", 32, 32, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


global $lista=''
global $lista2=''


;SplashTextOn('GP v1.0','',50,20,@DesktopWidth-50,0)
processclose('scptrayapp.exe')
ShellExecute('joy.cpl')
WinWait('Dispositivos de juego')
global $cantant=ControlListView('Dispositivos de juego','','SysListView321',"GetItemCount",0,0)





While 1
	unicavez()
	loop()
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			reiniciarservicio()
		Case $Button2
			cerrtodo()
	EndSwitch
WEnd

func reiniciarservicio()
;	GUICtrlSetColor($Button1,Random(1,255,1)&Random(1,255,1)&Random(1,255,1))
	GUICtrlSetColor($Button1,0xff0000)
	ShellExecuteWait('cmd',' /C NET STOP Ds3Service & NET START Ds3Service','','',@SW_HIDE)
	GUICtrlSetColor($Button1,0x000000)
	;GUICtrlSetColor($Button1,Random(1,255,1)&Random(1,255,1)&Random(1,255,1))
	;ShellExecute('cmd',' /C NET START Ds3Service','','',@SW_HIDE)
EndFunc

func cerrtodo()
	WinClose('Dispositivos de juego')
	if WinExists('Propiedades de '&$lista) then WinClose('Propiedades de '&$lista)
	if WinExists('Propiedades de '&$lista2&'...') Then WinClose('Propiedades de '&$lista2&'...')
	Exit
EndFunc

func unicavez()
	$pos=WinGetPos($Form1)
	WinMove($Form1,'',@DesktopWidth-$pos[2],0)
	WinSetOnTop($Form1,'',1)
EndFunc





func loop()

	$cant=ControlListView('Dispositivos de juego','','SysListView321',"GetItemCount",0,0)

	$lista=ControlListView('Dispositivos de juego','','SysListView321','gettext',$cant-1,0)
	$lista2=StringLeft($lista,30)

	;MsgBox(0,'',$lista)

	;sacar ventanas de error
	if WinExists ('Error del dispositivo de juego') and ControlGetText('Error del dispositivo de juego','','Button2')='Cancelar' then WinClose('Error del dispositivo de juego')
	if WinExists('Error interno','No se encuentran los archivos de compatibilidad necesarios.') then WinClose('Error interno','No se encuentran los archivos de compatibilidad necesarios.')

	;si no hay ventana abierta abro la ultima
	if WinExists ('Dispositivos de juego') and $lista<>'' and not WinExists('Propiedades de '&$lista) and not WinExists('Propiedades de '&$lista2&'...') then
		ControlListView('Dispositivos de juego','','SysListView321',"Select", $cant-1,$cant-1)
		ControlClick('Dispositivos de juego','','Button2');MsgBox(0,'','')
	EndIf

	;si cambia cantidad cierro ventana
	if $cant <> $cantant then
		if WinExists('Propiedades de '&$lista) then WinClose('Propiedades de '&$lista)
		if WinExists('Propiedades de '&$lista2&'...') Then WinClose('Propiedades de '&$lista2&'...')
		$cantant=$cant
	EndIf

	;si hay 3 gamepads reinicia servicio
	if $cant>=3 Then
	;	MsgBox(0,'','')
		reiniciarservicio()
	EndIf



;	Sleep(200)
;if not WinExists then Exit;until not WinExists('Dispositivos de juego')

EndFunc