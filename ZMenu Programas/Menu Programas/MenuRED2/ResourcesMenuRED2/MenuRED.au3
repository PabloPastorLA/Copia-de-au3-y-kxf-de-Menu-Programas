#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <File.au3>
#include <WinAPIFiles.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
if @OSVersion <> 'WIN_XP' Then
	#RequireAdmin
EndIf

ShellExecute('MenuREDLOGIN.exe')

;-------COPIO
SplashTextOn('Modo Net','COPIADOR DE MENU',160,80,0,110)
if not FileExists(@HomeDrive&'\MenuRED\MenuRED.exe') Then
	SplashTextOn('Modo Net','COPIADOR DE MENU, Copiando',160,80,0,110)
	DirCopy(rutapen(),@HomeDrive&'\MenuRED',1)
	FileCreateShortcut(@HomeDrive&'\MenuRED\MenuRED.exe',@DesktopDir&'\MenuRED',@HomeDrive&'\MenuRED')
	ShellExecute(@HomeDrive&'\MenuRED\MenuRED.exe')
	Exit
EndIf
;MsgBox(0,'','Ya me copie y ejecute')
;---------------------------------------    ||\  ||   ||===   ======    --------------------------------------------------------------------------------------------------------
;---------------------------------------    || \ ||   ||=       ||      ---------------------------------------------------------------------------------------------------
;---------------------------------------    ||  \||   ||===     ||      ------------------------------------------------------------------------------------------------------
$NombreEquipoRED='PCTALLER'
$ModoRED=0

$ModoRED=ModoRED()


$ModoRED=1
$Carpetanetwork=$NombreEquipoRED&'\Programas y tutoriales'
func ModoRED()
	$FaltanDriversoConfigRED=0
	$DeboLoguearmeenRED=0
	$TengoAccesoRED=0
SplashTextOn('Modo Net','COPIADOR DE MENU',160,80,0,110)
	If RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System','EnableLinkedConnections') <> 1 Then Modificarregistroyreiniciar()
	$CodigoRED=EjecutaryVerVentanaRED()
If $CodigoRED= 100 then $FaltanDriversoConfigRED=1
if $CodigoRED= 010 Then $DeboLoguearmeenRED=1
if $CodigoRED= 001 then $TengoAccesoRED=1
if $CodigoRED <> 100 And $CodigoRED<> 010 And $CodigoRED<> 001 Then
	MsgBox(0,'','Error en CodigoRED')
	Exit
EndIf
	If $FaltanDriversoConfigRED=1 Then PreguntarInstalarDriversyConfigRED()
	If $DeboLoguearmeenRED=1 Then
;		MsgBox(0,'','eNTRE EN DEBO LOGUEARME')
		While not WinExists($NombreEquipoRED)
			;MsgBox(0,'','voy a entrar en loguearse')
			Loguearse()
		WEnd
;		MsgBox(0,'','sali')
	EndIf
EndFunc
Func EjecutaryVerVentanaRED()
	$FaltanDriversoConfigRED=0
	$DeboLoguearmeenRED=0
	$TengoAccesoRED=0
	ShellExecuteWait('CMD',' /C EXPLORER.EXE "\\'&$NombreEquipoRED&'"','','',@SW_HIDE)
	Whilenetworkventana()
	ventanaactual()
	IF WinExists('Mis documentos') or WinExists('Error de red') Then $FaltanDriversoConfigRED=1
	IF WinExists('Seguridad de Windows') Then
		WinMove('Seguridad de Windows','',200,0)
		$DeboLoguearmeenRED=1
	EndIf
	IF WinExists($NombreEquipoRED) Then $TengoAccesoRED=1
	$CodigoRED=$FaltanDriversoConfigRED&$DeboLoguearmeenRED&$TengoAccesoRED
	$exit=0
	while WinExists('Mis documentos') or WinExists($NombreEquipoRED) or WinExists('Seguridad de Windows') or WinExists('Error de red')
		WinClose('Mis documentos')
		WinClose($NombreEquipoRED)
		if WinExists('Seguridad de Windows') then ExitLoop
		WinClose('Error de red')
	WEnd
	Return $CodigoRED
EndFunc
Func Loguearse()
	if not WinExists('Seguridad de Windows') then
		ShellExecuteWait('CMD',' /C EXPLORER.EXE "\\'&$NombreEquipoRED&'"','','',@SW_HIDE)
		while not WinExists ('Seguridad de Windows') and not WinExists($NombreEquipoRED)
		WEnd

	EndIf
	if WinExists('Seguridad de Windows') then
		WinWaitClose('Seguridad de Windows')
		$exit=0
		While $exit<25 and not WinExists($NombreEquipoRED)
			Sleep(100)
			$exit=$exit+1
		WEnd
;		MsgBox(0,'','pase el while')
		If WinExists($NombreEquipoRED) then WinClose($NombreEquipoRED)
; agregado
	;	ShellExecuteWait('CMD',' /C EXPLORER.EXE "\\'&$NombreEquipoRED&'"','','',@SW_HIDE)
;		MsgBox(0,'','se cerro')
	EndIf
EndFunc
func PreguntarInstalarDriversyConfigRED()
	$rta=MsgBox(260,'Modo Network','Desea instalar los Drivers de RED?')
	if $rta=6 then
	InstalarDriversRED()
	configurarREDIpFija()
	ModoRED()
	;MsgBox(0,'','termine ip fija')
	EndIf
	if $rta=7 then
		if 7=MsgBox(4,'RED','Ya configuro la red?') Then
			configurarREDIpFija()
			ModoRED()
		EndIf
	EndIf
EndFunc
func InstalarDriversRED()
	if not FileExists(@WindowsDir&'\driversREDinstalados') then
		ShellExecuteWait('"DriverpackLANONLY.exe"','','Driverpack17LANONLY')
		FileWrite(@WindowsDir&'\driversREDinstalados','')
		$PedirConfiguracionRED='configurar'
		Return $PedirConfiguracionRED
	Else
		$driverslan=MsgBox(4,'RED','Se detecto una instalacion de Drivers, desea REINSTALARLOS?')
		if $driverslan=6 then
			ShellExecuteWait('"DriverpackLANONLY.exe"','','Driverpack17LANONLY')
			FileWrite(@WindowsDir&'\driversREDinstalados','')
			$PedirConfiguracionRED='configurar'
			Return $PedirConfiguracionRED
		EndIf
	EndIf
EndFunc
func Modificarregistroyreiniciar()
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System','EnableLinkedConnections','REG_DWORD',1)
	IF MsgBox(4,'Modo Network','Registro de windows modificado, desea REINICIAR AHORA?')=6 Then
		ShellExecuteWait('shutdown',' /r /t 0')
		exit
	Else
		MsgBox(0,'Reinicio Necesario','NO CONTINUAR SIN REINICIAR')
		Exit
	EndIf
EndFunc
func Whilenetworkventana()
	while not WinExists('Mis documentos') and not WinExists($NombreEquipoRED) and not WinExists('Seguridad de Windows') and not WinExists('Error de red')
		sleep(300)
	WEnd
EndFunc
func ventanaactual()
 	$ventanaactual=''
	$exit=0
	while $exit<10
		Sleep(100)
		if $ventanaactual=WinGetTitle('','') Then
			$exit=$exit+1
		Else
			$exit=0
		EndIf
		$ventanaactual=WinGetTitle('','')
	WEnd
EndFunc
func CableDesconectado()
	while WinExists('Error de red')
		WinClose('Error de red')
	WEnd
	MsgBox(0,'ERROR de RED','Error de Red, cable DESCONECTADO?')
	Exit
EndFunc
func REDborracopiaDIRECTORIO($Carpetanetwork,$ProgDEL,$ProgCOPY)
	if FileExists(@HomeDrive&'\MenuRED\'&$ProgDEL) and $ProgDEL<>'' then DirRemove(@HomeDrive&'\MenuRED\'&$ProgDEL,1)
	if FileExists(@HomeDrive&'\MenuRED\'&$ProgDEL) and $ProgDEL<>'' then FileDelete(@HomeDrive&'\MenuRED\'&$ProgDEL)
	if StringLeft(FileGetAttrib('\\'&$Carpetanetwork&'\'&$ProgCOPY),1)='A' And $ProgCOPY<>'' then ShellExecuteWait('xcopy','"'&'\\'&$Carpetanetwork&'\'&$ProgCOPY&'" "'&@HomeDrive&'\MenuRED\'&'" /H','','');,@SW_HIDE)
	if StringLeft(FileGetAttrib('\\'&$Carpetanetwork&'\'&$ProgCOPY),1)='D' Then ShellExecuteWait('xcopy','"'&'\\'&$Carpetanetwork&'\'&$ProgCOPY&'" "'&@HomeDrive&'\MenuRED\'&$ProgCOPY&'\" /S /H','','');,@SW_HIDE)
	if StringLeft(FileGetAttrib('\\'&$Carpetanetwork&'\'&$ProgCOPY),1)<>'D' and StringLeft(FileGetAttrib('\\'&$Carpetanetwork&'\'&$ProgCOPY),1)<>'A' Then MsgBox(0,'','ERROR GRAVE EN FUNCION REDborracopiaDIRECTORIO NO DEJAR PASAR. ')
	FileWrite(@DesktopDir & "\REDborracopiaDIRECTORIO.txt",'ProgDEL: '&$ProgDEL&'		ProgCOPY: '&$ProgCOPY&@CRLF)
	If $ProgDEL='' and $ProgCOPY='' then MsgBox(0,'','Falla en funcion REDborracopiaDIRECTORIO progdel y progcopy iguales a '&"''")
EndFunc
func ConfigurarREDDHCP()
;ACA	ShellExecuteWait('cmd.exe',' /C netsh interface ipv4 set address name="Conexión de área local" dhcp','','',@SW_HIDE)
	;AbrirventanaIP()
EndFunc
func AbrirventanaIP()
	while WinExists('Conexiones de red')
		WinClose('Conexiones de red')
	WEnd
	ShellExecute('Ncpa.cpl')
	WinWait('Conexiones de red')
	WinActivate('Conexiones de red')
	WinWaitActive('Conexiones de red')
	send('{space}{altdown}{enter}{altup}')
	WinWait('Propiedades de Conexión de área local')
	for $i=0 to 15 step 1
		if 'Protocolo de Internet versión 4 (TCP/IPv4)'=ControlListView('Propiedades de Conexión de área local','','SysListView321',"GetText", $i) Then
			ControlListView('Propiedades de Conexión de área local','','SysListView321',"Select", $i)
			ExitLoop
		EndIf
	Next
	ControlClick('Propiedades de Conexión de área local','&Propiedades','Button4')
	WinWait('Propiedades: Protocolo de Internet versión 4 (TCP/IPv4)')
	WinWaitClose('Propiedades: Protocolo de Internet versión 4 (TCP/IPv4)')
	While WinExists('Propiedades de Conexión de área local')
		ControlClick('Propiedades de Conexión de área local','Cerrar','Button6')
		ControlClick('Propiedades de Conexión de área local','Aceptar','Button6')
	WEnd
	While WinExists('Conexiones de red')
		WinClose('Conexiones de red')
	WEnd
EndFunc
func configurarREDIpFija()
	$IPrandom=Random(10,250,1)
;ACA	ShellExecuteWait('cmd.exe',' /C netsh interface ipv4 set address name="Conexión de área local" static 192.168.10.'&$IPrandom&' 255.255.255.0 192.168.10.1','','',@SW_HIDE)
	;AbrirventanaIP()
EndFunc
;---------------------------------------    ||\  ||   ||===   ======    --------------------------------------------------------------------------------------------------------
;---------------------------------------    || \ ||   ||=       ||      ---------------------------------------------------------------------------------------------------
;---------------------------------------    ||  \||   ||===     ||      ------------------------------------------------------------------------------------------------------




if not FileExists(@HomeDrive&'\MenuRED\Menu.exe') or not FileExists(@HomeDrive&'\MenuRED\Menu.au3') or not FileExists(@HomeDrive&'\MenuRED\Menu.kxf') or not FileExists(@HomeDrive&'\MenuRED\menuicono.ico') Then
	SplashTextOn('Modo Net','COPIANDO MENU',160,80,0,110)
	REDborracopiaDIRECTORIO($Carpetanetwork,'','Menu.exe')
	REDborracopiaDIRECTORIO($Carpetanetwork,'','Menu.au3')
	REDborracopiaDIRECTORIO($Carpetanetwork,'','Menu.kxf')
	REDborracopiaDIRECTORIO($Carpetanetwork,'','menuicono.ico')
EndIf
FileCreateShortcut(@HomeDrive&'\MenuRED\MenuRED.exe',@DesktopDir&'\MenuRED',@HomeDrive&'\MenuRED')
ShellExecute(@HomeDrive&'\MenuRED\Menu.exe','',@HomeDrive&'\MenuRED')
Exit


Exit

func rutapen()
	$ruta='ERROR'
	if DriveStatus ("C:") <> 'NOTREADY' and  FileExists('C:\MenuRED') Then $ruta = ('C:\MenuRED')
	if DriveStatus ("D:") <> 'NOTREADY' and  FileExists('D:\MenuRED') Then $ruta = ('D:\MenuRED')
	if DriveStatus ("E:") <> 'NOTREADY' and  FileExists('E:\MenuRED') Then $ruta = ('E:\MenuRED')
	if DriveStatus ("F:") <> 'NOTREADY' and  FileExists('F:\MenuRED') Then $ruta = ('F:\MenuRED')
	if DriveStatus ("G:") <> 'NOTREADY' and  FileExists('G:\MenuRED') Then $ruta = ('G:\MenuRED')
	if DriveStatus ("H:") <> 'NOTREADY' and  FileExists('H:\MenuRED') Then $ruta = ('H:\MenuRED')
	if DriveStatus ("I:") <> 'NOTREADY' and  FileExists('I:\MenuRED') Then $ruta = ('I:\MenuRED')
	if DriveStatus ("J:") <> 'NOTREADY' and  FileExists('J:\MenuRED') Then $ruta = ('J:\MenuRED')
	if DriveStatus ("K:") <> 'NOTREADY' and  FileExists('K:\MenuRED') Then $ruta = ('K:\MenuRED')
	if DriveStatus ("L:") <> 'NOTREADY' and  FileExists('L:\MenuRED') Then $ruta = ('L:\MenuRED')
	if DriveStatus ("M:") <> 'NOTREADY' and  FileExists('M:\MenuRED') Then $ruta = ('M:\MenuRED')
	if DriveStatus ("N:") <> 'NOTREADY' and  FileExists('N:\MenuRED') Then $ruta = ('N:\MenuRED')
	if DriveStatus ("O:") <> 'NOTREADY' and  FileExists('O:\MenuRED') Then $ruta = ('O:\MenuRED')
	if DriveStatus ("P:") <> 'NOTREADY' and  FileExists('P:\MenuRED') Then $ruta = ('P:\MenuRED')
	if DriveStatus ("Q:") <> 'NOTREADY' and  FileExists('Q:\MenuRED') Then $ruta = ('Q:\MenuRED')
	if DriveStatus ("R:") <> 'NOTREADY' and  FileExists('R:\MenuRED') Then $ruta = ('R:\MenuRED')
	if DriveStatus ("S:") <> 'NOTREADY' and  FileExists('S:\MenuRED') Then $ruta = ('S:\MenuRED')
	if DriveStatus ("T:") <> 'NOTREADY' and  FileExists('T:\MenuRED') Then $ruta = ('T:\MenuRED')
	if DriveStatus ("U:") <> 'NOTREADY' and  FileExists('U:\MenuRED') Then $ruta = ('U:\MenuRED')
	if DriveStatus ("V:") <> 'NOTREADY' and  FileExists('V:\MenuRED') Then $ruta = ('V:\MenuRED')
	if DriveStatus ("W:") <> 'NOTREADY' and  FileExists('W:\MenuRED') Then $ruta = ('W:\MenuRED')
	if DriveStatus ("X:") <> 'NOTREADY' and  FileExists('X:\MenuRED') Then $ruta = ('X:\MenuRED')
	if DriveStatus ("Y:") <> 'NOTREADY' and  FileExists('Y:\MenuRED') Then $ruta = ('Y:\MenuRED')
	if DriveStatus ("Z:") <> 'NOTREADY' and  FileExists('Z:\MenuRED') Then $ruta = ('Z:\MenuRED')
	if $ruta='ERROR' then
		MsgBox(0,'','Error en funcion rutapen(), MenuRED se cerrará')
		Exit
	EndIf
	Return($ruta)
EndFunc
