#include <Misc.au3>
#include <MsgBoxConstants.au3>
#RequireAdmin

#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****


$nombreLAN='Conexión de área local'
$nombreWLAN='Conexión de red inalámbrica 5'


if not (uptime() >= 180) then
	Do
		SplashTextOn('Modo Net','Inet x LAN: Esp. Det. Hardware Hasta 180: '&uptime(),160,80,0,220)
		Sleep(5000)
	Until uptime() >= 180
	SplashOff()
EndIf


If _Singleton("test", 1) = 0 Then
    MsgBox($MB_SYSTEMMODAL, "InternetPorLan(SERVIDOR)", "No se permite mas de una instancia.")
    Exit
EndIf

verificar()
if FileExists('Conectado') Then
	Desconectar()
	verificar()
EndIf

while FileExists('Conectar') or FileExists('Desconectar')
	FileDelete('Conectar')
	FileDelete('Desconectar')
WEnd

while 1
	Sleep(1000)
	if FileExists('Conectar') Then
		if FileExists('Conectado') Then
			FileDelete('Conectar')
			SplashTextOn('Modo Net','Internet por LAN:'&@CRLF&'YA ESTOY CONECTADO',160,80,0,220)
			Sleep(5000)
			SplashOff()
		EndIf
		if FileExists('Desconectado') Then
			Conectar()
			while FileExists('Conectar') or FileExists('Desconectar') or FileExists('Desconectado')
				FileDelete('Conectar')
				FileDelete('Desconectar')
				FileDelete('Desconectado')
			WEnd
			FileWrite('Conectado','')
		EndIf
	EndIf

	if FileExists('Desconectar') Then
		if FileExists('Desconectado') Then
			FileDelete('Desconectar')
			SplashTextOn('Modo Net','Internet por LAN:'&@CRLF&'YA ESTOY DESCONECTADO',160,80,0,220)
			Sleep(5000)
			SplashOff()
		EndIf
		if FileExists('Conectado') Then
			Desconectar()
			while FileExists('Conectar') or FileExists('Desconectar') or FileExists('Conectado')
				FileDelete('Conectar')
				FileDelete('Desconectar')
				FileDelete('Conectado')
			WEnd
			FileWrite('Desconectado','')
		EndIf
	EndIf
WEnd

func uptime()
	$ret = DllCall("kernel32.dll","long","GetTickCount")
	If IsArray($ret) Then
		$uptime = Round(($ret[0] / 1000),1); convert miliseconds to seconds
		consolewrite(@CRLF&$uptime)
	EndIf
	Return $uptime
EndFunc

func PropiedadesWlan()

	Do
		$exit=0
		while WinExists('Estado de '&$nombreWLAN) or WinExists('::{208D2C60-3AEA-1069-A2D7-08002B30309D}\::{7007ACC7-3202-11D1-AAD2-00805FC1270E}\::{F7733EA0-D970-45C5-A6CE-540A953497DC}') or WinExists('View Available Networks')
;~ 		while WinExists('Estado de '&$nombreWLAN) or WinExists('::{208D2C60-3AEA-1069-A2D7-08002B30309D}\::{7007ACC7-3202-11D1-AAD2-00805FC1270E}\::{F7733EA0-D970-45C5-A6CE-540A953497DC}') or WinExists('View Available Networks')
			WinClose('Estado de '&$nombreWLAN)
			WinClose('::{208D2C60-3AEA-1069-A2D7-08002B30309D}\::{7007ACC7-3202-11D1-AAD2-00805FC1270E}\::{F7733EA0-D970-45C5-A6CE-540A953497DC}')
			WinClose('View Available Networks')
		WEnd
		$handle=ShellExecute('cmd','/k start ::{208D2C60-3AEA-1069-A2D7-08002B30309D}\::{7007ACC7-3202-11D1-AAD2-00805FC1270E}\::{F7733EA0-D970-45C5-A6CE-540A953497DC}','','');,@SW_HIDE)
		while not WinExists('Red local','Algunos controles en esta hoja') and not WinExists('Estado de '&$nombreWLAN) And not WinExists('::{208D2C60-3AEA-1069-A2D7-08002B30309D}\::{7007ACC7-3202-11D1-AAD2-00805FC1270E}\::{F7733EA0-D970-45C5-A6CE-540A953497DC}') and not WinExists('View Available Networks')
			Sleep(300)
		WEnd

		If WinExists('Red local','Algunos controles en esta hoja') then
			While WinExists('Red local','Algunos controles en esta hoja')
				WinClose('Red local','Algunos controles en esta hoja')
				ProcessClose($handle)
			WEnd
			MsgBox(0,'','Esperar a que detecte hardware(Inicio de Windows).',5)
;~ 			$handle=PropiedadesWlan()
		EndIf
		If WinExists('View Available Networks') then
			While WinExists('View Available Networks')
				WinClose('View Available Networks')
				ProcessClose($handle)
			WEnd
			MsgBox(0,'','Debe conectar internet en la WLAN antes de continuar',5)
;~ 			$handle=PropiedadesWlan()
		EndIf
		if WinExists('::{208D2C60-3AEA-1069-A2D7-08002B30309D}\::{7007ACC7-3202-11D1-AAD2-00805FC1270E}\::{F7733EA0-D970-45C5-A6CE-540A953497DC}') then
			While WinExists('::{208D2C60-3AEA-1069-A2D7-08002B30309D}\::{7007ACC7-3202-11D1-AAD2-00805FC1270E}\::{F7733EA0-D970-45C5-A6CE-540A953497DC}')
				WinClose('::{208D2C60-3AEA-1069-A2D7-08002B30309D}\::{7007ACC7-3202-11D1-AAD2-00805FC1270E}\::{F7733EA0-D970-45C5-A6CE-540A953497DC}')
				ProcessClose($handle)
			WEnd
			MsgBox(0,'','Adaptador USB TP-LINK no detectado!',5)
;~ 			$handle=PropiedadesWlan()
		EndIf
		if WinExists('Estado de '&$nombreWLAN) Then
			Do
				ControlClick('Estado de '&$nombreWLAN,'','Button3')
				Sleep(200)
			Until WinExists('Propiedades de '&$nombreWLAN)
			ControlCommand('Propiedades de '&$nombreWLAN, "", "SysTabControl321", "TabRight", "")
			Sleep(500)
;~ 			MsgBox(0,'','OK')
			$exit=1
		EndIf
	Until $exit=1

	Return $handle

EndFunc

Func aumentardelayteclas()
	AutoItSetOption ( "SendKeyDelay",30)
	AutoItSetOption ( "SendKeyDownDelay",30)
EndFunc

Func disminuirdelayteclas()
	AutoItSetOption ( "SendKeyDelay")
	AutoItSetOption ( "SendKeyDownDelay")
EndFunc







func verificar()

	SplashTextOn('Modo Net','VERIFICANDO internet en compus',160,80,0,220)


	while WinExists('Conexiones de red') or WinExists('Propiedades de '&$nombreLAN)
		WinClose('Conexiones de red')
		WinClose('Propiedades de '&$nombreLAN)
	WEnd


;~ 	ShellExecute('Ncpa.cpl')
;~ 	WinWait('Conexiones de red')
;~ 	WinActivate('Conexiones de red')
;~ 	WinWaitActive('Conexiones de red')
;~ 	aumentardelayteclas()
;~ 	send('{space}{right}{altdown}{enter}{altup}')
;~ 	disminuirdelayteclas()
;~ 	WinWait('Propiedades de '&$nombreWLAN)
;~ 	aumentardelayteclas()
;~ 	send('{shiftdown}{tab}{tab}{shiftup}{right}')
;~ 	disminuirdelayteclas()

	;reemplazado con:
	$handle=PropiedadesWlan()





	WinWait('Propiedades de '&$nombreWLAN,'Permitir que los usuarios de &otras redes se conecten')


	while FileExists('Conectado') or FileExists('Desconectado')
		FileDelete('Conectado')
		FileDelete('Desconectado')
	WEnd

	if ControlCommand('Propiedades de '&$nombreWLAN,'Permitir que los usuarios de &otras redes se conecten a través de la conexión a Internet de este equipo','Button4',"IsChecked", "") = 0 Then
		FileWrite('Desconectado','')
	EndIf

	if ControlCommand('Propiedades de '&$nombreWLAN,'Permitir que los usuarios de &otras redes se conecten a través de la conexión a Internet de este equipo','Button4',"IsChecked", "") = 1 Then
		FileWrite('Conectado','')
	EndIf




	;MsgBox(0,'','')

	ControlClick('Propiedades de '&$nombreWLAN,'','Button8')

 	WinWaitClose('Propiedades de '&$nombreWLAN)

	while WinExists('Conexiones de red')
		WinClose('Conexiones de red')
	WEnd
	ProcessClose($handle)
;	ShellExecuteWait('cmd.exe',' /C netsh interface ipv4 set address name="'&$nombreLAN&'" static 192.168.137.1 255.255.255.0 192.168.137.2','','',@SW_HIDE)

	SplashOff()


EndFunc

func Desconectar()

	SplashTextOn('Modo Net','desactivando internet en compus',160,80,0,220)


	while WinExists('Conexiones de red') or WinExists('Propiedades de '&$nombreLAN)
		WinClose('Conexiones de red')
		WinClose('Propiedades de '&$nombreLAN)
	WEnd


;~ 	ShellExecute('Ncpa.cpl')
;~ 	WinWait('Conexiones de red')
;~ 	WinActivate('Conexiones de red')
;~ 	WinWaitActive('Conexiones de red')
;~ 	aumentardelayteclas()
;~ 	send('{space}{right}{altdown}{enter}{altup}')
;~ 	disminuirdelayteclas()
;~ 	WinWait('Propiedades de '&$nombreWLAN)
;~ 	aumentardelayteclas()
;~ 	send('{shiftdown}{tab}{tab}{shiftup}{right}')
;~ 	disminuirdelayteclas()

	;reemplazado con:
	$handle=PropiedadesWlan()

	while ControlCommand('Propiedades de '&$nombreWLAN,'Permitir que los usuarios de &otras redes se conecten a través de la conexión a Internet de este equipo','Button4',"IsChecked", "") = 1
		ControlCommand('Propiedades de '&$nombreWLAN,'Permitir que los usuarios de &otras redes se conecten a través de la conexión a Internet de este equipo','Button4',"unCheck", "")
		Sleep(300)
	WEnd


	ControlClick('Propiedades de '&$nombreWLAN,'','Button7')

 	WinWaitClose('Propiedades de '&$nombreWLAN)

	while WinExists('Conexiones de red')
		WinClose('Conexiones de red')
	WEnd



	ShellExecuteWait('cmd.exe',' /C netsh interface ipv4 set address name="'&$nombreLAN&'" static 192.168.137.1 255.255.255.0 192.168.137.2','','',@SW_HIDE)

	ProcessClose($handle)

	SplashOff()


EndFunc


func Conectar()

	SplashTextOn('Modo Net','Activando internet en compus',160,80,0,220)

	ShellExecuteWait('cmd.exe',' /C netsh interface ipv4 set address name="'&$nombreLAN&'" static 192.168.137.3 255.255.255.0 192.168.137.2','','',@SW_HIDE)

	while WinExists('Conexiones de red') or WinExists('Propiedades de '&$nombreLAN)
		WinClose('Conexiones de red')
		WinClose('Propiedades de '&$nombreLAN)
	WEnd


;~ 	ShellExecute('Ncpa.cpl')
;~ 	WinWait('Conexiones de red')
;~ 	WinActivate('Conexiones de red')
;~ 	WinWaitActive('Conexiones de red')
;~ 	aumentardelayteclas()
;~ 	send('{space}{right}{altdown}{enter}{altup}')
;~ 	disminuirdelayteclas()
;~ 	WinWait('Propiedades de '&$nombreWLAN)
;~ 	aumentardelayteclas()
;~ 	send('{shiftdown}{tab}{tab}{shiftup}{right}')
;~ 	disminuirdelayteclas()

	;reemplazado con:
	$handle=PropiedadesWlan()

	while ControlCommand('Propiedades de '&$nombreWLAN,'Permitir que los usuarios de &otras redes se conecten a través de la conexión a Internet de este equipo','Button4',"IsChecked", "") = 0
		ControlCommand('Propiedades de '&$nombreWLAN,'Permitir que los usuarios de &otras redes se conecten a través de la conexión a Internet de este equipo','Button4',"Check", "")
		Sleep(300)
	WEnd

	If ControlCommand('Propiedades de '&$nombreWLAN, '', 'ComboBox1', 'FindString', $nombreLAN) <> 0 Then
		ControlCommand('Propiedades de '&$nombreWLAN, '', 'ComboBox1', 'SelectString', $nombreLAN)
		Sleep(300)
	Else
		MsgBox(0,'','Activar internet: no encontre nombre de conexion inalambrica')
		MsgBox(0,'','cerrando')
		Exit
	EndIf

	ControlClick('Propiedades de '&$nombreWLAN,'','Button7')
	WinWait('Red local')
	Sleep(300)
	While WinExists('Red local','Cuando esté habilitada la Conexión compartida a Internet')
		ControlClick('Red local','&Sí','Button1')
		Sleep(300)
	WEnd
 	WinWaitClose('Propiedades de '&$nombreWLAN)

	while WinExists('Conexiones de red')
		WinClose('Conexiones de red')
	WEnd

	ProcessClose($handle)

	SplashOff()

EndFunc