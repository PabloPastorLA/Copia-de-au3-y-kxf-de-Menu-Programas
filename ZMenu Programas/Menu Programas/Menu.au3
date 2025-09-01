#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=ResourcesMenu/menuicono.ico
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Compile_Both=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
If @OSVersion <> 'WIN_XP' Then
	#RequireAdmin
EndIf
#include <File.au3>
#include <WinAPIFiles.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Date.au3>
#include <GuiTab.au3>



$forzarmodolocal=0  ; en 0 fuerza el modo local


Global $Anio=2024				;<--	Año Actual
Global $Mes=12					;<--	Mes Actual

global $DebugFuncionesRED = 0 				;Muestra nombres de las funciones de red
global $DebugArrancarSolParaMostrarGUI = 0	;Muestra GUI y nada mas
global $deapasos=0							;Ejecuta instalaciones de a una


;Defino parametros RED
$IpCPUNegro = '192.168.137.1'
$Carpetanetwork = $IpCPUNegro & '\Menu Programas'
$CarpetanetworkJUEGOS = $IpCPUNegro & '\Menu Juegos'
$tiempoesperaconexionderedalreiniciar = 2




;Verifico doble instancia
If WinExists('Menu', 'Autoit') Then
	WinActivate('Menu', 'Autoit')
	MsgBox(0, 'Menu', 'No se permiten 2 instancias simultaneas', 3)
	Exit
EndIf
;Termino de Verificar doble instancia


; aviso simple usb3
if 7 = MsgBox(4,'','Usar USB3 en lo posible.'&@CRLF&'Continuo en 5...',5) then Exit



;Aviso en caso de GUI o creo acceso directo en caso de exe
If $DebugArrancarSolParaMostrarGUI = 1 Then MsgBox(0, '', 'MODO DEBUG, Solo Mostrar GUI')
If $DebugArrancarSolParaMostrarGUI = 0 Then
	If StringRight(@ScriptFullPath, 3) = 'exe' Then
		If Not FileExists(@DesktopDir & '\MenuRED2.lnk') Then
			FileCreateShortcut(@ScriptFullPath, @DesktopDir & ('\Menu.lnk'), @ScriptDir)
		EndIf
	EndIf
EndIf
;termino de Avisar en caso de GUI o crear acceso directo en caso de exe

;Reviso linea de COMANDOS por local o remoto
If $CmdLine[0] > 0 Then
	Switch $CmdLine[1]
		Case "/RED"
			$ModoRED = 1
		Case "/LOC"
			$ModoRED = 0
	EndSwitch
Else
	$ModoRED = 2
EndIf


;Reviso linea de COMANDOS por unattend
global $unattend=0
If $CmdLine[0] > 0 Then
	Switch $CmdLine[1]
		Case "/UNATTEND"
			$unattend = 1
	EndSwitch
EndIf

$modored=$forzarmodolocal

If $ModoRED <> 0 And $ModoRED <> 1 And $ModoRED <> 2 Then
	MsgBox(0, 'Menu', 'Error con parametro. Cerrando')
	Exit
EndIf
;Termino de Revisar linea de COMANDOS


;Reviso si continuo con instalacion de lista
If FileExists(@ScriptDir & '\ListaInstalar.txt') and $unattend=0 Then
	$ContinuarConInstalacionLista = 1
	ShellExecute('cerrarvent.exe', '', 'nod 32')
Else
	if $unattend=1 then
		for $i=1 to 99 step 1
			if not FileExists ('ListaInstalar - Cancelada '&$i&' (por unattend).txt') then FileMove('ListaInstalar.txt','ListaInstalar - Cancelada '&$i&' (por unattend).txt')
		Next
		filedelete('ListaInstalar.txt')
	EndIf
	$ContinuarConInstalacionLista = 0
EndIf
;Termino de Revisar si continuo con instalacion de lista


;comparo fecha entre archivo y la constante y reescribo
if FileExists(@ScriptDir&'\resourcesmenu\fecha.txt') then
	$arch=FileOpen(@ScriptDir&'\resourcesmenu\fecha.txt')
	$linea=FileReadLine($arch,1)
	FileClose($arch)

	if $Anio < StringRight($linea,4) then
		$Anio=StringRight($linea,4)
		$Mes=StringTrimRight(StringRight($linea,7),5)
	EndIf
	if $Anio = StringRight($linea,4) and $Mes < StringTrimRight(StringRight($linea,7),5) Then $Mes=StringTrimRight(StringRight($linea,7),5)
EndIf
;MsgBox(0,'',$Anio&'   '&$Mes)
;termino de comparar fecha entre archivo y la constante y reescribir





;  ___       _      _         _   _      _   			--------------------------------------------------------------------------------------------------
; |_ _|_ __ (_) ___(_) ___   | \ | | ___| |_ 			--------------------------------------------------------------------------------------------------
;  | || '_ \| |/ __| |/ _ \  |  \| |/ _ \ __|			--------------------------------------------------------------------------------------------------
;  | || | | | | (__| | (_) | | |\  |  __/ |_ 			--------------------------------------------------------------------------------------------------
; |___|_| |_|_|\___|_|\___/  |_| \_|\___|\__|			---------------------------------------------------------------  http://patorjk.com/software/taag/







;verifico si inicio con parametro /RED entonces espero un ratito a la conexion o placa de red
If $ModoRED = 1 Then
	$exit = $tiempoesperaconexionderedalreiniciar
	While $exit >= 0
		SplashTextOn('Modo Net: parametro /RED', 'Esperando ' & $exit & ' segundos por conexion de red.', 160, 80, 0, 220)
		$exit = $exit - 1
		Sleep(1000)
	WEnd
	SplashOff()
EndIf
;termino de verificar si inicio con parametro /RED





;Modificacion RED!
$inicioNET = 0
;~ If $ModoRED = 2 Then $inicioNET = MsgBox(3, 'Modo Network', 'Desea iniciar en MODO NETWORK?, Recuerde desactivar el Antivirus en Servidor')
If $ModoRED = 2 Then $inicioNET = MsgBox(3, 'Modo Network', 'Desea iniciar en MODO LOCAL?')
if $inicioNET=6 then
	$inicioNET=7
ElseIf $inicioNET=7 then
	$inicioNET=6
EndIf

;~ MsgBox(0,'',$inicioNET)
;~ Exit
;~ si 6
;~ no 7
;~ cancel 2


;Modificacion RED!
If $inicioNET = 6 Or $ModoRED = 1 Then
	$respuesta = 0
	If Not FileExists('MenuRED2.exe') Then $respuesta = MsgBox(1, 'Warning!', 'No veo MenuRED2, seguro queres continuar en ModoRED?')
	If $respuesta = 2 Then Exit

	If Not ProcessExists('MenuSplashImagen.exe') Then ShellExecute('MenuSplashImagen.exe', '', 'ResourcesMenu\MenuSplashImagen')

	ModoRED()
	$ModoRED = 1
ElseIf $inicioNET = 2 Then
	Exit
EndIf


If $DebugArrancarSolParaMostrarGUI = 0 And Not ProcessExists('MenuSplashImagen.exe') Then ShellExecute('MenuSplashImagen.exe', '', 'ResourcesMenu\MenuSplashImagen')




;  _   _      _     _____                 				--------------------------------------------------------------------------------------------------
; | \ | | ___| |_  |  ___|   _ _ __   ___ 				--------------------------------------------------------------------------------------------------
; |  \| |/ _ \ __| | |_ | | | | '_ \ / __|				--------------------------------------------------------------------------------------------------
; | |\  |  __/ |_  |  _|| |_| | | | | (__ 				--------------------------------------------------------------------------------------------------
; |_| \_|\___|\__| |_|   \__,_|_| |_|\___|				--------------------------------------------------------------------------------------------------









Func ModoRED()
	If $DebugFuncionesRED = 1 Then MsgBox(0, '', 'Estamos en funcion: ModoRED')

	$FaltanDriversoConfigRED = 0
	$DeboLoguearmeenRED = 0
	$TengoAccesoRED = 0

	SplashTextOn('Modo Net', 'Estamos en Modo NETWORK', 160, 80, 0, 220)
	If Not FileExists(@HomeDrive & '\MenuRED2\Menu.exe') And Not FileExists(@HomeDrive & '\MenuRED22\Menu.exe') Then
		MsgBox(0, 'MenuRED', 'MenuRED debe correr desde ' & @HomeDrive & '\MenuRED2\Menu.exe o ' & @HomeDrive & '\MenuRED2\Menu.exe')
		Exit
	EndIf
	If RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System', 'EnableLinkedConnections') <> 1 Then Modificarregistroyreiniciar()

	$CodigoRED = EjecutaryVerVentanaRED()
;~ 	MsgBox(0,'','codigo red: '&$CodigoRED)
	If $CodigoRED = 100 Then $FaltanDriversoConfigRED = 1
	If $CodigoRED = 010 Then $DeboLoguearmeenRED = 1
	If $CodigoRED = 001 Then $TengoAccesoRED = 1
	If $CodigoRED <> 100 And $CodigoRED <> 010 And $CodigoRED <> 001 Then
		MsgBox(0, '', 'Error en CodigoRED: "' & $CodigoRED & '"')
		Exit
	EndIf

	If $TengoAccesoRED = 1 Then $exit = 1

	If $FaltanDriversoConfigRED = 1 Then PreguntarInstalarDriversyConfigRED()

	If $DeboLoguearmeenRED = 1 Then
		Loguearse()
		ModoRED()
	EndIf

EndFunc   ;==>ModoRED

Func EjecutaryVerVentanaRED()
	If $DebugFuncionesRED = 1 Then MsgBox(0, '', 'Estamos en funcion: EjecutaryVerVentanaRED')

	$FaltanDriversoConfigRED = 0
	$DeboLoguearmeenRED = 0
	$TengoAccesoRED = 0
	ShellExecuteWait('CMD', ' /C EXPLORER.EXE "\\' & $IpCPUNegro & '"', '', '', @SW_HIDE)
	Whilenetworkventana()
	ventanaactual()
	If WinExists('Mis documentos') Or WinExists('Error de red') Then $FaltanDriversoConfigRED = 1
	If WinExists('Seguridad de Windows') Then $DeboLoguearmeenRED = 1
	If WinExists($IpCPUNegro) Then $TengoAccesoRED = 1
	$CodigoRED = $FaltanDriversoConfigRED & $DeboLoguearmeenRED & $TengoAccesoRED
	$exit = 0
	While WinExists('Mis documentos') Or WinExists($IpCPUNegro) Or WinExists('Seguridad de Windows') Or WinExists('Error de red') ; or WinExists('Menu Programas')
		WinClose('Mis documentos')
		WinClose($IpCPUNegro)
;~ 		WinClose('Menu Programas')
		If WinExists('Seguridad de Windows') Then ExitLoop
		WinClose('Error de red')
	WEnd

	Return $CodigoRED

EndFunc   ;==>EjecutaryVerVentanaRED

Func Whilenetworkventana()
	While Not WinExists('Mis documentos') And Not WinExists($IpCPUNegro) And Not WinExists('Seguridad de Windows') And Not WinExists('Error de red') And Not WinExists('Menu Programas')
		Sleep(300)
	WEnd
EndFunc   ;==>Whilenetworkventana

Func Loguearse()
	If $DebugFuncionesRED = 1 Then MsgBox(0, '', 'Estamos en funcion: Loguearse')
	If Not WinExists('Seguridad de Windows') And Not WinExists($IpCPUNegro) Then
		ShellExecuteWait('CMD', ' /C EXPLORER.EXE "\\' & $IpCPUNegro & '"', '', '', @SW_HIDE)
		Whilenetworkventana()
	EndIf
	If WinExists('Seguridad de Windows') Then

		;	MODIFICACION2222	!!!!	agregar login automatico
		If WinExists('Seguridad de Windows') Then ShellExecute('MenuLOGIN.exe', '', 'ResourcesMenu')
		;	MODIFICACION2222	!!!!	agregar login automatico

		WinWaitClose('Seguridad de Windows')
		$exit = 0
		While $exit < 25 And Not WinExists($IpCPUNegro)
			Sleep(100)
			$exit = $exit + 1
		WEnd
		If WinExists($IpCPUNegro) Then WinClose($IpCPUNegro)
	EndIf
	If WinExists($IpCPUNegro) Then WinClose($IpCPUNegro)
EndFunc   ;==>Loguearse

Func PreguntarInstalarDriversyConfigRED()
	If $DebugFuncionesRED = 1 Then MsgBox(0, '', 'Estamos en funcion: PreguntarInstalarDriversyConfigRED')

	$rta = MsgBox(260, 'Modo Network', 'Desea instalar los Drivers de RED?')
	If $rta = 6 Then
		InstalarDriversRED()
		configurarREDIpFija()
		ModoRED()
		MsgBox(0, '', 'termine ip fija')
	EndIf
	If $rta = 7 Then
		If 7 = MsgBox(4, 'RED', 'Ya configuro la red?') Then
			configurarREDIpFija()
			ModoRED()
		EndIf
	EndIf
EndFunc   ;==>PreguntarInstalarDriversyConfigRED

Func InstalarDriversRED()
	If $DebugFuncionesRED = 1 Then MsgBox(0, '', 'Estamos en funcion: InstalarDriversRED')

	If Not FileExists(@WindowsDir & '\driversREDinstalados') Then
		ShellExecuteWait('"DriverpackLANONLY.exe"', '', 'Driverpack17LANONLY')
		FileWrite(@WindowsDir & '\driversREDinstalados', '')
		$PedirConfiguracionRED = 'configurar'
		Return $PedirConfiguracionRED
	Else
		$driverslan = MsgBox(4, 'RED', 'Se detecto una instalacion de Drivers, desea REINSTALARLOS?')
		If $driverslan = 6 Then
			ShellExecuteWait('"DriverpackLANONLY.exe"', '', 'Driverpack17LANONLY')
			FileWrite(@WindowsDir & '\driversREDinstalados', '')
			$PedirConfiguracionRED = 'configurar'
			Return $PedirConfiguracionRED
		EndIf
	EndIf
EndFunc   ;==>InstalarDriversRED

Func Modificarregistroyreiniciar()
	If $DebugFuncionesRED = 1 Then MsgBox(0, '', 'Estamos en funcion: Modificarregistroyreiniciar')

	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System', 'EnableLinkedConnections', 'REG_DWORD', 1)
	If MsgBox(4, 'Modo Network', 'Registro de windows modificado, desea REINICIAR AHORA?') = 6 Then
		ShellExecuteWait('shutdown', ' /r /t 0')
		Exit
	Else
		MsgBox(0, 'Reinicio Necesario', 'NO CONTINUAR SIN REINICIAR')
		Exit
	EndIf
EndFunc   ;==>Modificarregistroyreiniciar

Func ventanaactual()
	If $DebugFuncionesRED = 1 Then MsgBox(0, '', 'Estamos en funcion: ventanaactual')

	$ventanaactual = ''
	$exit = 0
	While $exit < 10
		Sleep(100)
		If $ventanaactual = WinGetTitle('', '') Then
			$exit = $exit + 1
		Else
			$exit = 0
		EndIf
		$ventanaactual = WinGetTitle('', '')
	WEnd
EndFunc   ;==>ventanaactual

Func CableDesconectado()
	If $DebugFuncionesRED = 1 Then MsgBox(0, '', 'Estamos en funcion: CableDesconectado')

	While WinExists('Error de red')
		WinClose('Error de red')
	WEnd
	MsgBox(0, 'ERROR de RED', 'Error de Red, cable DESCONECTADO?')
	Exit
EndFunc   ;==>CableDesconectado

Func REDborracopiaDIRECTORIO($Carpetanetwork, $ProgDEL, $ProgCOPY)

	;		BORRA
	If FileExists(@HomeDrive & '\MenuRED2\' & $ProgDEL) And $ProgDEL <> '' Then DirRemove(@HomeDrive & '\MenuRED2\' & $ProgDEL, 1)
	If FileExists(@HomeDrive & '\MenuRED2\' & $ProgDEL) And $ProgDEL <> '' Then FileDelete(@HomeDrive & '\MenuRED2\' & $ProgDEL)
	;		BORRA
	;		COPIA
	SplashTextOn('Modo Net', 'Copiando de la Red', 160, 80, 0, 220)
	If StringLeft(FileGetAttrib('\\' & $Carpetanetwork & '\' & $ProgCOPY), 1) = 'A' And $ProgCOPY <> '' Then ShellExecuteWait('xcopy', '"' & '\\' & $Carpetanetwork & '\' & $ProgCOPY & '" "' & @HomeDrive & '\MenuRED2\' & '" /H /Y', '', '') ;,@SW_HIDE)
	If StringLeft(FileGetAttrib('\\' & $Carpetanetwork & '\' & $ProgCOPY), 1) = 'D' Then ShellExecuteWait('xcopy', '"' & '\\' & $Carpetanetwork & '\' & $ProgCOPY & '" "' & @HomeDrive & '\MenuRED2\' & $ProgCOPY & '\" /S /H /Y', '', '') ;,@SW_HIDE)
	SplashTextOn('Modo Net', 'Estamos en Modo NETWORK', 160, 80, 0, 220)
	;		COPIA


	;	MsgBox(0,'',$Carpetanetwork)
	;	MsgBox(0,'',$ProgCOPY)
	;	MsgBox(0,'',FileGetAttrib('\\'&$Carpetanetwork&'\'&$ProgCOPY))
	;	MsgBox(0,'','\\'&$Carpetanetwork&'\'&$ProgCOPY)

	;	ERROR
	If StringLeft(FileGetAttrib('\\' & $Carpetanetwork & '\' & $ProgCOPY), 1) <> 'D' And StringLeft(FileGetAttrib('\\' & $Carpetanetwork & '\' & $ProgCOPY), 1) <> 'A' Then MsgBox(0, '', 'No encontré lo que hay que copiar por la red.' & @CRLF & 'Al aceptar esta ventana se visualiza el archivo o directorio.')
	FileWrite(@DesktopDir & "\REDborracopiaDIRECTORIO.txt", 'ProgDEL: ' & $ProgDEL & '		ProgCOPY: ' & $ProgCOPY & @CRLF)
	If $ProgDEL = '' And $ProgCOPY = '' Then MsgBox(0, '', 'Falla en funcion REDborracopiaDIRECTORIO progdel y progcopy iguales a ' & "''")
	;	ERROR
EndFunc   ;==>REDborracopiaDIRECTORIO

Func ConfigurarREDDHCP()
	If $DebugFuncionesRED = 1 Then MsgBox(0, '', 'Estamos en funcion: ConfigurarREDDHCP. ESTA FUNCION CREO QUE nO se usa')
	;ShellExecuteWait('cmd.exe',' /C netsh interface ipv4 set address name="Conexión de área local" dhcp','','',@SW_HIDE)
	;AbrirventanaIP()
EndFunc   ;==>ConfigurarREDDHCP

Func AbrirventanaIP()
	If $DebugFuncionesRED = 1 Then MsgBox(0, '', 'Estamos en funcion: AbrirventanaIP')

	While WinExists('Conexiones de red')
		WinClose('Conexiones de red')
	WEnd
	ShellExecute('Ncpa.cpl')
	WinWait('Conexiones de red')
	WinActivate('Conexiones de red')
	WinWaitActive('Conexiones de red')
	Send('{space}{altdown}{enter}{altup}')
	WinWait('Propiedades de Conexión de área local')
	For $i = 0 To 15 Step 1
		If 'Protocolo de Internet versión 4 (TCP/IPv4)' = ControlListView('Propiedades de Conexión de área local', '', 'SysListView321', "GetText", $i) Then
			ControlListView('Propiedades de Conexión de área local', '', 'SysListView321', "Select", $i)
			ExitLoop
		EndIf
	Next
	ControlClick('Propiedades de Conexión de área local', '&Propiedades', 'Button4')
	WinWait('Propiedades: Protocolo de Internet versión 4 (TCP/IPv4)')
	WinWaitClose('Propiedades: Protocolo de Internet versión 4 (TCP/IPv4)')
	While WinExists('Propiedades de Conexión de área local')
		ControlClick('Propiedades de Conexión de área local', 'Cerrar', 'Button6')
		ControlClick('Propiedades de Conexión de área local', 'Aceptar', 'Button6')
	WEnd
	While WinExists('Conexiones de red')
		WinClose('Conexiones de red')
	WEnd
EndFunc   ;==>AbrirventanaIP

Func configurarREDIpFija()
	If $DebugFuncionesRED = 1 Then MsgBox(0, '', 'Estamos en funcion: configurarREDIpFija')
	$IPrandom = Random(10, 250, 1)

EndFunc   ;==>configurarREDIpFija



;  _____ _         _   _      _   						--------------------------------------------------------------------------------------------------
; |  ___(_)_ __   | \ | | ___| |_ 						--------------------------------------------------------------------------------------------------
; | |_  | | '_ \  |  \| |/ _ \ __|						--------------------------------------------------------------------------------------------------
; |  _| | | | | | | |\  |  __/ |_ 						--------------------------------------------------------------------------------------------------
; |_|   |_|_| |_| |_| \_|\___|\__|						--------------------------------------------------------------------------------------------------







If $ModoRED = 1 Then REDborracopiaDIRECTORIO($Carpetanetwork, '', 'Dont sleep')
If $DebugArrancarSolParaMostrarGUI = 0 Then ShellExecute('ResourcesMenu\Dont sleep\dontsleepyocultar.exe')



While ProcessExists('MenuSplashImagen.exe')
	ProcessClose('MenuSplashImagen.exe')
WEnd

If $ModoRED = 1 Then SplashTextOn('Modo Net', 'Estamos en Modo NETWORK', 160, 80, 0, 220)

Time()





;  ___       _      _          ____ _   _ ___			--------------------------------------------------------------------------------------------------
; |_ _|_ __ (_) ___(_) ___    / ___| | | |_ _|			--------------------------------------------------------------------------------------------------
;  | || '_ \| |/ __| |/ _ \  | |  _| | | || |			--------------------------------------------------------------------------------------------------
;  | || | | | | (__| | (_) | | |_| | |_| || |			--------------------------------------------------------------------------------------------------
; |___|_| |_|_|\___|_|\___/   \____|\___/|___|			--------------------------------------------------------------------------------------------------




Global $ret = 0
Global $botonconectarpresionado= 0




#Region ### START Koda GUI section ### Form=Menu.kxf
$Menu = GUICreate("Menu", 591, 546, 192, 1)
$GrupoFinalizar = GUICtrlCreateGroup("Finalizar", 412, 84, 81, 176)
$Sonido = GUICtrlCreateButton("Sonido", 422, 104, 55, 25)
$VerificarBOTON = GUICtrlCreateButton("Verificar", 422, 134, 55, 25)
$Limpieza = GUICtrlCreateButton("Limpieza", 422, 164, 55, 25)
$ButtonInspector = GUICtrlCreateButton("But. Insp.", 422, 194, 55, 25)
$BotonFuncTest = GUICtrlCreateButton("Func Test", 422, 224, 55, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$GrupoSincro = GUICtrlCreateGroup("Primero Actualizar", 406, 344, 97, 95)
$Button43 = GUICtrlCreateCheckbox("Sinc Nod 32", 418, 394, 80, 17)
$Button44 = GUICtrlCreateCheckbox("Sinc Mbam", 418, 414, 77, 17)
$Sincro = GUICtrlCreateButton("Sincro", 418, 364, 75, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Herramientas = GUICtrlCreateGroup("Herramientas", 502, 22, 81, 430)
$Devmgmt = GUICtrlCreateButton("Devmgmt", 512, 192, 55, 25)
$Panel = GUICtrlCreateButton("Panel", 512, 162, 55, 25)
$BotonCarpetaMenu = GUICtrlCreateButton("Menu", 512, 246, 55, 25)
$BotonSplash = GUICtrlCreateButton("Splash", 512, 102, 55, 25)
$BotonCarpetaMenuRED = GUICtrlCreateButton("MenuRED", 512, 272, 55, 25)
$QHacer = GUICtrlCreateButton("Q Hacer", 512, 350, 55, 25)
$FALTA = GUICtrlCreateButton("FALTA", 512, 380, 55, 25)
$MAL = GUICtrlCreateButton("MAL", 512, 410, 55, 25)
$P_Tareas = GUICtrlCreateButton("P. Tareas", 512, 320, 55, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$BotonCorrer = GUICtrlCreateButton("Correr", 20, 480, 75, 25)
$BotonSalir = GUICtrlCreateButton("Salir", 20, 510, 75, 25)
$OculExt = GUICtrlCreateButton("OculExt", 512, 498, 55, 25)
$MostExt = GUICtrlCreateButton("MostExt", 512, 468, 55, 25)
$BotonDesconectarInet = GUICtrlCreateButton("Des Inet", 422, 296, 55, 25)
$BotonConectarInet = GUICtrlCreateButton("Con Inet", 422, 266, 55, 25)
$Label1 = GUICtrlCreateLabel("Hay algo MAL", 182, 504, 101, 20)
GUICtrlSetFont(-1, 11, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
$osverarch = GUICtrlCreateInput("", 112, 480, 241, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
$Tab1 = GUICtrlCreateTab(0, 32, 401, 441)
GUICtrlSetFont(-1, 9, 400, 0, "Arial")
$TabSheet1 = GUICtrlCreateTabItem("Programas")
$Group11 = GUICtrlCreateGroup("", 192, 402, 89, 57)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button10 = GUICtrlCreateCheckbox("MBAM", 200, 432, 57, 17)
$Button20 = GUICtrlCreateCheckbox("Nod 32", 200, 416, 60, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group1 = GUICtrlCreateGroup("", 192, 146, 89, 33)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button52 = GUICtrlCreateCheckbox("Skype", 200, 157, 57, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group30 = GUICtrlCreateGroup("", 288, 103, 89, 49)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button39 = GUICtrlCreateCheckbox("libre", 296, 113, 69, 17)
$Button73 = GUICtrlCreateCheckbox("libre", 296, 129, 65, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group36 = GUICtrlCreateGroup("", 288, 283, 89, 33)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button31 = GUICtrlCreateCheckbox("Total C.", 296, 294, 58, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group33 = GUICtrlCreateGroup("", 288, 311, 89, 49)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button32 = GUICtrlCreateCheckbox("Unlocker", 296, 323, 70, 17)
$Button64 = GUICtrlCreateCheckbox("RED", 296, 339, 68, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group32 = GUICtrlCreateGroup("", 288, 239, 89, 49)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button17 = GUICtrlCreateCheckbox("WinRAR", 296, 250, 60, 17)
$Button42 = GUICtrlCreateCheckbox("USB Safe", 296, 266, 67, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group7 = GUICtrlCreateGroup("", 0, 391, 89, 73)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button25 = GUICtrlCreateCheckbox("Drv TPLink", 12, 402, 73, 17)
$Button77 = GUICtrlCreateCheckbox("SDI Drivers", 12, 418, 75, 17)
$Button62 = GUICtrlCreateCheckbox("TEST M.", 12, 434, 68, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group16 = GUICtrlCreateGroup("", 96, 226, 89, 161)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button11 = GUICtrlCreateCheckbox("Office 2003", 104, 236, 71, 17)
$Button12 = GUICtrlCreateCheckbox("Office 2007", 104, 252, 77, 17)
$Button14 = GUICtrlCreateCheckbox("Office 2010", 104, 292, 77, 17)
$Button49 = GUICtrlCreateCheckbox("DLL SUITE", 104, 276, 77, 17)
$Button63 = GUICtrlCreateCheckbox("Office 2016", 104, 348, 74, 17)
$Button60 = GUICtrlCreateCheckbox("Office 2013", 104, 332, 74, 17)
$Button48 = GUICtrlCreateCheckbox("Val Off 2010", 104, 308, 75, 17)
$Button47 = GUICtrlCreateCheckbox("Res", 408, 598, 35, 17)
$Button46 = GUICtrlCreateCheckbox("Off 19 w10", 104, 364, 75, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group14 = GUICtrlCreateGroup("", 192, 174, 89, 81)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button35 = GUICtrlCreateCheckbox("FDM", 200, 218, 50, 17)
$Button50 = GUICtrlCreateCheckbox("Ares", 200, 186, 47, 17)
$Button76 = GUICtrlCreateCheckbox("YouT. DL", 200, 234, 75, 17)
$Button57 = GUICtrlCreateCheckbox("qBittorrent", 200, 202, 65, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group28 = GUICtrlCreateGroup("", 96, 102, 89, 125)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$InputHalted = GUICtrlCreateInput("", 159, 203, 21, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_NUMBER))
$Button1 = GUICtrlCreateCheckbox("Autoit", 104, 116, 57, 17)
$Button18 = GUICtrlCreateCheckbox("Sist inicio", 104, 132, 64, 17)
$Button19 = GUICtrlCreateCheckbox("Sist final", 104, 148, 63, 17)
$Button74 = GUICtrlCreateCheckbox("Conectar", 104, 166, 66, 15)
$Button69 = GUICtrlCreateCheckbox("Halted", 104, 204, 50, 17)
GUICtrlSetColor(-1, 0xFFFF00)
$Button68 = GUICtrlCreateCheckbox("Paquete", 104, 182, 58, 15)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group26 = GUICtrlCreateGroup("", 0, 162, 89, 47)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button26 = GUICtrlCreateCheckbox("Act XP", 12, 172, 55, 17)
$Button27 = GUICtrlCreateCheckbox("Act W7", 12, 188, 55, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group25 = GUICtrlCreateGroup("", 0, 206, 89, 48)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button7 = GUICtrlCreateCheckbox("IE8", 12, 234, 45, 17)
$Button28 = GUICtrlCreateCheckbox("WMP 11", 12, 218, 67, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group22 = GUICtrlCreateGroup("", 192, 250, 89, 33)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button40 = GUICtrlCreateCheckbox("Disk Clean", 200, 262, 71, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group10 = GUICtrlCreateGroup("", 96, 390, 89, 65)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button29 = GUICtrlCreateCheckbox("Foxit R.", 104, 416, 55, 17)
$Button30 = GUICtrlCreateCheckbox("PDFLite", 104, 432, 57, 17)
$Button66 = GUICtrlCreateCheckbox("Damn NFO", 104, 400, 75, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group9 = GUICtrlCreateGroup("", 288, 147, 89, 97)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button9 = GUICtrlCreateCheckbox("K-Lite", 296, 157, 49, 17)
$Button15 = GUICtrlCreateCheckbox("libre", 296, 189, 58, 17)
$Button41 = GUICtrlCreateCheckbox("Winamp", 296, 173, 60, 17)
$Button45 = GUICtrlCreateCheckbox("Extens", 296, 221, 53, 17)
$Button65 = GUICtrlCreateCheckbox("GSpot", 296, 205, 55, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group8 = GUICtrlCreateGroup("", 192, 102, 89, 49)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button2 = GUICtrlCreateCheckbox("Chrome", 200, 113, 57, 17)
$Button3 = GUICtrlCreateCheckbox("Firefox", 200, 129, 57, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group5 = GUICtrlCreateGroup("", 0, 250, 89, 141)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button8 = GUICtrlCreateCheckbox("Java", 12, 372, 57, 17)
$Button21 = GUICtrlCreateCheckbox("NetF 1-1", 12, 260, 58, 17)
$Button22 = GUICtrlCreateCheckbox("NetF 3-5", 12, 276, 58, 17)
$Button23 = GUICtrlCreateCheckbox("NetF 4", 12, 308, 50, 17)
$Button33 = GUICtrlCreateCheckbox("DirectX", 12, 340, 65, 17)
$Button72 = GUICtrlCreateCheckbox("libre", 12, 324, 67, 17)
$Button67 = GUICtrlCreateCheckbox("VcRedist", 12, 356, 65, 17)
$Button53 = GUICtrlCreateCheckbox("Net 3 8-10", 12, 292, 74, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group4 = GUICtrlCreateGroup("", 192, 278, 89, 129)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button4 = GUICtrlCreateCheckbox("ImgBurn", 200, 288, 67, 17)
$Button5 = GUICtrlCreateCheckbox("CDBurnXP", 200, 304, 79, 17)
$Button51 = GUICtrlCreateCheckbox("EZ CD", 200, 384, 47, 17)
$Button70 = GUICtrlCreateCheckbox("Nero 2017", 200, 336, 66, 17)
$Button59 = GUICtrlCreateCheckbox("Nero 7", 200, 320, 75, 17)
$Button56 = GUICtrlCreateCheckbox("DT Lite", 200, 352, 79, 17)
$Button55 = GUICtrlCreateCheckbox("UltraISO", 200, 368, 57, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group3 = GUICtrlCreateGroup("", 288, 356, 89, 49)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button75 = GUICtrlCreateCheckbox("REINICIAR", 296, 382, 74, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button71 = GUICtrlCreateCheckbox("VERIFICAR", 296, 366, 85, 17)
GUICtrlSetFont(-1, 9, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
GUICtrlSetBkColor(-1, 0x00FF00)
$Group6 = GUICtrlCreateGroup("", 0, 102, 89, 65)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button24 = GUICtrlCreateCheckbox("Val XP", 12, 113, 69, 17)
$Button58 = GUICtrlCreateCheckbox("Val 8-10", 12, 145, 74, 17)
$Button54 = GUICtrlCreateCheckbox("Val W7", 12, 129, 69, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$BotonDefaultOS = GUICtrlCreateButton("DefaultOS", 5, 68, 55, 25)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$BotonDeselec = GUICtrlCreateButton("Deselec", 61, 68, 47, 25)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Sin_Drive = GUICtrlCreateButton("No Drive", 269, 68, 47, 25)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$BotonConectar = GUICtrlCreateButton("Conectar", 223, 68, 47, 25)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button6 = GUICtrlCreateCheckbox("Res", 356, 446, 35, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button13 = GUICtrlCreateCheckbox("Res", 356, 446, 35, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button16 = GUICtrlCreateCheckbox("Res", 356, 446, 35, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button34 = GUICtrlCreateCheckbox("Res", 356, 446, 35, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button36 = GUICtrlCreateCheckbox("Res", 356, 446, 35, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button37 = GUICtrlCreateCheckbox("Res", 356, 446, 35, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button38 = GUICtrlCreateCheckbox("Res", 356, 446, 35, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Backupdrivers = GUICtrlCreateCheckbox("Bup Drivers", 284, 448, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$BotonSysprep = GUICtrlCreateButton("1 Sys", 321, 68, 31, 25)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button80 = GUICtrlCreateCheckbox("AVISO REINICIO", 284, 408, 105, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$TabSheet3 = GUICtrlCreateTabItem("Sysprep")
$BotonSysprep2 = GUICtrlCreateButton("2 Sys", 33, 87, 31, 25)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$BotonConectar2 = GUICtrlCreateButton("Conectar", 70, 87, 47, 25)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$TabSheet4 = GUICtrlCreateTabItem("Progs")
GUICtrlSetState(-1,$GUI_SHOW)
$Button301 = GUICtrlCreateCheckbox("Winmerge", 12, 432, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button302 = GUICtrlCreateCheckbox("AIMP", 12, 112, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button304 = GUICtrlCreateCheckbox("Acad 2014", 12, 96, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button303 = GUICtrlCreateCheckbox("Acad 2010", 12, 80, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button305 = GUICtrlCreateCheckbox("7 Zip", 12, 64, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button307 = GUICtrlCreateCheckbox("HxD Hexa", 12, 208, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button306 = GUICtrlCreateCheckbox("EWSA 7", 12, 176, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button308 = GUICtrlCreateCheckbox("jDownloader", 12, 224, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button310 = GUICtrlCreateCheckbox("MegaD. Plus", 12, 256, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button309 = GUICtrlCreateCheckbox("LiLi USB Cr", 12, 240, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button311 = GUICtrlCreateCheckbox("Notepad++", 12, 272, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button312 = GUICtrlCreateCheckbox("R-Studio 7", 12, 288, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button313 = GUICtrlCreateCheckbox("System Expl", 12, 320, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button314 = GUICtrlCreateCheckbox("TeamViewer", 12, 336, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button315 = GUICtrlCreateCheckbox("Teracopy 3", 12, 352, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button316 = GUICtrlCreateCheckbox("Uniextract2", 12, 368, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button317 = GUICtrlCreateCheckbox("Virtualbox", 12, 384, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button318 = GUICtrlCreateCheckbox("VirusTotal", 12, 400, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button319 = GUICtrlCreateCheckbox("VLC Player", 12, 416, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button322 = GUICtrlCreateCheckbox("Hashcheck", 188, 168, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button321 = GUICtrlCreateCheckbox("Allway Sync", 12, 128, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button320 = GUICtrlCreateCheckbox("Yawcam", 12, 448, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button323 = GUICtrlCreateCheckbox("Revo Unins", 12, 304, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button324 = GUICtrlCreateCheckbox("aTube", 12, 144, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button326 = GUICtrlCreateCheckbox("Movavi Vid", 188, 118, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button325 = GUICtrlCreateCheckbox("AVS video", 188, 99, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button327 = GUICtrlCreateCheckbox("IDM", 188, 190, 75, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button328 = GUICtrlCreateCheckbox("Active Undelete", 188, 206, 99, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button329 = GUICtrlCreateCheckbox("Easy BCD", 188, 222, 99, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button330 = GUICtrlCreateCheckbox("Programadores", 188, 246, 99, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button332 = GUICtrlCreateCheckbox("FL Studio 20", 188, 319, 99, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button331 = GUICtrlCreateCheckbox("Gamepads", 188, 304, 99, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button333 = GUICtrlCreateCheckbox("Cloud Mounter", 188, 335, 99, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button334 = GUICtrlCreateCheckbox("Picasa", 188, 352, 99, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button335 = GUICtrlCreateCheckbox("Livew. PCBWiz.", 188, 262, 99, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button336 = GUICtrlCreateCheckbox("Mipony", 188, 368, 99, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button337 = GUICtrlCreateCheckbox("Firefox Ext Varias", 188, 384, 99, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button339 = GUICtrlCreateCheckbox("PaintNET", 188, 416, 65, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button338 = GUICtrlCreateCheckbox("Everything", 188, 400, 69, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button340 = GUICtrlCreateCheckbox("Google Drive", 188, 432, 89, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Deselec2 = GUICtrlCreateButton("Deselec", 138, 63, 47, 25)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button341 = GUICtrlCreateCheckbox("OpenHashTab", 188, 152, 89, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button342 = GUICtrlCreateCheckbox("Handbrake", 188, 448, 89, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
GUICtrlCreateTabItem("")
$TildeDeapasos = GUICtrlCreateCheckbox("DE A PASOS", 418, 454, 93, 17)
GUICtrlSetFont(-1, 9, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x0000FF)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

		CorrerUnaUnicaVez()
;$unicavez = 1

While 1
;~ 	If $unicavez = 1 Then
;~ 		$unicavez = 0
;~ 	EndIf

	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Salir()
		Case $BotonSalir
			Salir()
		Case $BotonCorrer
			$cont = 1
			$rta = 7

;~ 			if $cont=1 and not WinExists('falta: Bloc de notas') Then $rta=MsgBox(4,'FALTA.txt','Desea revisar el archivo Falta.txt antes de continuar?')
;~ 			if $rta=6 then ShellExecute('falta.txt')
;~ 			if $rta=6 then $cont=0

			If $cont = 1 And $ModoRED = 1 And 1 = MsgBox(1, 'Menu', 'Sacar splash?') Then SplashOff()

			;$rta = 0
			;If $cont = 1 And CheckSiHayJuegosSelec() = 0 Then $rta = MsgBox(1, 'Menu', 'No seleccionó JUEGOS. Desea continuar?')
			;$rta=1
			;MsgBox(0,'',$rta)
			;If $rta = 2 Then $cont = 0

			If $cont = 1 And GUICtrlRead($Button80) = 1 Then $rta = MsgBox(1, 'Menu', 'Ha seleccionado REINICIAR. Desea continuar?')

			If $rta = 2 Then $cont = 0



			If $cont = 1 Then $rta = MsgBox(1, 'Menu', 'Largamos, cancela o dale para adelante')
			If $rta = 2 Then $cont = 0

			If $cont = 1 Then Botoncorrer()

		Case $Limpieza
			Limpieza()
		Case $FALTA
			If WinExists('FALTA.txt: Bloc de notas') Then
				WinActivate('FALTA.txt: Bloc de notas')
			Else
				If $ModoRED = 1 Then
					ShellExecuteWait('\\' & $Carpetanetwork & '\FALTA.txt')
				Else
					ShellExecute(ruta() & '\FALTA.txt')
				EndIf
			EndIf

		Case $MAL
			If WinExists('Mal Instalado.txt: Bloc de notas') Or WinExists('Mal Instalado: Bloc de notas') Then
				If WinExists('Mal Instalado.txt: Bloc de notas') Then WinActivate('Mal Instalado.txt: Bloc de notas')
				If WinExists('Mal Instalado: Bloc de notas') Then WinActivate('Mal Instalado: Bloc de notas')
			Else
				If FileExists(@DesktopDir & '\Mal Instalado.txt') Then ShellExecute(@DesktopDir & '\Mal Instalado.txt')
			EndIf
		Case $Sincro
			If GUICtrlRead($Button43) = 1 Then Sinc_Nod_32()
			If GUICtrlRead($Button44) = 1 Then Sinc_Mbam()

		Case $ButtonInspector
			ButtonInspector()
		Case $P_Tareas
			PTareas()
		Case $Panel
			ShellExecute('control.exe')
		Case $QHacer
			If WinExists('QUE HACER EN PC nuevo: Bloc de notas') Then
				WinActivate('QUE HACER EN PC nuevo: Bloc de notas')
				WinMove('QUE HACER EN PC nuevo: Bloc de notas', '', 165, 0)
			Else
				If FileExists(@DesktopDir & '\QUE HACER EN PC nuevo.txt') Then ShellExecute(@DesktopDir & '\QUE HACER EN PC nuevo.txt')
			EndIf
		Case $BotonFuncTest
			TEST()
		Case $BotonSplash
			SplashOff()
		Case $InputHalted
			$max=6
			if GUICtrlRead($InputHalted)>$max Then
				MsgBox(0,'','Halted hasta '&$max)
				GUICtrlSetData($InputHalted,Random(1,$max,1))
			EndIf

		Case $BotonConectarInet
			If $ModoRED = 0 Then
				MsgBox(0, '', 'Solo con modo red')
			ElseIf $ModoRED = 1 Then
				SplashTextOn('Modo Net', 'Conectando, espere', 160, 80, 0, 220)
				FileWrite('Conectar', '')
				ShellExecuteWait('xcopy', '"Conectar" "' & '\\' & $Carpetanetwork & '\ResourcesMenu\Internet Connection Sharing Auto"' & ' /H /Y', '', '', @SW_HIDE)
				FileDelete('Conectar')
				Sleep(5000)
				SplashTextOn('Modo Net', 'Recuerde sacar y poner el cable', 160, 80, 0, 220)
				Sleep(5000)
				SplashOff()
			EndIf
		Case $BotonDesconectarInet
			If $ModoRED = 0 Then
				MsgBox(0, '', 'Solo con modo red')
			ElseIf $ModoRED = 1 Then
				SplashTextOn('Modo Net', 'Desconectando, espere', 160, 80, 0, 220)
				FileWrite('Desconectar', '')
				ShellExecuteWait('xcopy', '"Desconectar" "' & '\\' & $Carpetanetwork & '\ResourcesMenu\Internet Connection Sharing Auto"' & ' /H /Y', '', '', @SW_HIDE)
				FileDelete('Desconectar')
				Sleep(5000)
				SplashTextOn('Modo Net', 'Recuerde sacar y poner el cable', 160, 80, 0, 220)
				Sleep(5000)
				SplashOff()
			EndIf


		Case $OculExt
			OculExt()
		Case $MostExt
			MostExt()
		Case $Devmgmt
			ShellExecute('devmgmt.msc')
		Case $Sonido
			Sonido()
		Case $VerificarBOTON
			ponerestados()

			If @OSArch = 'X86' Then ShellExecuteWait('AutoIt3.exe', 'Menuverificar.au3', 'Modificaciones Sistema')
			If @OSArch = 'X64' Then ShellExecuteWait('AutoIt3_x64.exe', 'Menuverificar.au3', 'Modificaciones Sistema')

			sacarestados()
		Case $BotonCarpetaMenu
			CarpetaMenu(ruta())
		Case $BotonCarpetaMenuRED
			CarpetaMenuRED($Carpetanetwork)

;~ 		Case $Button39	;Tuneup
;~ 			if GUICtrlRead ($Button39)=1 then
;~ 				ControlCommand('Menu','',$Button40,'uncheck')
;~ 			EndIf
;~ 		Case $Button40	;Tuneup
;~ 			if GUICtrlRead ($Button40)=1 then
;~ 				ControlCommand('Menu','',$Button39,'uncheck')
;~ 			EndIf

		Case $Button11 ;Office 2003
			If GUICtrlRead($Button11) = 1 Then
				ControlCommand('Menu', '', $Button12, 'uncheck')
				ControlCommand('Menu', '', $Button14, 'uncheck')
				ControlCommand('Menu', '', $Button60, 'uncheck')
				ControlCommand('Menu', '', $Button63, 'uncheck')
				ControlCommand('Menu', '', $Button46, 'uncheck')
;~ 				ControlCommand('Menu','',$Button75,'uncheck')		;REINICIAR Y MENUVERIF
;~ 				ControlCommand('Menu','',$Button79,'uncheck')		;REINICIAR Y MENUVERIF
				ControlCommand('Menu', '', $Button49, 'uncheck') ;DLL SUITE
			EndIf

		Case $Button12 ;Office 2007
			If GUICtrlRead($Button12) = 1 Then
				ControlCommand('Menu', '', $Button11, 'uncheck')
				ControlCommand('Menu', '', $Button14, 'uncheck')
				ControlCommand('Menu', '', $Button60, 'uncheck')
				ControlCommand('Menu', '', $Button63, 'uncheck')
				ControlCommand('Menu', '', $Button46, 'uncheck')
;~ 				ControlCommand('Menu','',$Button75,'uncheck')		;REINICIAR Y MENUVERIF
;~ 				ControlCommand('Menu','',$Button79,'uncheck')		;REINICIAR Y MENUVERIF
				ControlCommand('Menu', '', $Button49, 'uncheck') ;DLL SUITE
			EndIf

		Case $Button14 ;Office 2010
			If GUICtrlRead($Button14) = 1 Then
				ControlCommand('Menu', '', $Button11, 'uncheck')
				ControlCommand('Menu', '', $Button12, 'uncheck')
				ControlCommand('Menu', '', $Button60, 'uncheck')
				ControlCommand('Menu', '', $Button63, 'uncheck')
				ControlCommand('Menu', '', $Button46, 'uncheck')
				If @OSVersion = 'WIN_7' Then ControlCommand('Menu', '', $Button49, 'check') ;DLL SUITE
				ControlCommand('Menu', '', $Button80, 'check') ;AVISO Reinicio
				ControlCommand('Menu', '', $Button48, 'check') ;Act Office 2010
				ControlCommand('Menu', '', $Button44, 'check') ;AVISO Reiniciar
				If @OSVersion = 'WIN_XP' Then MsgBox(0, '', 'Office 2010 en XP ver si es o no necesario usar DLL Suite.' & @CRLF & 'si es necesario agregar en el menu case office_2010, osea en donde está ésta linea')
			EndIf

		Case $Button60 ;Office 2013
			If GUICtrlRead($Button60) = 1 Then
				ControlCommand('Menu', '', $Button11, 'uncheck')
				ControlCommand('Menu', '', $Button12, 'uncheck')
				ControlCommand('Menu', '', $Button14, 'uncheck')
				ControlCommand('Menu', '', $Button63, 'uncheck')
				ControlCommand('Menu', '', $Button46, 'uncheck')
;~ 				ControlCommand('Menu','',$Button75,'uncheck')		;REINICIAR Y MENUVERIF
;~ 				ControlCommand('Menu','',$Button79,'uncheck')		;REINICIAR Y MENUVERIF
				ControlCommand('Menu', '', $Button49, 'uncheck') ;DLL SUITE
			EndIf

		Case $Button63 ;Office 2016
			If GUICtrlRead($Button63) = 1 Then
				ControlCommand('Menu', '', $Button11, 'uncheck')
				ControlCommand('Menu', '', $Button12, 'uncheck')
				ControlCommand('Menu', '', $Button14, 'uncheck')
				ControlCommand('Menu', '', $Button60, 'uncheck')
				ControlCommand('Menu', '', $Button46, 'uncheck')
;~ 				ControlCommand('Menu','',$Button75,'uncheck')		;REINICIAR Y MENUVERIF
;~ 				ControlCommand('Menu','',$Button79,'uncheck')		;REINICIAR Y MENUVERIF
				ControlCommand('Menu', '', $Button49, 'uncheck') ;DLL SUITE
			EndIf

		Case $Button46 ;Office 2019
			If GUICtrlRead($Button46) = 1 Then
				ControlCommand('Menu', '', $Button11, 'uncheck')
				ControlCommand('Menu', '', $Button12, 'uncheck')
				ControlCommand('Menu', '', $Button14, 'uncheck')
				ControlCommand('Menu', '', $Button60, 'uncheck')
				ControlCommand('Menu', '', $Button63, 'uncheck')
;~ 				ControlCommand('Menu','',$Button75,'uncheck')		;REINICIAR Y MENUVERIF
;~ 				ControlCommand('Menu','',$Button79,'uncheck')		;REINICIAR Y MENUVERIF
				ControlCommand('Menu', '', $Button49, 'uncheck') ;DLL SUITE
			EndIf

		Case $Sin_Drive
			ControlCommand('Menu', '', $Button4, 'uncheck') ;IMGBURN
			ControlCommand('Menu', '', $Button5, 'uncheck') ;CDBURNERXP
			ControlCommand('Menu', '', $Button51, 'uncheck') ;EZCD
			ControlCommand('Menu', '', $Button59, 'uncheck') ;NERO7
			ControlCommand('Menu', '', $Button70, 'uncheck') ;NERO 2017

		Case $BotonConectar
			botonconectar()
			funcionconectar()

		Case $BotonConectar2
			botonconectar()
			funcionconectar()


		Case $Button74
			If $botonconectarpresionado=0 and GUICtrlRead($Button74) = 1 then ControlClick($Menu,'',$BotonConectar)
			$botonconectarpresionado=0

		Case $Button73
			If GUICtrlRead($Button73) = 1 And @OSVersion <> 'WIN_XP' Then
				ControlCommand('Menu', '', $Button73, 'check')
;~ 				GUICtrlSetState('Framework 4.6.1',$GUI_CHECKED);('Menu','','Button12','uncheck')
			EndIf

		Case $Button20
			If GUICtrlRead($Button20) = 1 And @OSVersion = 'WIN_XP' Then
				ControlCommand('Menu', 'NET Framework 3-5', $Button22, 'check')
			EndIf

			;"WIN_10", "WIN_81", "WIN_8",
			If GUICtrlRead($Button20) = 1 And (@OSVersion = 'WIN_10' Or @OSVersion = 'WIN_81' Or @OSVersion = 'WIN_8') Then
				ControlCommand('Menu', 'Net 3-5 W8-10', $Button53, 'check')
			EndIf
		Case $Button59 ;NERO 7
			If GUICtrlRead($Button59) = 1 Then
				ControlCommand('Menu', '', $Button33, 'check') ;DirectX
				ControlCommand('Menu', '', $Button70, 'uncheck')
			EndIf
		Case $Button70 ;NERO 2017
			If GUICtrlRead($Button70) = 1 Then
				ControlCommand('Menu', '', $Button59, 'uncheck')

			EndIf
		Case $Button71 ;VERIFICAR
			If GUICtrlRead($Button77) = 1 Then ;sdi driver
				ControlCommand('Menu', '', $Button75, 'check') ;REINICIAR Y MENUVERIF
			EndIf

		Case $Button75
			ControlCommand('Menu', '', $Button80, 'check') ;AVISO Reinicio

		Case $BotonSysprep
			$sysprep1 = 1

			ControlCommand('Menu', '', $Button48, 'Uncheck') ;Validar off 2010			;debe instalarse desp de nod 32
			ControlCommand('Menu', '', $Button20, 'Uncheck') ;nod			;Falla W7
			ControlCommand('Menu', '', $Button54, 'Uncheck') ;val w7			;Falla W7
			ControlCommand('Menu', '', $Button58, 'Uncheck') ;val w8-10			;Falla W
			ControlCommand('Menu', '', $Button69, 'Uncheck') ;halted			;post
			ControlCommand('Menu', '', $Button77, 'Uncheck') ;sdi			;post
			ControlCommand('Menu', '', $Button25, 'Uncheck') ;tplink			;post
			ControlCommand('Menu', '', $Button74, 'Uncheck') ;conectar		;post


		Case $BotonSysprep2
			$sysprep2 = 1
			ControlCommand('Menu', '', $Button71, 'check') ;VERIFICAR		;post
			ControlCommand('Menu', '', $Button68, 'check') ;PAQUETE			;post
			ControlCommand('Menu', '', $Button69, 'check') ;halted			;post
			ControlCommand('Menu', '', $Button77, 'check') ;sdi				;post
			ControlCommand('Menu', '', $Button25, 'check') ;tplink			;post
			If @OSVersion = 'WIN_7' Then
				ControlCommand('Menu', '', $Button20, 'check') ;nod			;Falla W7

				;If GUICtrlRead($Button48) = 1 and $sysprep1 = 0 Then ActOff2010()
				ControlCommand('Menu', '', $Button48, 'check') ;Validar off 2010			;debe instalarse desp de nod 32

				ControlCommand('Menu', '', $Button54, 'check') ;val w7			;Falla W7
				ControlCommand('Menu', '', $Button75, 'check') ;REINICIAR Y MENUVERIF
;~ 				ControlCommand('Menu', '', $Button79, 'check') ;REINICIAR Y MENUVERIF
			EndIf
			If @OSVersion = 'WIN_81' or @OSVersion = 'WIN_10' Then
				ControlCommand('Menu', '', $Button58, 'check') ;nod			;Falla W7
			EndIf
			If @OSVersion = 'WIN_10' Then
				ControlCommand('Menu', '', $Button63, 'check') ;SOLO VALIDAR OFFICE 2016
				ControlSetText($Menu,'',$Button63,'ActOff16')
			EndIf


;~-------- 			AGREGAR EL NRO DE BOTON LO DESACTIVA. esto en pestaña PROGRAMAS

		Case $BotonDefaultOS
			DefOs()
		Case $BotonDeselec
			deselec()
		Case $Deselec2
			deselec()
			;~------------------------------------------------------------------------

	EndSwitch
WEnd




;  ___       _      _         _____                   ____              _			----------------------------------------------------------------------
; |_ _|_ __ (_) ___(_) ___   |  ___|   _ _ __   ___  |  _ \ _ __   __ _| |			----------------------------------------------------------------------
;  | || '_ \| |/ __| |/ _ \  | |_ | | | | '_ \ / __| | |_) | '_ \ / _` | |			----------------------------------------------------------------------
;  | || | | | | (__| | (_) | |  _|| |_| | | | | (__  |  __/| |_) | (_| | |			----------------------------------------------------------------------
; |___|_| |_|_|\___|_|\___/  |_|   \__,_|_| |_|\___| |_|   | .__/ \__,_|_|			----------------------------------------------------------------------
;                                                          |_|						----------------------------------------------------------------------


Func deselec()
	For $i = 0 To 80 Step 1
		ControlCommand('Menu', '', Eval('Button' & $i), 'uncheck')
	Next

	For $i = 301 To 350 Step 1
		ControlCommand('Menu', '', Eval('Button' & $i), 'uncheck')
	Next
MsgBox(0,'','des')
	$sysprep1 = 0
	$sysprep2 = 0
	$ret = 0
EndFunc

func DefOS()
	;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	if @OSVersion='WIN_XP' Then
		For $i = 1 To 80 Step 1
			If $i <> 10 And $i <> 74 And $i <> 75 And $i <> 62 And $i <> 59 And $i <> 79 And $i <> 70 And $i <> 48 And $i <> 78 And $i <> 16 And $i <> 34 And $i <> 80 And $i <> 55 And $i <> 54 And $i <> 60 And $i <> 56 And $i <> 63 And $i <> 73 And $i <> 58 And $i <> 44 And $i <> 43 And $i <> 11 And $i <> 14 And $i <> 53 And $i <> 35 And $i <> 37 And $i <> 27 And $i <> 46 And $i <> 47 And $i <> 49 And $i <> 29 And $i <> 11 And $i <> 83 And $i <> 13 And $i <> 38 And $i <> 6 And $i <> 36 Then
				ControlCommand('Menu', '', Eval('Button' & $i), 'check')
			EndIf
		Next
	EndIf
	;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	if @OSVersion='WIN_7' Then
		For $i = 1 To 80 Step 1
			If $i <> 2 And $i <> 10 And $i <> 74 And $i <> 21 And $i <> 75 And $i <> 79 And $i <> 59 And $i <> 78 And $i <> 70 And $i <> 16 And $i <> 48 And $i <> 34 And $i <> 46 And $i <> 55 And $i <> 7 And $i <> 56 And $i <> 60 And $i <> 44 And $i <> 63 And $i <> 58 And $i <> 24 And $i <> 26 And $i <> 28 And $i <> 22 And $i <> 23 And $i <> 35 And $i <> 47 And $i <> 37 And $i <> 11 And $i <> 12 And $i <> 13 And $i <> 36 And $i <> 38 And $i <> 6 And $i <> 43 And $i <> 53 Then
				ControlCommand('Menu', '', Eval('Button' & $i), 'check')
			EndIf
		Next
		if @OSArch='x86' then ControlCommand('Menu', '', Eval('Button62'), 'Uncheck')
	EndIf
	;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	if @OSVersion='WIN_8' or @OSVersion='WIN_81' Then
		For $i = 1 To 80 Step 1
			If $i <> 2 and $i <> 10 And $i <> 20 And $i <> 62 And $i <> 70 And $i <> 74 And $i <> 75 And $i <> 79 And $i <> 78 And $i <> 16 And $i <> 48 And $i <> 34 And $i <> 46 And $i <> 80 And $i <> 59 And $i <> 55 And $i <> 7 And $i <> 48 And $i <> 49 And $i <> 11 And $i <> 12 And $i <> 14 And $i <> 63 And $i <> 56 And $i <> 27 And $i <> 44 And $i <> 54 And $i <> 47 And $i <> 24 And $i <> 26 And $i <> 28 And $i <> 21 And $i <> 22 And $i <> 35 And $i <> 37 And $i <> 13 And $i <> 36 And $i <> 38 And $i <> 6 And $i <> 43 Then
				ControlCommand('Menu', '', Eval('Button' & $i), 'check')
			EndIf
		Next
	EndIf
	;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	if @OSVersion='WIN_10' Then
		For $i = 1 To 80 Step 1
			If $i <> 2 and $i <> 10 And $i <> 20 And $i <> 62 And $i <> 70 And $i <> 74 And $i <> 75 And $i <> 79 And $i <> 78 And $i <> 16 And $i <> 48 And $i <> 34 And $i <> 46 And $i <> 80 And $i <> 59 And $i <> 55 And $i <> 7 And $i <> 48 And $i <> 49 And $i <> 11 And $i <> 12 And $i <> 14 And $i <> 60 And $i <> 56 And $i <> 27 And $i <> 44 And $i <> 54 And $i <> 47 And $i <> 24 And $i <> 26 And $i <> 28 And $i <> 21 And $i <> 22 And $i <> 35 And $i <> 37 And $i <> 13 And $i <> 36 And $i <> 38 And $i <> 6 And $i <> 43 Then
				ControlCommand('Menu', '', Eval('Button' & $i), 'check')
			EndIf
		Next
	EndIf
;~ 	;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	For $i = 1 To 80 Step 1
		If ControlGetText('Menu', '', Eval('Button' & $i))='libre' then ControlCommand('Menu', '', Eval('Button' & $i), 'uncheck')
	Next
	;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	if @OSVersion<>'WIN_XP' and @OSVersion<>'WIN_7' and @OSVersion<>'WIN_8' and @OSVersion<>'WIN_81' and @OSVersion<>'WIN_10' Then MsgBox(0,'Default','La version actual de Windows no está definida.')
	;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	;~------------------------------------------------------------------------

EndFunc


func cerrardontsleep()
	While ProcessExists('DontSleep.exe') Or ProcessExists('DontSleep_x64.exe') or ProcessExists('dontsleepyocultar.exe')
		ProcessClose('DontSleep.exe')
		ProcessClose('DontSleep_x64.exe')
		ProcessClose('dontsleepyocultar.exe')
	WEnd
	If $ModoRED = 1 Then REDborracopiaDIRECTORIO($Carpetanetwork, 'Dont sleep', '')
EndFunc

func salir()
		;---- 	VENT RED	------
	;if $ModoRED=1 and 6=MsgBox(4,'Modo Network','Desea configurar a default la RED??') Then ConfigurarREDDHCP()
	If $ModoRED = 1 Then ConfigurarREDDHCP()
	;---- 	VENT RED	------
	if FileExists('ListaInstalar.txt') then
		$resp=MsgBox(4,'ListaInstalar','Hay pendiente una lista para instalar:'&@CRLF&@CRLF&'Si -> Borrar lista y cerrar'&@CRLF&'No -> Dejar lista y cerrar (SOLO SI VAS A CONTINUAR LA INSTALACION DESPUES)')
		if $resp=6 then FileDelete('ListaInstalar.txt')
	EndIf

	cerrardontsleep()
	sacartareaprog()
	Exit

EndFunc


Func Botoncorrer()


;Creo Tarea Continuar y borro Tarea de UNATTEND
	TareaProgContinuar()
	ShellExecuteWait('cmd.exe', ' /C schtasks /end /TN "Menu Continuar Unattend"', '', '', @SW_HIDE)
	ShellExecuteWait('cmd.exe', ' /C schtasks /delete /TN "Menu Continuar Unattend" /F', '', '', @SW_HIDE)


;Ejecuto MenuNOReinicio
	ShellExecute(@ScriptDir&'\ResourcesMenu\MenuNOReinicio.exe','',@ScriptDir&'\ResourcesMenu')



	if GUICtrlRead($TildeDeapasos) = 1 then
		global $deapasos=1
	else
		global $deapasos=0



	EndIf

	;~ ---------------------	Aplicaciones iniciales	  ----------------------
	If FileExists(@DesktopDir & "\Bien Instalado.txt") Then FileWrite(@DesktopDir & "\Bien Instalado.txt", @CRLF)
	FileWrite(@DesktopDir & "\Bien Instalado.txt", '----------------------------------------------------------------' & @CRLF & "MENU: Empiezo a instalar." & @CRLF)
	ponerestados()

	If $ModoRED = 1 Then REDborracopiaDIRECTORIO($Carpetanetwork, '', 'ResourcesMenu')
	ShellExecute('ResourcesMenu\ventrun.exe')

	If $ModoRED <> 1 Then
		If Not WinExists('falta.txt: Bloc de notas') And Not WinExists('falta: Bloc de notas') Then ShellExecute(@ScriptDir & '\falta.txt')
		If WinExists('falta.txt: Bloc de notas') Then WinActivate('falta.txt: Bloc de notas')
		If WinExists('falta: Bloc de notas') Then WinActivate('falta: Bloc de notas')
	EndIf

	If $sysprep1 = 1 or $sysprep2 = 1 Then
		If Not WinExists('SYSPREP.txt: Bloc de notas') And Not WinExists('SYSPREP: Bloc de notas') Then ShellExecute(@ScriptDir & '\SYSPREP.txt')
		If WinExists('SYSPREP.txt: Bloc de notas') Then WinActivate('SYSPREP.txt: Bloc de notas')
		If WinExists('SYSPREP: Bloc de notas') Then WinActivate('SYSPREP: Bloc de notas')
	EndIf

	CrearListaFecha()

	If GUICtrlRead($Button1) = 1 Then Autoit()
	If GUICtrlRead($Button68) = 1 Then Paquete()
	If GUICtrlRead($Button26) = 1 Then Actualizar_XP()

	If GUICtrlRead($Button27) = 1 Then
		Actualizar_W7()
		ReiniciarCompleto()
	EndIf


	If GUICtrlRead($Button18) = 1 Then Sistema_inicio()

	If GUICtrlRead($Button69) = 1 Then Halted()

	If GUICtrlRead($Button62) = 1 Then TESTMODE()
	If GUICtrlRead($Button74) = 1 Then Conectar()
	If GUICtrlRead($Button64) = 1 Then RemoveEmptyDirectories()

	If GUICtrlRead($Button77) = 1 Then SDIDrivers()



	If GUICtrlRead($Button35) = 1 Then FDM()

	If GUICtrlRead($Button24) = 1 Then Validar_XP()
	If GUICtrlRead($Button54) = 1 Then Validar_W7()
	; lo puse antes de sistema inicio    v  If GUICtrlRead($Button27) = 1 Then Actualizar_W7()
	If GUICtrlRead($Button25) = 1 Then Drivers_TPLink()
	If GUICtrlRead($Button33) = 1 Then DirectX()
	If GUICtrlRead($Button21) = 1 Then NET_Framework_1_1()
	If GUICtrlRead($Button22) = 1 Then NET_Framework_3_5()
	If GUICtrlRead($Button53) = 1 Then Net_3_5_W8_10()
	If GUICtrlRead($Button23) = 1 Then NET_Framework_4()
	;If GUICtrlRead($Button72) = 1 Then NET_Framework_461()
	If GUICtrlRead($Button67) = 1 Then VcRedist()

;~ 				if GUICtrlRead ($Backupdrivers)=1 then Backupdrivers()
;~ ---------------------	Aplicaciones iniciales	  ----------------------
;~ ---------------------	Aplicaciones intermedias    --------------------


	If GUICtrlRead($Button338) = 1 Then Everything()
	If GUICtrlRead($Button40) = 1 Then WiseDiskCleaner()
	If GUICtrlRead($Button76) = 1 Then YoutubeDownloader()
	If GUICtrlRead($Button31) = 1 Then Total_Commander()
	If GUICtrlRead($Button2) = 1 Then Chrome()
	If GUICtrlRead($Button3) = 1 Then Firefox()
	If GUICtrlRead($Button7) = 1 Then Internet_Explorer_8()
	If GUICtrlRead($Button28) = 1 Then WMP_11()
	If GUICtrlRead($Button8) = 1 Then Java()
	If GUICtrlRead($Button50) = 1 Then Ares()
	If GUICtrlRead($Button51) = 1 Then EZ_CD()
	If GUICtrlRead($Button52) = 1 Then Skype()
	If GUICtrlRead($Button57) = 1 Then qBittorrent()
	If GUICtrlRead($Button65) = 1 Then GSpot()
	If GUICtrlRead($Button66) = 1 Then DamnNFO()
	If GUICtrlRead($Button339) = 1 Then PaintNET()

	If GUICtrlRead($Button32) = 1 Then Unlocker()
	If GUICtrlRead($Button29) = 1 Then Foxit_Reader()
	If GUICtrlRead($Button30) = 1 Then PDFLite()
	If GUICtrlRead($Button4) = 1 Then ImgBurn()
	If GUICtrlRead($Button5) = 1 Then CDBurnerXP()
	If GUICtrlRead($Button10) = 1 Then Mbam()
	If GUICtrlRead($Button11) = 1 Then Office_2003()
	If GUICtrlRead($Button12) = 1 Then Office_2007()
	If GUICtrlRead($Button49) = 1 Then DllSuiteCompleto()

	If GUICtrlRead($Button14) = 1 Then
		Office_2010()
		ReiniciarCompleto()
		Office_2010abrir()
		ReiniciarCompleto()
		Office_2010validar()
	EndIf

	If GUICtrlRead($Button15) = 1 Then Letasoft_Sound_Booster()
	If GUICtrlRead($Button17) = 1 Then Winrar()

	;PROGS
	If GUICtrlRead($Button301) = 1 Then Winmerge()
	If GUICtrlRead($Button302) = 1 Then AIMP()
	If GUICtrlRead($Button303) = 1 Then Acad_2010()
	If GUICtrlRead($Button304) = 1 Then Acad_2014()
	If GUICtrlRead($Button305) = 1 Then sevenZip()
	If GUICtrlRead($Button306) = 1 Then EWSA_7()
	If GUICtrlRead($Button307) = 1 Then HxD_Hexa()
	If GUICtrlRead($Button308) = 1 Then jDownloader()
	If GUICtrlRead($Button309) = 1 Then LiLiUSB()
	If GUICtrlRead($Button310) = 1 Then MegaDPlus()
	If GUICtrlRead($Button311) = 1 Then NotepadPlus()
	If GUICtrlRead($Button312) = 1 Then R_Studio_7()
	If GUICtrlRead($Button313) = 1 Then System_Expl()
	If GUICtrlRead($Button314) = 1 Then TeamViewer()
	If GUICtrlRead($Button315) = 1 Then Teracopy_3()
	If GUICtrlRead($Button316) = 1 Then Uniextract2()
	If GUICtrlRead($Button317) = 1 Then Virtualbox()
	If GUICtrlRead($Button318) = 1 Then VirusTotal()
	If GUICtrlRead($Button319) = 1 Then VLCPlayer()
	If GUICtrlRead($Button320) = 1 Then Yawcam()
	If GUICtrlRead($Button321) = 1 Then AllwaySync()
	If GUICtrlRead($Button322) = 1 Then hashcheck()
	If GUICtrlRead($Button323) = 1 Then Revo()
	If GUICtrlRead($Button324) = 1 Then aTube()
	If GUICtrlRead($Button325) = 1 Then AVS4YOU()
	If GUICtrlRead($Button326) = 1 Then Movavi()
	If GUICtrlRead($Button327) = 1 Then IDM()
	If GUICtrlRead($Button328) = 1 Then ActiveUndelete()
	If GUICtrlRead($Button329) = 1 Then EasyBCD()
	If GUICtrlRead($Button330) = 1 Then Programadores()
	If GUICtrlRead($Button331) = 1 Then Gamepads()
	If GUICtrlRead($Button332) = 1 Then FLStudio()
	If GUICtrlRead($Button333) = 1 Then CloudMounter()
	If GUICtrlRead($Button334) = 1 Then Picasa()
	If GUICtrlRead($Button335) = 1 Then LivewireyPCBWizard()
	If GUICtrlRead($Button336) = 1 Then Mipony()
	If GUICtrlRead($Button337) = 1 Then FirefoxExtVarias()
	If GUICtrlRead($Button341) = 1 Then HashTab()
	If GUICtrlRead($Button342) = 1 Then HandBrake()

	;Fin PROGS






	If GUICtrlRead($Button56) = 1 Then DaemonToolsLite()
	If GUICtrlRead($Button55) = 1 Then Ultraiso()

;~ ---------------------	Aplicaciones intermedias    --------------------




;~ ---------------------			Juegos			--------------------


;~ 	If $Linea = '$Consolas' Then Consolas()
;~ 	If $Linea = '$Ra2YrMo' Then Ra2YrMo()


;~ 	If $Linea = '$Gen_Zero' Then Gen_Zero()


;~ ---------------------			Juegos			--------------------



;~ ---------------------	Aplicaciones finales		----------------------
	If GUICtrlRead($Button59) = 1 Then Nero_7()
	If GUICtrlRead($Button70) = 1 Then Nero_2017()
	If GUICtrlRead($Button9) = 1 Then K_lite()
	If GUICtrlRead($Button41) = 1 Then Winamp()



	If GUICtrlRead($Button20) = 1 Then Nod_32()
	If GUICtrlRead($Button48) = 1 and $sysprep1 = 0 Then
		Office_2010abrir()
		ReiniciarCompleto()
		Office_2010validar()
	EndIf

	If GUICtrlRead($Button58) = 1 Then Validar_W8_W10()
	If GUICtrlRead($Button60) = 1 Then Office_2013()
	If GUICtrlRead($Button63) = 1 Then Office_2016()
	If GUICtrlRead($Button46) = 1 Then Office_2019()

	If GUICtrlRead($Button42) = 1 Then USBSafe()
	If $sysprep1 = 1 Then sysprep()
	If GUICtrlRead($Button19) = 1 Then Sistema_final()
	If GUICtrlRead($Button45) = 1 Then Extensiones()

	If GUICtrlRead($Button75) = 1 Then ReiniciarCompleto()



	If GUICtrlRead($Button71) = 1 Then Verificar()

;~ ---------------------	Aplicaciones finales		----------------------

	PROCESOINSTALACIONYFINALIZACION()

EndFunc   ;==>Botoncorrer

FUNC PROCESOINSTALACIONYFINALIZACION()
	;MsgBox(0,'Lista','Listo para procesar Lista.')

	InstalarLista()
	sacartareaprog()

	If FileExists(@DesktopDir & "\Bien Instalado.txt") Then FileWrite(@DesktopDir & "\Bien Instalado.txt", "MENU: Termine de Instalar." & @CRLF & '----------------------------------------------------------------' & @CRLF)

	ProcessClose('ventrun.exe')
	ProcessClose('MenuNOReinicio.exe')
	sacarestados()

ENDFUNC






;---------------------------------------------------------------------------------

; ____  _  _  __ _   ___    ____  ____  ____  __   ____   __   ____
;(  __)/ )( \(  ( \ / __)  (  __)/ ___)(_  _)/ _\ (    \ /  \ / ___)
; ) _) ) \/ (/    /( (__    ) _) \___ \  )( /    \ ) D ((  O )\___ \
;(__)  \____/\_)__) \___)  (____)(____/ (__)\_/\_/(____/ \__/ (____/


Func ponerestados()
	GUICtrlSetState($Label1, 32)

	For $i = 1 To 80 Step 1 ;Programas
		GUICtrlSetState(Eval('Button' & $i), 128)
	Next

;~ 	For $i = 100 To 129 Step 1 ;Juegos
;~ 		GUICtrlSetState(Eval('Button' & $i), 128)
;~ 	Next

	For $i = 300 To 350 Step 1 ;Progs
		GUICtrlSetState(Eval('Button' & $i), 128)
	Next

	GUICtrlSetState($BotonCorrer, 128)
	GUICtrlSetState($BotonSalir, 128)
	GUICtrlSetState($BotonDeselec, 128)
	GUICtrlSetState($Limpieza, 128)
	GUICtrlSetState($ButtonInspector, 128)
	GUICtrlSetState($Sonido, 128)
	GUICtrlSetState($VerificarBOTON, 128)
	GUICtrlSetState($Sincro, 128)
	GUICtrlSetState($BotonConectarInet, 128)
	GUICtrlSetState($BotonDesconectarInet, 128)
	GUICtrlSetState($BotonSplash, 128)
	GUICtrlSetState($Panel, 128)
	GUICtrlSetState($Devmgmt, 128)
	GUICtrlSetState($MostExt, 128)
	GUICtrlSetState($OculExt, 128)
	GUICtrlSetState($MAL, 128)
	GUICtrlSetState($BotonFuncTest, 128)
	GUICtrlSetState($QHacer, 128)
	GUICtrlSetState($Backupdrivers, 128)
	GUICtrlSetState($FALTA, 128)
	GUICtrlSetState($P_Tareas, 128)
	GUICtrlSetState($BotonConectar, 128)
	GUICtrlSetState($Sin_Drive, 128)
	GUICtrlSetState($BotonCarpetaMenu, 128)
	GUICtrlSetState($BotonCarpetaMenuRED, 128)
	GUICtrlSetState($BotonDefaultOS, 128)
	GUICtrlSetState($BotonSysprep, 128)



EndFunc   ;==>ponerestados

Func sacarestados()

	For $i = 1 To 80 Step 1
		GUICtrlSetState(Eval('Button' & $i), 64)
	Next

;~ 	For $i = 100 To 129 Step 1 ;Juegos
;~ 		GUICtrlSetState(Eval('Button' & $i), 64)
;~ 	Next

	For $i = 300 To 350 Step 1 ;Progs
		GUICtrlSetState(Eval('Button' & $i), 64)
	Next

	If FileExists(@DesktopDir & "\Mal Instalado.txt") Then GUICtrlSetState($Label1, 16)
	If Not FileExists(@DesktopDir & "\Mal Instalado.txt") Then GUICtrlSetState($Label1, 32)
;~ 	if FileExists(@DesktopDir & "\Mal Verificado.txt") then GUICtrlSetState($Label1,16)

	GUICtrlSetState($BotonCorrer, 64)
	GUICtrlSetState($BotonSalir, 64)
	GUICtrlSetState($BotonDeselec, 64)
	GUICtrlSetState($Limpieza, 64)
	GUICtrlSetState($ButtonInspector, 64)
	GUICtrlSetState($Sonido, 64)
	GUICtrlSetState($VerificarBOTON, 64)
	GUICtrlSetState($Sincro, 64)
	GUICtrlSetState($BotonConectarInet, 64)
	GUICtrlSetState($BotonDesconectarInet, 64)
	GUICtrlSetState($BotonSplash, 64)
	GUICtrlSetState($Panel, 64)
	GUICtrlSetState($Devmgmt, 64)
	GUICtrlSetState($MostExt, 64)
	GUICtrlSetState($OculExt, 64)
	GUICtrlSetState($MAL, 64)
	GUICtrlSetState($BotonFuncTest, 64)
	GUICtrlSetState($QHacer, 64)
	GUICtrlSetState($FALTA, 64)
	GUICtrlSetState($P_Tareas, 64)
	GUICtrlSetState($BotonConectar, 64)
	GUICtrlSetState($Sin_Drive, 64)
	GUICtrlSetState($BotonCarpetaMenu, 64)
	GUICtrlSetState($BotonCarpetaMenuRED, 64)
	GUICtrlSetState($BotonDefaultOS, 64)
	GUICtrlSetState($BotonSysprep, 64)


EndFunc   ;==>sacarestados

; ____  __  __ _    ____  ____  ____  __   ____   __   ____
;(  __)(  )(  ( \  (  __)/ ___)(_  _)/ _\ (    \ /  \ / ___)
; ) _)  )( /    /   ) _) \___ \  )( /    \ ) D ((  O )\___ \
;(__)  (__)\_)__)  (____)(____/ (__)\_/\_/(____/ \__/ (____/



;---------------------------------------------------------------------------------


; ____  _  _  __ _   ___    __  __ _  ____  ____
;(  __)/ )( \(  ( \ / __)  (  )(  ( \/ ___)(_  _)
; ) _) ) \/ (/    /( (__    )( /    /\___ \  )(
;(__)  \____/\_)__) \___)  (__)\_)__)(____/ (__)

Func CrearListaFecha()
	$tTime = _Date_Time_GetSystemTime()
	$aTime = _Date_Time_SystemTimeToArray($tTime)
	FileWriteLine('ListaInstalar.txt',$aTime[1]&'/'&$aTime[0]&'/'&$aTime[2])
	FileClose('ListaInstalar.txt')
EndFunc


Func CrearLista($Au3Exe,$dir)
	FileWriteLine('ListaInstalar.txt',$Au3Exe&'|'&$dir)
	FileClose('ListaInstalar.txt')
EndFunc


Func InstalarLista()
	Do

		$file=FileOpen('ListaInstalar.txt',0)
		$contlinea=FileReadLine($file,2)
		FileClose($file)

		$file=FileOpen('ListaInstalar.txt',0)
		$contarchivo=FileRead($file)
		FileClose($file)

		$Au3Exe=StringLeft($contlinea,StringInStr($contlinea,'|')-1)
		$dir=StringTrimLeft($contlinea,StringInStr($contlinea,'|'))

;		MsgBox(0,'',$Au3Exe)
;		MsgBox(0,'',$dir)
;		MsgBox(0,'',$contarchivo)


		;Pausar Ejecucion

		if $Au3Exe='ReiniciarCompleto.au3' and FileExists('ResourcesMenu\MenuPausarReinicio') Then
			SplashTextOn('Espera', 'Autoit en espera'&@CRLF&'(por Reinicio)', 160, 80, 0, 220)
			While $Au3Exe='ReiniciarCompleto.au3' and FileExists('ResourcesMenu\MenuPausarReinicio')
				Sleep(500)
			WEnd
			SplashOff()
		EndIf

		if FileExists('ResourcesMenu\MenuPausarEjecucion') Then
			SplashTextOn('Espera', 'Autoit en espera'&@CRLF&'(por Ejecucion)', 160, 80, 0, 220)
			While FileExists('ResourcesMenu\MenuPausarEjecucion')
				Sleep(500)
			WEnd
			SplashOff()
		EndIf



		if $deapasos=1 then MsgBox(0,'De a Pasos','Se instalará: '&$dir)
		If $ModoRED = 1 Then REDborracopiaDIRECTORIO($Carpetanetwork, '', $dir)
		$salir=0

		;si empieza en sistemacaido.exe etc instalo halted,     Si termina en exe instalo exe,     si termina en au3 instalo au3.
		if StringLeft($Au3Exe,27)='Sistema Caido.exe /VISIBLE ' then
			$nro=StringRight($Au3Exe,1)
			ShellExecuteWait('cmd', '/c "Sistema Caido.exe" /VISIBLE '&$nro ,$dir)
		Else
			if StringRight($Au3Exe,3)='exe' then
				If @OSArch = 'X86' Then ShellExecuteWait('auto.exe', '', $dir)
				If @OSArch = 'X64' Then ShellExecuteWait('auto_x64.exe', '', $dir)
			EndIf
			if StringRight($Au3Exe,3)='au3' then
				If @OSArch = 'X86' Then ShellExecuteWait('AutoIt3.exe', '"'&$Au3Exe&'"', $dir)
				If @OSArch = 'X64' Then ShellExecuteWait('AutoIt3_x64.exe', '"'&$Au3Exe&'"', $dir)
			EndIf
		EndIf


		If $ModoRED = 1 Then REDborracopiaDIRECTORIO($Carpetanetwork, $dir, '')



		$contnuevo=StringReplace($contarchivo,$contlinea&@CRLF,'',1)
;		MsgBox(0,'','contnuevo: '&$contnuevo)



		$file=FileOpen('ListaInstalar.txt',2)
		FileWrite($file,$contnuevo)
		FileClose($file)

		$file=FileOpen('ListaInstalar.txt')
		$cantlineas=_FileCountLines('ListaInstalar.txt')
		FileClose($file)

		;MsgBox(0,'',$cantlineas)
		if $Au3Exe='ReiniciarCompleto.au3' then exit

		if StringLeft($Au3Exe,14)='TestModeOn.au3' then
			cerrardontsleep()
			exit
		EndIf

	Until $cantlineas<=1
	FileDelete('ListaInstalar.txt')

EndFunc   ;==>InstalarLista



;~ Func INSTALAREXE($exe, $exe64, $dir)
;~ 	if $deapasos=1 then MsgBox(0,'De a Pasos','Se instalará: '&$dir)
;~ 	If $ModoRED = 1 Then REDborracopiaDIRECTORIO($Carpetanetwork, '', $dir)
;~ 	If @OSArch = 'X86' Then ShellExecuteWait($exe, '', $dir)
;~ 	If @OSArch = 'X64' Then ShellExecuteWait($exe64, '', $dir)
;~ 	If $ModoRED = 1 Then REDborracopiaDIRECTORIO($Carpetanetwork, $dir, '')
;~ EndFunc   ;==>INSTALAREXE
;~ Func INSTALARAU3($au3, $dir)
;~ 	if $deapasos=1 then MsgBox(0,'De a Pasos','Se instalará: '&$dir)
;~ 	If $ModoRED = 1 Then REDborracopiaDIRECTORIO($Carpetanetwork, '', $dir)
;~ 	If @OSArch = 'X86' Then ShellExecuteWait('AutoIt3.exe', $au3, $dir)
;~ 	If @OSArch = 'X64' Then ShellExecuteWait('AutoIt3_x64.exe', $au3, $dir)
;~ 	If $ModoRED = 1 Then REDborracopiaDIRECTORIO($Carpetanetwork, $dir, '')
;~ EndFunc   ;==>INSTALARAU3
;~ Func INSTALARJUEGOAU3($au3, $dir)
;~ 	if $deapasos=1 then MsgBox(0,'De a Pasos','Se instalará: '&$dir)
;~ 	If $ModoRED = 1 Then REDborracopiaDIRECTORIO($CarpetanetworkJUEGOS, '', $dir)
;~ 	If @OSArch = 'X86' Then ShellExecuteWait('AutoIt3.exe', $au3, CarpetaJuegos() & $dir)
;~ 	If @OSArch = 'X64' Then ShellExecuteWait('AutoIt3_x64.exe', $au3, CarpetaJuegos() & $dir)
;~ 	If $ModoRED = 1 Then REDborracopiaDIRECTORIO($CarpetanetworkJUEGOS, $dir, '')
;~ EndFunc   ;==>INSTALARJUEGOAU3

; ____  __  __ _    ____  _  _  __ _   ___    __  __ _  ____  ____
;(  __)(  )(  ( \  (  __)/ )( \(  ( \ / __)  (  )(  ( \/ ___)(_  _)
; ) _)  )( /    /   ) _) ) \/ (/    /( (__    )( /    /\___ \  )(
;(__)  (__)\_)__)  (__)  \____/\_)__) \___)  (__)\_)__)(____/ (__)



;--------------------------------------------------------------------------------


; _  _  ____  __ _  _  _    ____  ____   __    ___
;( \/ )(  __)(  ( \/ )( \  (  _ \(  _ \ /  \  / __)
;/ \/ \ ) _) /    /) \/ (   ) __/ )   /(  O )( (_ \
;\_)(_/(____)\_)__)\____/  (__)  (__\_) \__/  \___/


Func Autoit()
	CrearLista('auto.exe', CarpetaProgramas() &'Autoit')
EndFunc   ;==>Autoit

Func Chrome()
	CrearLista('chrome.au3', CarpetaProgramas() &'chrome')
EndFunc   ;==>Chrome
Func Firefox()
	CrearLista('Firefox.au3', CarpetaProgramas() &'Firefox')
EndFunc   ;==>Firefox
Func ImgBurn()
	CrearLista('Imgb.au3', CarpetaProgramas() &'ImgBurn_2.5.8.0')
EndFunc   ;==>ImgBurn
Func Internet_Explorer_8()
	CrearLista('IE8.au3', CarpetaProgramas() &'Internet Explorer 8')
EndFunc   ;==>Internet_Explorer_8
Func Java()
	CrearLista('Java.au3', CarpetaProgramas() &'Java')
EndFunc   ;==>Java
Func K_lite()
	CrearLista('Klite.au3', CarpetaProgramas() &'K lite')
EndFunc   ;==>K_lite
Func Mbam()
	CrearLista('mbam.au3', CarpetaProgramas() &'Malwarebytes anti Malware')
EndFunc   ;==>Mbam
Func Office_2003()
	CrearLista('Office2K3.au3', CarpetaProgramas() &'Microsoft Office 2003')
EndFunc   ;==>Office_2003
Func Office_2007()
	CrearLista('office2k7.au3', CarpetaProgramas() &'Microsoft Office 2007')
EndFunc   ;==>Office_2007
Func Office_2010()
	CrearLista('1-office2k10.au3', CarpetaProgramas() &'Microsoft Office 2010')
EndFunc   ;==>Office_2010
Func Office_2010abrir()
	CrearLista('2-office2k10-abrir.au3', CarpetaProgramas() &'Microsoft Office 2010')
EndFunc   ;==>Office_2010
Func Office_2010validar()
	CrearLista('3-ActOff2kGUI.au3', CarpetaProgramas() &'Microsoft Office 2010')
EndFunc   ;==>Office_2010



Func ActOff2010()
	CrearLista('ActOff2010.au3', CarpetaProgramas() &'Microsoft Office 2010\ActOff2010')
EndFunc   ;==>Office_2010
Func Letasoft_Sound_Booster()
	CrearLista('LetaSound.au3', CarpetaProgramas() &'Letasoft Sound Booster')
EndFunc   ;==>Letasoft_Sound_Booster
Func sevenZip()
	CrearLista('7-Zip.au3', CarpetaProgramas() &'7-Zip')
EndFunc   ;==>sevenZip
Func Winrar()
	CrearLista('Wrar5.au3', CarpetaProgramas() &'winrar 5.3')
EndFunc   ;==>Winrar
Func CDBurnerXP()
	CrearLista('CdBurner.au3', CarpetaProgramas() &'CdBurnerXP')
EndFunc   ;==>CDBurnerXP
Func Sistema_inicio()
	CrearLista('Sistemainicio.au3', CarpetaProgramas() &'Modificaciones Sistema')
EndFunc   ;==>Sistema_inicio
Func Sistema_final()
	CrearLista('sistemafinal.au3', CarpetaProgramas() &'Modificaciones Sistema')
EndFunc   ;==>Sistema_final
Func Nod_32()
	CrearLista('Nod32.au3', CarpetaProgramas() &'Nod 32')
EndFunc   ;==>Nod_32
Func NET_Framework_1_1()
	CrearLista('Net1-1.au3', CarpetaProgramas() &'Net framework 1.1')
EndFunc   ;==>NET_Framework_1_1
Func NET_Framework_3_5()
	CrearLista('Net3-5.au3', CarpetaProgramas() &'Net framework 3.5')
EndFunc   ;==>NET_Framework_3_5
Func Net_3_5_W8_10()
	CrearLista('Netf-W8-W10.au3', CarpetaProgramas() &'Net framework 3.5 w8.1 w10')
EndFunc   ;==>Net_3_5_W8_10
Func NET_Framework_4()
	CrearLista('Net4.au3', CarpetaProgramas() &'Net framework 4')
EndFunc   ;==>NET_Framework_4
Func NET_Framework_461()
	CrearLista('Net4.6.1.au3', CarpetaProgramas() &'Net framework 4.6.1')
EndFunc   ;==>NET_Framework_461
Func NET_Framework_462()
	CrearLista('Net4.6.2.au3', CarpetaProgramas() &'Net framework 4.6.2')
EndFunc   ;==>NET_Framework_462
Func Validar_W7()
	CrearLista('ValidarW7.au3', CarpetaProgramas() &'Validar W7')
EndFunc   ;==>Validar_W7
Func Validar_W8_W10()
	CrearLista('ActW810.au3', CarpetaProgramas() &'Validar W8-W10')
EndFunc   ;==>Validar_W8_W10
Func Validar_XP()
	CrearLista('ValidarXP.au3', CarpetaProgramas() &'Validar XP')
EndFunc   ;==>Validar_XP
Func Drivers_TPLink()
	CrearLista('DriversTP.au3', CarpetaProgramas() &'Drivers TPLink')
EndFunc   ;==>Drivers_TPLink
Func Actualizar_W7()
	CrearLista('ActualizW7.au3', CarpetaProgramas() &'Actualiz x86 W7')
EndFunc   ;==>Actualizar_W7
Func Actualizar_XP()
	CrearLista('ActualizacionesXP.au3', CarpetaProgramas() &'Actualizaciones XP X86')
EndFunc   ;==>Actualizar_XP
Func WMP_11()
	CrearLista('WMP11.au3', CarpetaProgramas() &'Windows Media Player 11')
EndFunc   ;==>WMP_11
Func Foxit_Reader()
	CrearLista('Foxit.au3', CarpetaProgramas() &'Foxit reader')
EndFunc   ;==>Foxit_Reader
Func PDFLite()
	CrearLista('Pdflite.au3', CarpetaProgramas() &'PDFLite 2.0')
EndFunc   ;==>PDFLite
Func Total_Commander()
	CrearLista('TotalCMD.au3', CarpetaProgramas() &'Total Commander')
EndFunc   ;==>Total_Commander
Func Unlocker()
	CrearLista('Unlocker192.au3', CarpetaProgramas() &'Unlocker')
EndFunc   ;==>Unlocker
Func DirectX()
	CrearLista('DirX.au3', CarpetaProgramas() &'Direct X')
EndFunc   ;==>DirectX
Func FDM()
	CrearLista('fdm.au3', CarpetaProgramas() &'free download manager')
EndFunc   ;==>FDM
Func Everything()
	CrearLista('Everything.au3', CarpetaProgramas() &'Everything')
EndFunc   ;==>Everything
Func WiseDiskCleaner()
	CrearLista('WiseDisk.au3', CarpetaProgramas() &'Wise Disk Cleaner')
EndFunc   ;==>WiseDiskCleaner
Func Winamp()
	CrearLista('Winamp.au3', CarpetaProgramas() &'Winamp')
EndFunc   ;==>Winamp
Func USBSafe()
	CrearLista('USBSafe.au3', CarpetaProgramas() &'USB Safe')
EndFunc   ;==>USBSafe

Func Sinc_Nod_32()
	If $ModoRED = 1 Then
		MsgBox(0, '', 'SINCRO NOD NO FUNCIONA EN MODO RED')
		Return
	EndIf


	CrearLista('Sincronod.au3', CarpetaProgramas() &'Nod 32')
EndFunc   ;==>Sinc_Nod_32
Func Sinc_Mbam()
	If $ModoRED = 1 Then
		MsgBox(0, '', 'Sincronizar malwarebytes falla en modored. Deshabilitado')
		Return
	EndIf

	CrearLista('Sincrombam.au3', CarpetaProgramas() &'Malwarebytes anti Malware')
EndFunc   ;==>Sinc_Mbam
Func Extensiones()
	CrearLista('extensiones.au3', CarpetaProgramas() &'Extensiones')
EndFunc   ;==>Extensiones
Func Limpieza()
	CrearLista('Limpieza.au3', CarpetaProgramas() &'Modificaciones Sistema')
	Sleep(2000)
EndFunc   ;==>Limpieza


Func DllSuiteCompleto()
	CrearLista('DLLSUITECOMPLETO.au3', CarpetaProgramas() &'DLL Suite v9.0.0.2259 Final')
EndFunc   ;==>DllSuiteCompleto
Func Verificar()
	CrearLista('Menuverificar.au3', CarpetaProgramas() &'Modificaciones Sistema')
EndFunc   ;==>Verificar
Func Ares()
	CrearLista('ares.au3', CarpetaProgramas() &'ares')
EndFunc   ;==>Ares
Func EZ_CD()
	CrearLista('EZCD.au3', CarpetaProgramas() &'EZ CD Audio Converter v2.2.2.1')
EndFunc   ;==>EZ_CD
Func Skype()
	CrearLista('skype.au3', CarpetaProgramas() &'Skype')
EndFunc   ;==>Skype
Func DaemonToolsLite()
	CrearLista('daemont.au3', CarpetaProgramas() &'Daemon Tools lite')
EndFunc   ;==>DaemonToolsLite



Func Ultraiso()
	CrearLista('ultraiso.au3', CarpetaProgramas() &'ultraiso')
EndFunc   ;==>Ultraiso

Func qBittorrent()
	CrearLista('qBittorrent.au3', CarpetaProgramas() &'qBittorrent')
EndFunc   ;==>qBittorrent
Func Nero_7()
	CrearLista('nero7.au3', CarpetaProgramas() &'Nero 7')
EndFunc   ;==>Nero_7
Func Nero_2017()
	CrearLista('nero2017.au3', CarpetaProgramas() &'Nero 2017')
EndFunc   ;==>Nero_2017



Func VcRedist()
	CrearLista('VCRed.au3', CarpetaProgramas() &'VC Redist')
EndFunc   ;==>VcRedist
Func GSpot()
	CrearLista('Gspot.au3', CarpetaProgramas() &'GSpot270a')
EndFunc   ;==>GSpot
Func DamnNFO()
	CrearLista('Damn.au3', CarpetaProgramas() &'Damn NFO viewer')
EndFunc   ;==>DamnNFO

Func PaintNET()
	CrearLista('PaintNET.au3', CarpetaProgramas() &'PaintNET')
EndFunc   ;==>PaintNET


Func SDIDrivers()

	CrearLista('SnappyDriverInstaller.au3', CarpetaProgramas() &'SDI Drivers')

;	CrearLista('Driverpack.au3', CarpetaProgramas() &'Driverpack17')
EndFunc   ;==>SDIDrivers
Func sysprep()
	DirCopy('SysprepClonar', @DesktopDir & '\SysprepClonar', 1)
	FileWrite(@DesktopDir & '\Verificar y Tomar Control en Backup.txt','')
EndFunc   ;==>sysprep


Func Office_2013()
	if $sysprep2=0 then CrearLista('office2k13.au3', CarpetaProgramas() &'Microsoft Office 2013')
	if $sysprep2=1 then CrearLista('ActOff2k.au3', CarpetaProgramas() &'Microsoft Office 2013')
;	CrearLista('office2k13.au3', CarpetaProgramas() &'Microsoft Office 2013')
EndFunc   ;==>Office_2013

Func Office_2016()
	if $sysprep2=0 then CrearLista('office2k16.au3', CarpetaProgramas() &'Microsoft Office 2016')
	if $sysprep2=1 then CrearLista('ActOff2k.au3', CarpetaProgramas() &'Microsoft Office 2016')
EndFunc   ;==>Office_2016

Func Office_2019()
	if $sysprep2=0 then CrearLista('office2k19.au3', CarpetaProgramas() &'Microsoft Office 2019 w10')
	if $sysprep2=1 then CrearLista('ActOff2k.au3', CarpetaProgramas() &'Microsoft Office 2019 w10')
EndFunc   ;==>Office_2016

Func Paquete()
	CrearLista('Paquete.au3', CarpetaProgramas() &'Paquete')
EndFunc   ;==>Paquete

Func Halted()
	if $deapasos=1 then MsgBox(0,'De a Pasos','Se instalará: '&'Halted')
	If $ModoRED = 1 Then REDborracopiaDIRECTORIO($Carpetanetwork, '', 'Halted')

	CrearLista('Sistema Caido.exe /VISIBLE '&GUICtrlRead($InputHalted), CarpetaProgramas() &'Halted')
;~ 	ShellExecuteWait('Sistema Caido.exe','/VISIBLE '&GUICtrlRead($InputHalted), 'Halted')

	If $ModoRED = 1 Then REDborracopiaDIRECTORIO($Carpetanetwork, 'Halted', '')
EndFunc   ;==>Halted
Func RemoveEmptyDirectories()
	CrearLista('RemEmpDir.au3', CarpetaProgramas() &'Remove Empty Directories')
EndFunc   ;==>RemoveEmptyDirectories
Func Conectar()
;	MsgBox(0,'',$ret)
	If $ret = 3 Then CrearLista('G3.au3', CarpetaProgramas() &'Conectar Igualdad\G3')
	If $ret = 4 Then CrearLista('G4.au3', CarpetaProgramas() &'Conectar Igualdad\G4')
	If $ret = 5 Then CrearLista('G5.au3', CarpetaProgramas() &'Conectar Igualdad\G5')
	If $ret = 6 Then CrearLista('G9.au3', CarpetaProgramas() &'Conectar Igualdad\G9')
	;	if $conectarigualdad='G5' then CrearLista('Conectar G5.au3','Modificaciones Sistema\Conectar Opciones Energia')
EndFunc   ;==>Conectar

Func TESTMODE()
	CrearLista('TestModeOn.au3', CarpetaProgramas() &'TEST MODE')
EndFunc


Func ReiniciarCompleto()
	CrearLista('ReiniciarCompleto.au3', CarpetaProgramas() &'Modificaciones Sistema')
EndFunc   ;==>ReiniciarCompleto







;PROGS

Func Winmerge()
	CrearLista('winmerge.au3', CarpetaProgramas() &'WinMerge')
EndFunc   ;==>Winmerge
Func AIMP()
	CrearLista('aimp.au3', CarpetaProgramas() &'aimp')
EndFunc   ;==>AIMP
Func Acad_2010()
	CrearLista('acad2010.au3', CarpetaProgramas() &'Autocad 2010')
EndFunc   ;==>Acad_2010
Func Acad_2014()
	CrearLista('acad2014.au3', CarpetaProgramas() &'Autocad 2014')
EndFunc   ;==>Acad_2014
Func HxD_Hexa()
	CrearLista('HxD.au3', CarpetaProgramas() &'HxDSetupES')
EndFunc   ;==>HxD_Hexa
Func EWSA_7()
	CrearLista('ewsa7 install.au3', CarpetaProgramas() &'EWSA 7.12.538')
EndFunc   ;==>EWSA_7
Func jDownloader()
	CrearLista('JDownloader2.au3', CarpetaProgramas() &'JDownloader 2')
EndFunc   ;==>jDownloader
Func MegaDPlus()
	CrearLista('megadowninstalar.au3', CarpetaProgramas() &'MegaDownloader Plus 1.8')
EndFunc   ;==>MegaDPlus
Func LiLiUSB()
	CrearLista('LiLi.au3', CarpetaProgramas() &'Linux live USB Creator')
EndFunc   ;==>LiLiUSB
Func NotepadPlus()
	CrearLista('notep+.au3', CarpetaProgramas() &'Notepad++')
EndFunc   ;==>NotepadPlus
Func R_Studio_7()
	CrearLista('RStudio7.au3', CarpetaProgramas() &'R-Studio 7.8 Build 160654')
EndFunc   ;==>R_Studio_7
Func System_Expl()
	CrearLista('Systemex.au3', CarpetaProgramas() &'System Explorer')
EndFunc   ;==>System_Expl
Func TeamViewer()
	CrearLista('Teamviewer.au3', CarpetaProgramas() &'Teamviewer')
EndFunc   ;==>TeamViewer
Func Teracopy_3()
	CrearLista('teracopy.au3', CarpetaProgramas() &'teracopy 3.26')
EndFunc   ;==>Teracopy_3
Func Uniextract2()
	CrearLista('Uniextract2.au3', CarpetaProgramas() &'UniExtract2')
EndFunc   ;==>Uniextract2
Func Virtualbox()
	if @OSArch= 'x86' then CrearLista('Virtualbox5-x86.au3', CarpetaProgramas() &'Virtualbox')
	if @OSArch<>'x86' then CrearLista('Virtualbox6-x64.au3', CarpetaProgramas() &'Virtualbox')
EndFunc   ;==>Virtualbox
Func VirusTotal()
	CrearLista('Virustot.au3', CarpetaProgramas() &'Virus Total uploader')
EndFunc   ;==>VirusTotal
Func VLCPlayer()
	CrearLista('VLC.au3', CarpetaProgramas() &'VLC Player')
EndFunc   ;==>VLCPlayer
Func Yawcam()
	CrearLista('yawcam.au3', CarpetaProgramas() &'yawcam webcam')
EndFunc   ;==>Yawcam
Func YoutubeDownloader()
	CrearLista('YoutubeDown.au3', CarpetaProgramas() &'YouTube Downloader')
EndFunc   ;==>
Func AllwaySync()
	CrearLista('allwaysync.au3', CarpetaProgramas() &'Allway.Sync.19.1.5')
EndFunc   ;==>
Func Hashcheck()
	CrearLista('Hashcheck.au3', CarpetaProgramas() &'Hashcheck Shell Extension')
EndFunc   ;==>
Func HashTab()
	CrearLista('OpenHashTab.au3', CarpetaProgramas() &'OpenHashTab')
EndFunc   ;==>
Func HandBrake()
	CrearLista('Handbrake.au3', CarpetaProgramas() &'Handbrake')
EndFunc   ;==>
Func Revo()
	CrearLista('RevoUninstaller.au3', CarpetaProgramas() &'Revo Uninstaller Pro 4')
EndFunc   ;==>
Func aTube()
	CrearLista('aTube.au3', CarpetaProgramas() &'atube catcher')
EndFunc   ;==>
Func AVS4YOU()
	CrearLista('avs.au3', CarpetaProgramas() &'AVS4YOU')
EndFunc   ;==>
Func Movavi()
	CrearLista('Movavi.au3', CarpetaProgramas() &'movavi video converter premium 2020')
EndFunc   ;==>
Func IDM()
	CrearLista('IDM.au3', CarpetaProgramas() &'IDM.v6.38.B22.AIO')
EndFunc   ;==>
Func ActiveUndelete()
	CrearLista('actundelete.au3', CarpetaProgramas() &'Active@ UNDELETE Ultimate v19.0.0 Final x86 x64')
EndFunc   ;==>
Func EasyBCD()
	CrearLista('Easybcd.au3', CarpetaProgramas() &'EasyBCD')
EndFunc   ;==>
Func Programadores()
	CrearLista('Programadores-inst.au3', CarpetaProgramas() &'Programadores')
EndFunc   ;==>
Func FLStudio()
	CrearLista('FLStudio.au3', CarpetaProgramas() &'FL Studio Producer Edition 20.8.4.2553ga')
EndFunc   ;==>
Func Gamepads()
	CrearLista('GamepadInstalar.au3', CarpetaProgramas() &'Gamepads')
EndFunc   ;==>
Func CloudMounter()
	CrearLista('CloudMounter.au3', CarpetaProgramas() &'Cloud Mounter v1.8.Portable.FR')
EndFunc   ;==>
Func Picasa()
	CrearLista('Picasa.au3', CarpetaProgramas() &'Picasa')
EndFunc   ;==>
Func LivewireyPCBWizard()
	CrearLista('LivewirePcbwizard.au3', CarpetaProgramas() &'Livewire y PcbWizard')
EndFunc   ;==>
Func Mipony()
	CrearLista('Mipony.au3', CarpetaProgramas() &'Mipony')
EndFunc   ;==>
Func FirefoxExtVarias()
	CrearLista('Extensiones varias - Copiar.au3', CarpetaProgramas() &'Firefox')
EndFunc   ;==>









; ____  __  __ _        __   _  _  ____
;(  __)(  )(  ( \      / _\ / )( \( __ \
; ) _)  )( /    /   _ /    \) \/ ( (__ (
;(__)  (__)\_)__)  (_)\_/\_/\____/(____/





Func Dnod()
	If $ModoRED = 1 Then
		MsgBox(0, '', 'revisar para modored')
		Return
	EndIf

	If $ModoRED = 1 Then REDborracopiaDIRECTORIO($Carpetanetwork, '', 'Modificaciones Sistema')
	If @OSArch = 'X86' Then ShellExecuteWait('AutoIt3.exe', "Desinfnod.au3", "Modificaciones Sistema")
	If @OSArch = 'X64' Then ShellExecuteWait('AutoIt3_x64.exe', "Desinfnod.au3", "Modificaciones Sistema")
	If $ModoRED = 1 Then REDborracopiaDIRECTORIO($Carpetanetwork, 'Modificaciones Sistema', '')
EndFunc   ;==>Dnod

Func Consolas()
	If $ModoRED = 1 Then
		MsgBox(0, '', 'Juegos desactivados en ModoRED')
	Else
		If @OSArch = 'X86' Then ShellExecuteWait('AutoIt3.exe', "Consolas.au3", "Juegos varios\consolas")
		If @OSArch = 'X64' Then ShellExecuteWait('AutoIt3_x64.exe', "Consolas.au3", "Juegos varios\consolas")
	EndIf
EndFunc   ;==>Consolas
Func CorrOffice()
	If FileExists(@ProgramFilesDir & "\Microsoft Office\Office14\WINWORD.EXE") Then
		ShellExecute(@ProgramFilesDir & "\Microsoft Office\Office14\WINWORD.EXE")
	Else
		If FileExists(@ProgramFilesDir & "\Microsoft Office\Office12\WINWORD.EXE") Then
			ShellExecute(@ProgramFilesDir & "\Microsoft Office\Office12\WINWORD.EXE")
		EndIf
	EndIf
EndFunc   ;==>CorrOffice
Func OculExt()
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'Hidden', 'REG_DWORD', 2)
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'HideFileExt', 'REG_DWORD', 1)
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'SuperHidden', 'REG_DWORD', 1)
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'ShowSuperHidden', 'REG_DWORD', 0)
EndFunc   ;==>OculExt
Func MostExt()
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'Hidden', 'REG_DWORD', 1)
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'HideFileExt', 'REG_DWORD', 0)
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'SuperHidden', 'REG_DWORD', 0)
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'ShowSuperHidden', 'REG_DWORD', 1)
EndFunc   ;==>MostExt
Func Sonido()
	If $ModoRED = 1 Then REDborracopiaDIRECTORIO($Carpetanetwork, '', 'Modificaciones Sistema\Apagado de Windows XP.wav')
	FileMove('Apagado de Windows XP.wav', 'Modificaciones Sistema\Apagado de Windows XP.wav', 9)
	SoundPlay('Modificaciones Sistema\Apagado de Windows XP.wav', 1)
	If $ModoRED = 1 Then REDborracopiaDIRECTORIO($Carpetanetwork, 'Modificaciones Sistema', '')
EndFunc   ;==>Sonido
Func ruta()
	$ruta = 'ERROR'
	If DriveStatus("C:") <> 'NOTREADY' And FileExists('C:\Menu Programas') Then $ruta = ('C:\Menu Programas')
	If DriveStatus("D:") <> 'NOTREADY' And FileExists('D:\Menu Programas') Then $ruta = ('D:\Menu Programas')
	If DriveStatus("E:") <> 'NOTREADY' And FileExists('E:\Menu Programas') Then $ruta = ('E:\Menu Programas')
	If DriveStatus("F:") <> 'NOTREADY' And FileExists('F:\Menu Programas') Then $ruta = ('F:\Menu Programas')
	If DriveStatus("G:") <> 'NOTREADY' And FileExists('G:\Menu Programas') Then $ruta = ('G:\Menu Programas')
	If DriveStatus("H:") <> 'NOTREADY' And FileExists('H:\Menu Programas') Then $ruta = ('H:\Menu Programas')
	If DriveStatus("I:") <> 'NOTREADY' And FileExists('I:\Menu Programas') Then $ruta = ('I:\Menu Programas')
	If DriveStatus("J:") <> 'NOTREADY' And FileExists('J:\Menu Programas') Then $ruta = ('J:\Menu Programas')
	If DriveStatus("K:") <> 'NOTREADY' And FileExists('K:\Menu Programas') Then $ruta = ('K:\Menu Programas')
	If DriveStatus("L:") <> 'NOTREADY' And FileExists('L:\Menu Programas') Then $ruta = ('L:\Menu Programas')
	If DriveStatus("M:") <> 'NOTREADY' And FileExists('M:\Menu Programas') Then $ruta = ('M:\Menu Programas')
	If DriveStatus("N:") <> 'NOTREADY' And FileExists('N:\Menu Programas') Then $ruta = ('N:\Menu Programas')
	If DriveStatus("O:") <> 'NOTREADY' And FileExists('O:\Menu Programas') Then $ruta = ('O:\Menu Programas')
	If DriveStatus("P:") <> 'NOTREADY' And FileExists('P:\Menu Programas') Then $ruta = ('P:\Menu Programas')
	If DriveStatus("Q:") <> 'NOTREADY' And FileExists('Q:\Menu Programas') Then $ruta = ('Q:\Menu Programas')
	If DriveStatus("R:") <> 'NOTREADY' And FileExists('R:\Menu Programas') Then $ruta = ('R:\Menu Programas')
	If DriveStatus("S:") <> 'NOTREADY' And FileExists('S:\Menu Programas') Then $ruta = ('S:\Menu Programas')
	If DriveStatus("T:") <> 'NOTREADY' And FileExists('T:\Menu Programas') Then $ruta = ('T:\Menu Programas')
	If DriveStatus("U:") <> 'NOTREADY' And FileExists('U:\Menu Programas') Then $ruta = ('U:\Menu Programas')
	If DriveStatus("V:") <> 'NOTREADY' And FileExists('V:\Menu Programas') Then $ruta = ('V:\Menu Programas')
	If DriveStatus("W:") <> 'NOTREADY' And FileExists('W:\Menu Programas') Then $ruta = ('W:\Menu Programas')
	If DriveStatus("X:") <> 'NOTREADY' And FileExists('X:\Menu Programas') Then $ruta = ('X:\Menu Programas')
	If DriveStatus("Y:") <> 'NOTREADY' And FileExists('Y:\Menu Programas') Then $ruta = ('Y:\Menu Programas')
	If DriveStatus("Z:") <> 'NOTREADY' And FileExists('Z:\Menu Programas') Then $ruta = ('Z:\Menu Programas')

	If FileExists(@HomeDrive & '\MenuRED\Menu.exe') Then $ruta = @HomeDrive & '\MenuRED'
	If FileExists(@HomeDrive & '\MenuRED2\Menu.exe') Then $ruta = @HomeDrive & '\MenuRED2'

	If $ruta = 'ERROR' Then
		SplashOff()
		MsgBox(0, '', 'Error en funcion ruta(), menu se cerrará')
		Exit
	EndIf
	If $ruta = '' Then
		SplashOff()
		MsgBox(0, '', 'Error en funcion ruta(), Menu debe correr desde ' & @HomeDrive & '\MenuRED')
		Exit
	EndIf
	Return ($ruta)
EndFunc   ;==>ruta
Func Programas($ruta)
	If $ModoRED = 1 Then
		ShellExecute($ruta)
		WinWait('MenuRED')
	Else
		ShellExecute($ruta)
		WinWait('Menu Programas')
	EndIf
EndFunc   ;==>Programas
Func CarpetaMenu($ruta)
	ShellExecute($ruta)
EndFunc   ;==>CarpetaMenu
Func CarpetaMenuRED($Carpetanetwork)
	If $ModoRED = 1 Then
		ShellExecute('\\' & $Carpetanetwork)
	Else
		MsgBox(0, '', 'No estamos en ModoRED')
	EndIf
EndFunc   ;==>CarpetaMenuRED


;~ Func Backupdrivers()
;~ 	If $ModoRED=1 then REDborracopiaDIRECTORIO($Carpetanetwork,'','Double Driver OFFLINE MINIPE')
;~ 	If @OSArch='X86' Then ShellExecuteWait('AutoIt3.exe',"doubledriver.au3 "&$NROdePC, "Double Driver OFFLINE MINIPE")
;~ 	If @OSArch='X64' Then ShellExecuteWait('AutoIt3_x64.exe',"doubledriver.au3 "&$NROdePC, "Double Driver OFFLINE MINIPE")
;~ 	If $ModoRED=1 then REDborracopiaDIRECTORIO($Carpetanetwork,'Double Driver OFFLINE MINIPE','')
;~ EndFunc

Func PTareas()
	ShellExecute('taskschd.msc')
EndFunc   ;==>PTareas

Func Time()
	$tTime = _Date_Time_GetSystemTime()
	$aTime = _Date_Time_SystemTimeToArray($tTime)
	$FechaOK=0

	If $aTime[2] = $Anio and $aTime[0] >= $Mes Then $FechaOK=1
	If $aTime[2] > $Anio Then $FechaOK=1
	if $FechaOK=1 then
		$tTime = _Date_Time_GetSystemTime()
		$aTime = _Date_Time_SystemTimeToArray($tTime)
		if $aTime[1]<=9 then $aTime[1]=0&$aTime[1]
		if $aTime[0]<=9 then $aTime[0]=0&$aTime[0]
		;MsgBox(0,'',$aTime[1]&'/'&$aTime[0]&'/'&$aTime[2])

		do
			FileDelete(@ScriptDir&'\resourcesmenu\fecha.txt')
		until not FileExists(@ScriptDir&'\resourcesmenu\fecha.txt')
		FileWrite(@ScriptDir&'\resourcesmenu\fecha.txt',$aTime[1]&'/'&$aTime[0]&'/'&$aTime[2])

		Return
	EndIf


	MsgBox(0, '', 'Debe ajustar la fecha/hora')

	$tNew = _Date_Time_EncodeSystemTime(1, 1, 2020, 3, 10, 45)
	_Date_Time_SetSystemTime($tNew)


	ShellExecute('timedate.cpl')
	WinWait('Fecha y hora')
	WinMove('Fecha y hora', '', @DesktopWidth / 3, '') ;@DesktopHeight/3)
	While Not WinExists('Valores de fecha y hora')
		ControlClick('Fecha y hora', 'Cambiar &fecha y hora...', 'Button1')
		Sleep(50)
	WEnd
	WinMove('Valores de fecha y hora', '', @DesktopWidth / 3, '') ;@DesktopHeight/3)

	Opt('MouseClickDownDelay', 100)
	ControlClick('Valores de fecha y hora', '', 'SysMonthCal321', '', 2, 20, 5)
	For $i=1 to (($Anio-2020)*12+$Mes-1) Step 1
		Send('{right}')
	Next

	Sleep(5000)
	Opt('MouseClickDownDelay', 10)

	WinWaitClose('Valores de fecha y hora')
	WinWaitClose('Fecha y hora')
	Time()
EndFunc   ;==>Time



Func TareaProgContinuar()
;~ 	While FileExists(@ScriptDir & '\ResourcesMenu\Menu Continuar.txt')
;~ 		FileDelete(@ScriptDir & '\ResourcesMenu\Menu Continuar.txt')
;~ 	WEnd
;~ 	While Not FileExists(@ScriptDir & '\ResourcesMenu\Menu Continuar.txt')
;~ 		FileWrite(@ScriptDir & '\ResourcesMenu\Menu Continuar.txt', '')
;~ 	WEnd

	;	CHEQUEAR USUARIO Y CAMBIAR XML SI ES DISTINTO 	-----------------------------------------

	$Lineaarch = FileReadLine(@ScriptDir & '\ResourcesMenu\Menu Continuar.xml', 15)
	If $Lineaarch <> '      <UserId>' & @ComputerName & '\' & @UserName & '</UserId>' Then
		$arch = @ScriptDir & '\ResourcesMenu\Menu Continuar.xml'
		_FileWriteToLine($arch, 15, '      <UserId>' & @ComputerName & '\' & @UserName & '</UserId>', True)
	EndIf
	;----------------------------------------------------------------------------------------------

	;	CHEQUEAR que ejecuta Y CAMBIAR XML SI ES DISTINTO 	-----------------------------------------

	If $ModoRED <> 1 Then $textoparametro = 'LOC'
	If $ModoRED = 1 Then $textoparametro = 'RED'
	$scriptexe = @ScriptFullPath
	If StringRight($scriptexe, 3) = 'au3' Then $scriptexe = StringTrimRight($scriptexe, 3) & 'exe'

	$Lineaarch = FileReadLine(@ScriptDir & '\ResourcesMenu\Menu Continuar.xml', 42)
	If $Lineaarch <> '      <Arguments>/c START /D "' & @ScriptDir & '" "' & $scriptexe & '" "' & $scriptexe & '" /' & $textoparametro & '</Arguments>' Then
		$arch = @ScriptDir & '\ResourcesMenu\Menu Continuar.xml'
		_FileWriteToLine($arch, 42, '      <Arguments>/c START /D "' & @ScriptDir & '" "' & $scriptexe & '" "' & $scriptexe & '" /' & $textoparametro & '</Arguments>', True)
	EndIf
	;----------------------------------------------------------------------------------------------

	ShellExecuteWait('cmd.exe', ' /c schtasks /create /XML "' & @ScriptDir & '\ResourcesMenu\Menu Continuar.xml" /TN "Menu Continuar"', '', '', @SW_HIDE)

EndFunc   ;==>TareaProgContinuar

func sacartareaprog()
	ShellExecuteWait('cmd.exe', ' /C schtasks /end /TN "Menu Continuar"', '', '', @SW_HIDE)
	ShellExecuteWait('cmd.exe', ' /C schtasks /delete /TN "Menu Continuar" /F', '', '', @SW_HIDE)
EndFunc




Func CorrerUnaUnicaVez()

;~ 	Global $ret=0
	Global $MenuVaAReiniciar=0
	Global $sysprep1 = 0
	Global $sysprep2 = 0
;	CarpetaJuegos()
	GUICtrlSetState($TabSheet1, 16) ;Seleccionar TAB Programas

	GUICtrlSetState($Label1, 32)

	GUICtrlSetData($osverarch, @OSVersion & ' ' & @OSArch & ' ' & @ScriptFullPath)
	GUICtrlSetData($InputHalted,Random(1,6,1))
	GUICtrlSetState($osverarch, 128)

	If $ModoRED <> 1 Then WinSetTitle($Menu, '', 'Menu en modo LOCAL')
	If $ModoRED = 1 Then WinSetTitle($Menu, '', 'Menu en modo RED')
	sacarestados()
	HintsToolTips()




	If ( FileExists(@DesktopCommonDir&'\Syspreped.txt') or FileExists(@DesktopDir&'\Sysprepped.txt') or FileExists(@DesktopDir&'\Syspreped.txt') ) and $ContinuarConInstalacionLista = 0 Then
		ControlCommand('Menu en modo LOCAL','','SysTabControl321','TabRight','')
		;MsgBox(0,'','Sistema sysprepeado. cambiar de pestaña')
	EndIf


	If $ContinuarConInstalacionLista = 1 Then

		$tTime = _Date_Time_GetSystemTime()
		$aTime = _Date_Time_SystemTimeToArray($tTime)
		$time=$aTime[1]&'/'&$aTime[0]&'/'&$aTime[2]
		$rta=6
		if FileReadLine('ListaInstalar.txt',1)<>$time Then $rta=7
		if $rta=7 Then
			if 6=MsgBox(4,'','La fecha de la lista no se corresponde con la actual.'&@CRLF&'Desea continuar con la instalacion de lista?'&@CRLF&@CRLF&'SI -> Continuar.'&@CRLF&'NO -> Borrar Lista.') Then
				$rta=6
			EndIf
		EndIf
		if $rta=6 Then
			SplashTextOn('LISTA', 'Cargando, espere...', 160, 80, 0, 220)
			ShellExecute(@ScriptDir&'\ResourcesMenu\MenuCancelarLista.exe')
			WinWait('Menu - Cancelar Lista')
			esperarquetermineMenuCancelarLista()
			ProcessClose('MenuCancelarLista.exe')
			ponerestados()
			PROCESOINSTALACIONYFINALIZACION()
		else
			FileDelete('ListaInstalar.txt')
			sacartareaprog()

		EndIf

	EndIf

	if $unattend then
		;MsgBox(0,'','unattend: ' & $unattend&@CRLF&'Timeout: 5, esperá',5)
		WinSetTitle($Menu, '', 'Menu en modo UNATTEND')

		Local $sSubVal = ""
		For $i = 1 To 100
			$sSubVal = RegEnumVal("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", $i)
			If @error Then ExitLoop
			if StringLeft($sSubVal,15) = 'Unattend0000000' then
				;MsgBox(0,'','igual')
				RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run",$sSubVal)
			EndIf
		Next

		DefOS()
		Botoncorrer()
	EndIf


EndFunc   ;==>CorrerUnaUnicaVez

Func esperarquetermineMenuCancelarLista()
	SplashTextOn('LISTA', 'Esperando eleccion de lista.', 160, 80, 0, 220)
	$salir=0
	Do
		$salir=$salir+1
		Sleep(500)
	Until not WinExists('Menu - Cancelar Lista') or $salir>20


	SplashOff()

EndFunc   ;==>esperarquetermineMenuCancelarLista

Func ButtonInspector()
	ShellExecuteWait('ResourcesMenu\MenuInspector.exe')
EndFunc   ;==>ButtonInspector

Func HintsToolTips()
	$handle = FileOpen('ResourcesMenu\HintBotones.txt')
	If $handle = -1 Then MsgBox(0, 'Hints Botones', 'No encontre archivo HintBotones.txt en carpeta ResourcesMenu')
	For $i = 1 To 80 Step 1
		$linea = FileReadLine($handle, $i)
		$lineapartida = StringSplit($linea, ';')
		GUICtrlSetTip(Eval($lineapartida[1]), $lineapartida[3])
	Next
	FileClose($handle)
EndFunc   ;==>HintsToolTips

Func botonconectar()
	$botonconectarpresionado=1
;	MsgBox(0,'','aca')
	Do
		$ret = BOTONES('Generacion Conectar', '', 'G2', 'G3', 'G4', 'G5', 'G9', '', '', '', '', 70)
	Until $ret <> 0
	ControlCommand('Menu', '', $Button74, 'check')
EndFunc   ;==>botonconectar

func funcionconectar()

	If GUICtrlRead($Button74) = 1 Then
		If $ret = 0 Then botonconectar()
		If ControlCommand($Menu, '', $Button74, 'ischecked', '') = 1 Then
			If $ret <> 0 Then ControlCommand($Menu, '', $Button77, 'uncheck')
		EndIf
	Else
		$ret = 0
	EndIf

EndFunc

Func TEST()
;~ 	MsgBox(0,'','Corriendo funcion prueba')

EndFunc   ;==>TEST

Func CheckSiHayJuegosSelec()
	$HayJuego = 0
	For $i = 0 To 80 Step 1
		If StringTrimLeft($i, 1) = '' Then $i = '0' & $i
		If GUICtrlRead(Eval('Button1' & $i)) = 1 Then $HayJuego = 1
	Next
	Return $HayJuego
EndFunc   ;==>CheckSiHayJuegosSelec


func CarpetaProgramas()
	Return @ScriptDir&'\'
EndFunc


;~ Func CarpetaJuegos()
;~ 	$existe = 0
;~ 	If $ModoRED <> 1 Then
;~ 		$scriptdir = @ScriptDir
;~ 		While StringRight($scriptdir, 1) <> '\'
;~ 			If StringRight($scriptdir, 1) <> '\' Then $scriptdir = StringTrimRight($scriptdir, 1)
;~ 		WEnd
;~ 		If FileExists($scriptdir & 'Menu Juegos') Then $existe = 1
;~ 		Return $scriptdir & 'Menu Juegos\'
;~ ;;~ 		MsgBox(0,'','no en modo red. valor de $scriptdir es :'&$scriptdir)
;~ 	EndIf

;~ 	If $ModoRED = 1 Then
;~ 		$existe = 1
;~ 		Return ''
;~ ;;~ $CarpetanetworkJUEGOS=$IpCPUNegro&'\Menu Juegos'

;~ 	EndIf



;~ 	If $existe <> 1 Then
;~ 		MsgBox(0, 'Menu', 'No encontré directorio juegos. Deshabilitando')
;~ 		For $i = 0 To 80 Step 1
;~ 			If StringTrimLeft($i, 1) = '' Then $i = '0' & $i
;~ 			GUICtrlSetState(Eval('Button1' & $i), 128)
;~ 		Next
;~ 		GUICtrlSetState($BotonJuegosDeselec, 128)
;~ 		GUICtrlSetState($BotonJuegosSeleccionarTodos, 128)
;~ 	EndIf


;~ EndFunc   ;==>CarpetaJuegos

Func BOTONES($titulo, $tx1, $tx2, $tx3, $tx4, $tx5, $tx6, $tx7, $tx8, $tx9, $tx10, $y)
	Local $hGUI = GUICreate($titulo, 340, $y)
	Local $boton1 = GUICtrlCreateButton($tx1, 0, $y - 60, 60, 25)
	Local $boton2 = GUICtrlCreateButton($tx2, 70, $y - 60, 60, 25)
	Local $boton3 = GUICtrlCreateButton($tx3, 140, $y - 60, 60, 25)
	Local $boton4 = GUICtrlCreateButton($tx4, 210, $y - 60, 60, 25)
	Local $boton5 = GUICtrlCreateButton($tx5, 280, $y - 60, 60, 25)
	Local $boton6 = GUICtrlCreateButton($tx6, 0, $y - 30, 60, 25)
	Local $boton7 = GUICtrlCreateButton($tx7, 70, $y - 30, 60, 25)
	Local $boton8 = GUICtrlCreateButton($tx8, 140, $y - 30, 60, 25)
	Local $boton9 = GUICtrlCreateButton($tx9, 210, $y - 30, 60, 25)
	Local $boton10 = GUICtrlCreateButton($tx10, 280, $y - 30, 60, 25)

	GUISetState(@SW_SHOW, $hGUI)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $boton1
				If $tx1 <> '' Then
					GUIDelete()
					Return 1
				EndIf
			Case $boton2
				If $tx2 <> '' Then
					GUIDelete()
					Return 2
				EndIf
			Case $boton3
				If $tx3 <> '' Then
					GUIDelete()
					Return 3
				EndIf
			Case $boton4
				If $tx4 <> '' Then
					GUIDelete()
					Return 4
				EndIf
			Case $boton5
				If $tx5 <> '' Then
					GUIDelete()
					Return 5
				EndIf
			Case $boton6
				If $tx6 <> '' Then
					GUIDelete()
					Return 6
				EndIf
			Case $boton7
				If $tx7 <> '' Then
					GUIDelete()
					Return 7
				EndIf
			Case $boton8
				If $tx8 <> '' Then
					GUIDelete()
					Return 8
				EndIf
			Case $boton9
				If $tx9 <> '' Then
					GUIDelete()
					Return 9
				EndIf
			Case $boton10
				If $tx10 <> '' Then
					GUIDelete()
					Return 10
				EndIf

		EndSwitch
	WEnd

	; Delete the previous GUI and all controls.
	GUIDelete($hGUI)
EndFunc   ;==>BOTONES
;  _____ _         _____                   ____              _
; |  ___(_)_ __   |  ___|   _ _ __   ___  |  _ \ _ __   __ _| |						--------------------------------------------------------------------------------------------------
; | |_  | | '_ \  | |_ | | | | '_ \ / __| | |_) | '_ \ / _` | |						--------------------------------------------------------------------------------------------------
; |  _| | | | | | |  _|| |_| | | | | (__  |  __/| |_) | (_| | |						--------------------------------------------------------------------------------------------------
; |_|   |_|_| |_| |_|   \__,_|_| |_|\___| |_|   | .__/ \__,_|_|						--------------------------------------------------------------------------------------------------
;                                               |_|									--------------------------------------------------------------------------------------------------
