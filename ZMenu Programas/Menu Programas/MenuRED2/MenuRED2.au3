#include <File.au3>
#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****





$IpPcTaller='192.168.137.1'
$Carpetanetwork='\\'&$IpPcTaller&'\Menu Programas'








#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=menured2.kxf
$MenuRED2 = GUICreate("MenuRED2", 186, 319, 193, 123)
$AUTO = GUICtrlCreateButton("AUTO", 16, 16, 75, 25)
$Copiarse = GUICtrlCreateButton("Copiarse", 16, 80, 75, 25)
$RegReinicio = GUICtrlCreateButton("RegReinicio", 16, 112, 75, 25)
$InstDrivLAN = GUICtrlCreateButton("InstDrivLAN", 16, 144, 75, 25)
$Loguearse = GUICtrlCreateButton("Loguearse", 16, 176, 75, 25)
$CopyMenu = GUICtrlCreateButton("CopyMenu", 46, 208, 75, 25)
$Carpeta = GUICtrlCreateButton("Carpeta", 96, 16, 75, 25)
$Force_Driv = GUICtrlCreateCheckbox("Force_Driv", 96, 152, 73, 17)
$Force_Copy = GUICtrlCreateCheckbox("Force Copy", 96, 88, 73, 17)
$Ubicacion = GUICtrlCreateLabel("", 96, 248, 84, 20)
$DesLog = GUICtrlCreateButton("DesLoguearse", 96, 176, 75, 25)
$Remover = GUICtrlCreateButton("Remove", 126, 216, 45, 17)
$CarpetaRED = GUICtrlCreateButton("CarpetaRED", 96, 48, 75, 25)
$Desbl = GUICtrlCreateButton("Desbl", 48, 56, 43, 17)
$Ubicacion2 = GUICtrlCreateLabel("", 8, 248, 84, 20)
$Checkbox1 = GUICtrlCreateCheckbox("F", 17, 212, 25, 17)
$Group1 = GUICtrlCreateGroup("", 12, 198, 112, 41)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Label1 = GUICtrlCreateLabel("No Detectado", 48, 272, 84, 20)
$Label2 = GUICtrlCreateLabel("Placa:", 8, 272, 34, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
ShellExecute('MenuRED2VENTANAS.exe','','ResourcesMenuRED2')
$EventoInicioUnaSolaVez=0
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		case $EventoInicioUnaSolaVez
			$EventoInicioUnaSolaVez=1
			UnicaVezAlInicio()
		Case $GUI_EVENT_CLOSE
			Exit
		Case $AUTO
			Auto()
		Case $Copiarse
			Copiarse()
		Case $RegReinicio
			RegReinicio(0)
		Case $InstDrivLAN
			InstDrivLAN()
		Case $Loguearse
			Loguearse()
		Case $CopyMenu
			CopyMenu()
			Ejec_ClickModoRed_y_Cerrar()
		Case $Carpeta
			Carpeta()
		Case $CarpetaRED
			CarpetaRED()
		Case $Desbl
			GUICtrlSetState($CarpetaRED,64)
		Case $DesLog
			desloguearse()
		Case $Remover
			if MsgBox(1,'MenuRED2','Desea remover MenuRED2? Solo se elimina de C:\')=1 Then Remover()
	EndSwitch
WEnd

Func Auto()
	;MsgBox(0,'','auto')
	Copiarse()
	if VerSiLanTieneDriver()=0 then
		copiarsdi()
		ShellExecuteWait('SnappyDriverInstaller.exe','',@HomeDrive&'\MenuRED2\SDI Drivers LAN ONLY')
	EndIf
	RegReinicio(1)
EndFunc

func copiarsdi()
;~ 	SplashTextOn('MenuRED2','Copiando SDI LAN'&@CRLF&Round(DirGetSize(@ScriptDir) / 1024 / 1024)&' MB',160,80,0,110)
	;$copyflag=ControlCommand($MenuRED2,'',$Force_Copy,"IsChecked", "")=1
;~ 	if @ScriptDir<>@HomeDrive&'\MenuRED2' or $copyflag then

		ShellExecute('MenuRED2ConteoCopiaSDI.exe','','ResourcesMenuRED2')
		DirCopy(StringLeft(rutapen(),2)&'\SDI Drivers LAN ONLY',@HomeDrive&'\MenuRED2\SDI Drivers LAN ONLY')
;~ 		FileCreateShortcut(@HomeDrive&'\MenuRED2\MenuRED2.exe',@DesktopDir&'\MenuRED2',@HomeDrive&'\MenuRED2')
;~ 		while ProcessExists('MenuRED2ConteoCopia.exe')
;~ 			ProcessClose('MenuRED2ConteoCopia.exe')
;~ 		WEnd
;~ 	EndIf
	SplashOff()

EndFunc

func UnicaVezAlInicio()
	detectarplacared()
	if FileExists(@HomeDrive&'\MenuRED2\Menu.exe') then GUICtrlsetState($Checkbox1,4)
	if not FileExists(@HomeDrive&'\MenuRED2\Menu.exe') then GUICtrlsetState($Checkbox1,1)
	GUICtrlSetState($CarpetaRED,128)

	If not FileExists('MenuRED2continuar.txt') then
		MsgBox(262144,'','CONECTAR EL CABLE DE RED Y ENCHUFAR EL TRAFO')
		MsgBox(262144,'','YA ESTÁ CONETADO? SINÓ CANCELA')
	EndIf

	if @ScriptDir=@HomeDrive&'\MenuRED2' then GUICtrlSetData($Ubicacion,@ScriptDir)
	if @ScriptDir<>@HomeDrive&'\MenuRED2' then GUICtrlSetData($Ubicacion2,@ScriptDir)

	If FileExists('MenuRED2continuar.txt') then Autocontinuar()
	while FileExists('ListaPlacasDeRed.txt')
		FileDelete('ListaPlacasDeRed.txt')
	WEnd
EndFunc

Func Autocontinuar()
;	if FileExists('SDI Drivers LAN ONLY\SnappyDriverInstaller.exe') then ShellExecuteWait('SnappyDriverInstaller.exe','','SDI Drivers LAN ONLY')

	SplashTextOn('MenuRED2','Esperando deteccion red',160,80,0,110)
	Sleep(10000)
	SplashOff()

	Borrartareaprog()
	borrarMenuRED2continuar()
	InstDrivLAN()
	Loguearse()
	CopyMenu()
	Ejec_ClickModoRed_y_Cerrar()
EndFunc

func Ejec_ClickModoRed_y_Cerrar()
	ShellExecute(@ScriptDir&'\Menu.exe','',@ScriptDir)
	WinWait('Modo Network','&Sí')
	ControlClick('Modo Network','&Sí','Button1')
	Exit
EndFunc

Func Copiarse()
	SplashTextOn('MenuRED2','Copiando'&@CRLF&Round(DirGetSize(@ScriptDir) / 1024 / 1024)&' MB',160,80,0,110)
	$copyflag=ControlCommand($MenuRED2,'',$Force_Copy,"IsChecked", "")=1
	if @ScriptDir<>@HomeDrive&'\MenuRED2' or $copyflag then
		ShellExecute('MenuRED2ConteoCopia.exe','','ResourcesMenuRED2')
		DirCopy(rutapen(),@HomeDrive&'\MenuRED2',$copyflag)
		FileCreateShortcut(@HomeDrive&'\MenuRED2\MenuRED2.exe',@DesktopDir&'\MenuRED2',@HomeDrive&'\MenuRED2')
		while ProcessExists('MenuRED2ConteoCopia.exe')
			ProcessClose('MenuRED2ConteoCopia.exe')
		WEnd
	EndIf
	SplashOff()
EndFunc

Func RegReinicio($reiniciarycontinuar)

	SplashTextOn('MenuRED2','Modif. Reg y Reinicio',160,80,0,110)
	If $reiniciarycontinuar=1 Then reiniciarycontinuar()
	If RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System','EnableLinkedConnections') <> 1 Then
	;	Modificarregistroyreiniciar()
		RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System','EnableLinkedConnections','REG_DWORD',1)
		ShellExecuteWait('shutdown',' /r /t 0')
		Exit
	Else
		ShellExecute(@HomeDrive&'\MenuRED2\MenuRED2.exe')
		Exit
	EndIf
	SplashOff()
EndFunc

func InstDrivLAN()

;~ 	MsgBox(0,'','Vamos a probar instalar drivers LAN USB. Ver si funcionan')
	SplashTextOn('MenuRED2','Driver Lan',160,80,0,110)

	if VerSiLanTieneDriver()=0 or ControlCommand($MenuRED2,'',$Force_Driv,"IsChecked", "")=1 then


		if @OSArch = "X86" Then
			ShellExecuteWait('dpinst.exe',' /q','USB RED')
		Else
			ShellExecuteWait('dpinst64.exe',' /q','USB RED')
		EndIf


		GUISetState(@SW_RESTORE,$MenuRED2)
		SplashOff()
	EndIf
	SplashOff()
EndFunc


;ESTE ES VIEJO
;~ func InstDrivLAN()
;~ 	SplashTextOn('MenuRED2','Driver Lan',160,80,0,110)
;~ 	if VerSiLanTieneDriver()=0 or ControlCommand($MenuRED2,'',$Force_Driv,"IsChecked", "")=1 then
;~ 		ShellExecuteWait('"DriverpackLANONLY.exe"','','Driverpack17LANONLY')
;~ 		GUISetState(@SW_RESTORE,$MenuRED2)
;~ 		SplashOff()
;~ 	EndIf
;~ 	SplashOff()
;~ EndFunc



Func Loguearse()
	SplashTextOn('MenuRED2','Logueo',160,80,0,110)
	while VerSiLanEstaConectado()=0
		Sleep(1000)
	WEnd
	SplashTextOn('MenuRED2','Logueo',160,80,0,110)
	$logOK=0
	while $logOK=0
		IPSola()
		$logOK=IPProgramas()
		if $logOK=0 then desloguearse()
	WEnd

	Sleep(1000)
	While WinExists('Menu Programas',$Carpetanetwork)
		WinClose('Menu Programas',$Carpetanetwork)
	WEnd
	GUICtrlSetState($CarpetaRED,64)
	SplashOff()
EndFunc

func desloguearse()
	SplashTextOn('MenuRED2','Deslogueo',160,80,0,110)
	$ventana1=WinExists('MenuRED2','D:\MenuRED2')
	while ProcessExists('explorer.exe')
		ProcessClose('explorer.exe')
	WEnd
	ShellExecuteWait('net',' use * /del /y')
	ShellExecuteWait('net',' stop Browser')
	ShellExecuteWait('net',' stop workstation')
	;ShellExecuteWait('net',' start Browser')
	ShellExecuteWait('net',' start workstation')
	;Sleep(3000)
	send('{ctrldown}{shiftdown}{esc}')
	send('{ctrlup}{shiftup}')
	While not WinExists('Administrador de tareas de Windows') and not WinExists('Administrador de tareas')
	WEnd
	if WinExists('Administrador de tareas de Windows') Then $win='Administrador de tareas de Windows'
	If WinExists('Administrador de tareas') Then $win='Administrador de tareas'

	WinActivate($win)
	WinWaitActive($win)
	send('{altdown}{a}{n}{altup}')

	While not WinExists('Crear una tarea nueva') and not WinExists('Crear nueva tarea')
	WEnd
	if WinExists('Crear una tarea nueva') Then $win2='Crear una tarea nueva'
	If WinExists('Crear nueva tarea') Then $win2='Crear nueva tarea'


	while ControlGetText($win2,'','Edit1')<>'explorer'
		ControlSetText($win2,'','Edit1','explorer')
	WEnd

	if $win2 = 'Crear nueva tarea' then
		while 	ControlCommand($win2,'Crear esta tarea con privilegios administrativos','Button2','IsChecked','')=0
			ControlCommand($win2,'Crear esta tarea con privilegios administrativos','Button2','Check','')
		WEnd
	EndIf


	While WinExists($win2)
		If $win2 = 'Crear una tarea nueva' then ControlClick($win2,'Aceptar','Button2')
		if $win2 = 'Crear nueva tarea' then ControlClick($win2,'Aceptar','Button3')
	WEnd
	while WinExists($win)
		WinClose($win)
	WEnd



	ProcessWait('explorer.exe')



;MsgBox(0,'','a')
	if $ventana1 then
		ShellExecute('D:\MenuRED2')
		WinWait('MenuRED2','D:\MenuRED2')
	EndIf
;	MsgBox(0,'','b')

	While not WinActive($MenuRED2)
;MsgBox(0,'','c')

		WinActivate($MenuRED2)
	WEnd
;MsgBox(0,'','d')

	SplashOff()
EndFunc

Func CopyMenu()
	SplashTextOn('MenuRED2','Copiando MENU de la red',160,80,0,110)

	if GUICtrlRead($Checkbox1)=1 or not FileExists(@HomeDrive&'\MenuRED2\Menu.exe') or not FileExists(@HomeDrive&'\MenuRED2\Menu.au3') or not FileExists(@HomeDrive&'\MenuRED2\Menu.kxf') Then
		SplashTextOn('MenuRED2','COPIANDO MENU',160,80,0,110)
		REDborracopiaDIRECTORIO($Carpetanetwork,'','Menu.exe')
		REDborracopiaDIRECTORIO($Carpetanetwork,'','Menu.au3')
		REDborracopiaDIRECTORIO($Carpetanetwork,'','Menu.kxf')
		REDborracopiaDIRECTORIO($Carpetanetwork,'','ResourcesMenu')
	EndIf


	SplashOff()
EndFunc

Func Carpeta()
	ShellExecute(@ScriptDir)
EndFunc

Func CarpetaRED()
	ShellExecute($Carpetanetwork)
EndFunc










;-------------------------------------------------------------



func rutapen()
	$ruta='ERROR'
	if DriveStatus ("C:") <> 'NOTREADY' and  FileExists('C:\MenuRED2') Then $ruta = ('C:\MenuRED2')
	if DriveStatus ("D:") <> 'NOTREADY' and  FileExists('D:\MenuRED2') Then $ruta = ('D:\MenuRED2')
	if DriveStatus ("E:") <> 'NOTREADY' and  FileExists('E:\MenuRED2') Then $ruta = ('E:\MenuRED2')
	if DriveStatus ("F:") <> 'NOTREADY' and  FileExists('F:\MenuRED2') Then $ruta = ('F:\MenuRED2')
	if DriveStatus ("G:") <> 'NOTREADY' and  FileExists('G:\MenuRED2') Then $ruta = ('G:\MenuRED2')
	if DriveStatus ("H:") <> 'NOTREADY' and  FileExists('H:\MenuRED2') Then $ruta = ('H:\MenuRED2')
	if DriveStatus ("I:") <> 'NOTREADY' and  FileExists('I:\MenuRED2') Then $ruta = ('I:\MenuRED2')
	if DriveStatus ("J:") <> 'NOTREADY' and  FileExists('J:\MenuRED2') Then $ruta = ('J:\MenuRED2')
	if DriveStatus ("K:") <> 'NOTREADY' and  FileExists('K:\MenuRED2') Then $ruta = ('K:\MenuRED2')
	if DriveStatus ("L:") <> 'NOTREADY' and  FileExists('L:\MenuRED2') Then $ruta = ('L:\MenuRED2')
	if DriveStatus ("M:") <> 'NOTREADY' and  FileExists('M:\MenuRED2') Then $ruta = ('M:\MenuRED2')
	if DriveStatus ("N:") <> 'NOTREADY' and  FileExists('N:\MenuRED2') Then $ruta = ('N:\MenuRED2')
	if DriveStatus ("O:") <> 'NOTREADY' and  FileExists('O:\MenuRED2') Then $ruta = ('O:\MenuRED2')
	if DriveStatus ("P:") <> 'NOTREADY' and  FileExists('P:\MenuRED2') Then $ruta = ('P:\MenuRED2')
	if DriveStatus ("Q:") <> 'NOTREADY' and  FileExists('Q:\MenuRED2') Then $ruta = ('Q:\MenuRED2')
	if DriveStatus ("R:") <> 'NOTREADY' and  FileExists('R:\MenuRED2') Then $ruta = ('R:\MenuRED2')
	if DriveStatus ("S:") <> 'NOTREADY' and  FileExists('S:\MenuRED2') Then $ruta = ('S:\MenuRED2')
	if DriveStatus ("T:") <> 'NOTREADY' and  FileExists('T:\MenuRED2') Then $ruta = ('T:\MenuRED2')
	if DriveStatus ("U:") <> 'NOTREADY' and  FileExists('U:\MenuRED2') Then $ruta = ('U:\MenuRED2')
	if DriveStatus ("V:") <> 'NOTREADY' and  FileExists('V:\MenuRED2') Then $ruta = ('V:\MenuRED2')
	if DriveStatus ("W:") <> 'NOTREADY' and  FileExists('W:\MenuRED2') Then $ruta = ('W:\MenuRED2')
	if DriveStatus ("X:") <> 'NOTREADY' and  FileExists('X:\MenuRED2') Then $ruta = ('X:\MenuRED2')
	if DriveStatus ("Y:") <> 'NOTREADY' and  FileExists('Y:\MenuRED2') Then $ruta = ('Y:\MenuRED2')
	if DriveStatus ("Z:") <> 'NOTREADY' and  FileExists('Z:\MenuRED2') Then $ruta = ('Z:\MenuRED2')
	if $ruta='ERROR' then
		MsgBox(0,'','Error en funcion rutapen(), MenuRED2 se cerrará')
		Exit
	EndIf
	Return($ruta)
EndFunc


func Modificarregistroyreiniciar()
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System','EnableLinkedConnections','REG_DWORD',1)
	MsgBox(0,'','ver tiempo reinicio')
	ShellExecuteWait('shutdown',' /r /t 0')
	Exit
EndFunc

func detectarplacared()
	while FileExists('ListaPlacasDeRed.txt')
		FileDelete('ListaPlacasDeRed.txt')
	WEnd
	ShellExecuteWait('cmd',' /C netsh interface show interface >> ListaPlacasDeRed.txt','','',@SW_HIDE)
	$ListaPlacasDeRed=FileOpen('ListaPlacasDeRed.txt',0)
	for $i=1 to 10 step 1
		$linea=FileReadLine($ListaPlacasDeRed,$i)
;		ConsoleWrite('/'&StringTrimLeft($linea,47)&'/')
		if StringTrimLeft($linea,47)='Conexi¢n de  rea local' or StringTrimLeft($linea,47)='Ethernet' then
			GUICtrlSetData($Label1 ,'Detectada')
			FileClose($ListaPlacasDeRed)
			while FileExists('ListaPlacasDeRed.txt')
				FileDelete('ListaPlacasDeRed.txt')
			WEnd
			return 1
		EndIf
	Next
	FileClose($ListaPlacasDeRed)
	while FileExists('ListaPlacasDeRed.txt')
		FileDelete('ListaPlacasDeRed.txt')
	WEnd
	return 0
EndFunc

func VerSiLanTieneDriver()
	while FileExists('ListaPlacasDeRed.txt')
		FileDelete('ListaPlacasDeRed.txt')
	WEnd
	ShellExecuteWait('cmd',' /C netsh interface show interface >> ListaPlacasDeRed.txt','','',@SW_HIDE)
	$ListaPlacasDeRed=FileOpen('ListaPlacasDeRed.txt',0)
	for $i=1 to 10 step 1
		$linea=FileReadLine($ListaPlacasDeRed,$i)
		if StringTrimLeft($linea,47)='Conexi¢n de  rea local' or StringTrimLeft($linea,47)='Ethernet' then
			FileClose($ListaPlacasDeRed)
			return 1
		EndIf
	Next
	FileClose($ListaPlacasDeRed)
	return 0
EndFunc


func VerSiLanEstaConectado()
;	MsgBox(0,'','estoy en ersilnestaconectado')
	while FileExists('ListaPlacasDeRed.txt')
		FileDelete('ListaPlacasDeRed.txt')
	WEnd
	ShellExecuteWait('cmd',' /C netsh interface show interface >> ListaPlacasDeRed.txt','','');,@SW_HIDE)
	$ListaPlacasDeRed=FileOpen('ListaPlacasDeRed.txt',0)
	for $i=1 to 10 step 1
		$linea=FileReadLine($ListaPlacasDeRed,$i)
		;MsgBox(0,'',StringTrimLeft($linea,47))
 		if StringTrimLeft($linea,47)='Conexi¢n de  rea local' or StringTrimLeft($linea,47)='Ethernet' then
			If StringLeft(StringTrimLeft($linea,15),9)='Conectado' then
				FileClose($ListaPlacasDeRed)
				Return 1
			EndIf
			SplashTextOn('MenuRED2','Cable LAN Desconectado',160,80,0,110)
		EndIf
		;='Conexi¢n de  rea local' then return 1
	Next
	FileClose($ListaPlacasDeRed)
	return 0
EndFunc

Func IPSola()

;	ShellExecute('\\'&$IpPcTaller)
	ShellExecute('CMD',' /c Explorer \\'&$IpPcTaller)

	Whilenetworkventana()

	if WinExists('Seguridad de Windows') then ShellExecute('MenuRED2LOGIN.exe','','ResourcesMenuRED2')
	WinWaitClose('Seguridad de Windows')

	Whilenetworkventana()
	While WinExists($IpPcTaller)
		WinClose($IpPcTaller)
	WEnd
EndFunc

Func IPProgramas()
	ShellExecute($Carpetanetwork)
	Whilenetworkventana()

	if WinExists('Menu Programas') then return 1
	if WinExists('Menu Programas') then return 0

EndFunc

func Whilenetworkventana()
;	MsgBox(0,'','estoy en FUNCION whilenetworkventana')
	while not WinExists('Mis documentos') and not WinExists($IpPcTaller) and not WinExists('Seguridad de Windows') and not WinExists('Error de red') and not WinExists('Menu Programas')
		sleep(300)
;		MsgBox(0,'','estoy en WHILE whilenetworkventana')
	WEnd
EndFunc


func REDborracopiaDIRECTORIO($Carpetanetwork,$ProgDEL,$ProgCOPY)
;MsgBox(0,'','\\'&$Carpetanetwork&'\'&$ProgCOPY)
	$Carpetanetwork=StringTrimLeft($Carpetanetwork,2)
;MsgBox(0,'','\\'&$Carpetanetwork&'\'&$ProgCOPY)

	if FileExists(@HomeDrive&'\MenuRED2\'&$ProgDEL) and $ProgDEL<>'' then DirRemove(@HomeDrive&'\MenuRED2\'&$ProgDEL,1)
	if FileExists(@HomeDrive&'\MenuRED2\'&$ProgDEL) and $ProgDEL<>'' then FileDelete(@HomeDrive&'\MenuRED2\'&$ProgDEL)
	;modificacion!
	;if StringLeft(FileGetAttrib('\\'&$Carpetanetwork&'\'&$ProgCOPY),1)='A' And $ProgCOPY<>'' then ShellExecuteWait('xcopy','"'&'\\'&$Carpetanetwork&'\'&$ProgCOPY&'" "'&@HomeDrive&'\MenuRED2\'&'" /H','','');,@SW_HIDE)
	;if StringLeft(FileGetAttrib('\\'&$Carpetanetwork&'\'&$ProgCOPY),1)='D' Then ShellExecuteWait('xcopy','"'&'\\'&$Carpetanetwork&'\'&$ProgCOPY&'" "'&@HomeDrive&'\MenuRED2\'&$ProgCOPY&'\" /S /H','','');,@SW_HIDE)
	if StringLeft(FileGetAttrib('\\'&$Carpetanetwork&'\'&$ProgCOPY),1)='A' And $ProgCOPY<>'' then ShellExecuteWait('xcopy','"'&'\\'&$Carpetanetwork&'\'&$ProgCOPY&'" "'&@HomeDrive&'\MenuRED2\'&'" /H /Y','','');,@SW_HIDE)
	if StringLeft(FileGetAttrib('\\'&$Carpetanetwork&'\'&$ProgCOPY),1)='D' Then ShellExecuteWait('xcopy','"'&'\\'&$Carpetanetwork&'\'&$ProgCOPY&'" "'&@HomeDrive&'\MenuRED2\'&$ProgCOPY&'\" /S /H /Y','','');,@SW_HIDE)

	if StringLeft(FileGetAttrib('\\'&$Carpetanetwork&'\'&$ProgCOPY),1)<>'D' and StringLeft(FileGetAttrib('\\'&$Carpetanetwork&'\'&$ProgCOPY),1)<>'A' Then MsgBox(0,'','No encontré lo que hay que copiar por la red.'&@CRLF&'Al aceptar esta ventana se visualiza el archivo o directorio.')
	FileWrite(@DesktopDir & "\REDborracopiaDIRECTORIO.txt",'ProgDEL: '&$ProgDEL&'		ProgCOPY: '&$ProgCOPY&@CRLF)
	If $ProgDEL='' and $ProgCOPY='' then MsgBox(0,'','Falla en funcion REDborracopiaDIRECTORIO progdel y progcopy iguales a '&"''")
EndFunc

Func reiniciarycontinuar()
	FileWrite(@HomeDrive&'\MenuRED2\MenuRED2continuar.txt','')
	CrearTareaProg()
EndFunc


func CrearTareaProg()
	$Lineaarch=FileReadLine(@HomeDrive&'\MenuRED2\ResourcesMenuRED2\MenuRED2.xml',15)
	If $Lineaarch<>'      <UserId>'&@ComputerName&'\'&@UserName&'</UserId>' Then
		$arch=@HomeDrive&'\MenuRED2\ResourcesMenuRED2\MenuRED2.xml'
		_FileWriteToLine($arch,15,'      <UserId>'&@ComputerName&'\'&@UserName&'</UserId>',True)
	EndIf
	ShellExecuteWait('cmd.exe',' /C schtasks /create /XML '&@HomeDrive&'\MenuRED2\ResourcesMenuRED2\MenuRED2.xml /TN "MenuRED2 continuar"','','',@SW_HIDE)

;cmd /c START /D "C:\MenuRED2" "C:\MenuRED2\MenuRED2.exe" "C:\MenuRED2\MenuRED2.exe"

;~ 	MsgBox(0,'','desp de la tarea prog')
EndFunc


;~ func TareaProgContinuar()
;~ 	;	CHEQUEAR USUARIO Y CAMBIAR XML SI ES DISTINTO 	-----------------------------------------

;~ 	$Lineaarch=FileReadLine(@scriptdir&'\ResourcesMenu\Menu Continuar.xml',15)
;~ 	If $Lineaarch<>'      <UserId>'&@ComputerName&'\'&@UserName&'</UserId>' Then
;~ 		$arch=@scriptdir&'\ResourcesMenu\Menu Continuar.xml'
;~ 		_FileWriteToLine($arch,15,'      <UserId>'&@ComputerName&'\'&@UserName&'</UserId>',True)
;~ 	EndIf
;~ 	;----------------------------------------------------------------------------------------------

;~ 	;	CHEQUEAR que ejecuta Y CAMBIAR XML SI ES DISTINTO 	-----------------------------------------

;~ 	$scriptexe=@ScriptFullPath
;~ 	if StringRight( $scriptexe,3)='au3' then $scriptexe=StringtrimRight( $scriptexe,3)&'exe'

;~ 	$Lineaarch=FileReadLine(@scriptdir&'\ResourcesMenu\Menu Continuar.xml',42)
;~ 	If $Lineaarch<>'      <Arguments>/c START /D "'&@ScriptDir&'" "'&$scriptexe&'" "'&$scriptexe&'" /'&$textoparametro&'</Arguments>' Then
;~ 		$arch=@scriptdir&'\ResourcesMenu\Menu Continuar.xml'
;~ 		_FileWriteToLine($arch,42,'      <Arguments>/c START /D "'&@ScriptDir&'" "'&$scriptexe&'" "'&$scriptexe&'" /'&$textoparametro&'</Arguments>',True)
;~ 	EndIf
;~ 	;----------------------------------------------------------------------------------------------

;~ 	ShellExecuteWait('cmd.exe',' /c schtasks /create /XML "'&@scriptdir&'\ResourcesMenu\Menu Continuar.xml" /TN "Menu Continuar"','','',@SW_HIDE)

;~ ;	cmd /c START /D "D:\Menu Programas" "D:\Menu Programas\Menu.exe" "D:\Menu Programas\menu.exe" /LOC

;~ EndFunc


Func Borrartareaprog()
	ShellExecuteWait('cmd.exe',' /C schtasks /end /TN "MenuRED2 continuar"','','',@SW_HIDE)
	ShellExecuteWait('cmd.exe',' /C schtasks /delete /TN "MenuRED2 continuar" /F','','',@SW_HIDE)
EndFunc

Func borrarMenuRED2continuar()
	While FileExists(@HomeDrive&'\MenuRED2\MenuRED2continuar.txt')
		FileDelete(@HomeDrive&'\MenuRED2\MenuRED2continuar.txt')
	WEnd
EndFunc

func Remover()
	ProcessClose('MenuRED2VENTANAS.exe')
	ShellExecute('MenuRED2REMOVER.exe','','ResourcesMenuRED2')
	Exit
EndFunc
