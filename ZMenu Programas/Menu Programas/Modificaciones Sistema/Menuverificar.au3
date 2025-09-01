#include <Array.au3>
#include <File.au3>
#include <WinAPIShellEx.au3>
#RequireAdmin

#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****





$debug=1
$debugmsgbox=0

Global $Errornodalfinal=0

FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a CORRER:		MENUVERIFICAR"&@CRLF)

movermouse(0,50)
$cerrar=MsgBox(4,'Cerrar anterior','Desea cerrar ventanas de Menuverificar anterior?'&@CRLF&'En 3 seg se cierran solas',3)
;MsgBox(0,'',$cerrar)
if $cerrar=-1 or $cerrar=6 then ShellExecuteWait('menuverificarcerrar.exe')
;Exit


;if not ProcessExists('memoria.exe') then ShellExecute('memoria.exe')


global $LTSC=0
if RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion','ProductName')='Windows 10 Enterprise LTSC 2019' then $LTSC=1

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Menu Verif',160,80,0,220)

WinMinimizeAll()

;~ minimizartodo()





















$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)

if $debugmsgbox then MsgBox(0,'','extensiones()')
if $debug=1 then SplashTextOn('Debug Menuverificar','extensiones()',160,80,0,220)
extensiones()

if $debugmsgbox then MsgBox(0,'','actoffice()')
if $debug=1 then SplashTextOn('Debug Menuverificar','actoffice()',160,80,0,220)
$veroffice=actoffice()

if $debugmsgbox then MsgBox(0,'','msconfig(0)')
if $debug=1 then SplashTextOn('Debug Menuverificar','msconfig(0)',160,80,0,220)
msconfig(0)

if $debugmsgbox then MsgBox(0,'','centsegurwinupdate2()')
if $debug=1 then SplashTextOn('Debug Menuverificar','centsegurwinupdate2()',160,80,0,220)
centsegurwinupdate2()

if $debugmsgbox then MsgBox(0,'','restaursistema()')
if $debug=1 then SplashTextOn('Debug Menuverificar','restaursistema()',160,80,0,220)
restaursistema()

if $debugmsgbox then MsgBox(0,'','drivers()')
if $debug=1 then SplashTextOn('Debug Menuverificar','drivers()',160,80,0,220)
drivers()

if $debugmsgbox then MsgBox(0,'','regjump()')
if $debug=1 then SplashTextOn('Debug Menuverificar','regjump()',160,80,0,220)
regjump()

if $debugmsgbox then MsgBox(0,'','w710validado()')
if $debug=1 then SplashTextOn('Debug Menuverificar','w710validado()',160,80,0,220)
w710validado()

if $debugmsgbox then MsgBox(0,'','verifwmp11()')
if $debug=1 then SplashTextOn('Debug Menuverificar','verifwmp11()',160,80,0,220)
verifwmp11()

if $debugmsgbox then MsgBox(0,'','passwordexpira()')
if $debug=1 then SplashTextOn('Debug Menuverificar','passwordexpira()',160,80,0,220)
$prog=passwordexpira()

if $debugmsgbox then MsgBox(0,'','NodExclu()')
if $debug=1 then SplashTextOn('Debug Menuverificar','NodExclu()',160,80,0,220)
NodExclu()

if $debugmsgbox then MsgBox(0,'','tareaprog()')
if $debug=1 then SplashTextOn('Debug Menuverificar','tareaprog()',160,80,0,220)
tareaprog()

if $debugmsgbox then MsgBox(0,'','borrarcacheiconos()')
if $debug=1 then SplashTextOn('Debug Menuverificar','borrarcacheiconos()',160,80,0,220)
borrarcacheiconos()






















if $debug=1 then SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Menu Verif',160,80,0,220)










ShellExecute('MenuverificarGUI.exe')
WinWait('MenuVerificar GUI')
$finalizar=VentanitasMenuVerificar()
if $finalizar=1 then finalizar()
ProcessClose('memoria.exe')














;---- estas no van-----
;~ ;verifadblock()
;~ confnod32()
;lusrmgr()
;;;centsegurwinupdate()
;------------------------------
func autoruns()
	if @OSArch='X86' then ShellExecute('Autoruns.exe','','Autoruns')
	if @OSArch<>'X86' then ShellExecute('Autoruns64.exe','','Autoruns')
	do
		Sleep(500)
		if WinExists('AutoRuns License Agreement') then ControlClick('AutoRuns License Agreement','','Button1')
	Until WinExists('Autoruns [')

EndFunc

func VerificarBackUp()
;	if FileExists(@HomeDrive&'\Bup') and DirGetSize(@HomeDrive&'\Bup')<>0 and FileExists(@DesktopDir&'\Backup.lnk') Then
	if FileExists(@HomeDrive&'\Bup') and FileFindFirstFile(@HomeDrive&'\Bup\*') >= (-1) and FileExists(@DesktopDir&'\Backup.lnk') Then

;	Elseif FileExists(@HomeDrive&'\Bup') and DirGetSize(@HomeDrive&'\Bup')<>0 and not FileExists(@DesktopDir&'\Backup.lnk') Then
	Elseif FileExists(@HomeDrive&'\Bup') and FileFindFirstFile(@HomeDrive&'\Bup\*') >= (-1)  and not FileExists(@DesktopDir&'\Backup.lnk') Then
		movermouse(40,50)
		if MsgBox(4,'Backup','Encontré carpeta backup pero no acceso directo. Crear?')=6 then FileCreateShortcut(@HomeDrive&'\Bup',@DesktopDir&'\Backup.lnk',@HomeDrive&'\Bup')
	Else
		movermouse(80,50)
		if 6=MsgBox(4,'Backup','No encontré backup. Desea ordenar ahora?'&@CRLF&'(Necesario para borrar inst viejas de win).') Then
			DirCreate(@HomeDrive&'\Bup')
			ShellExecute(@HomeDrive&'\Bup')
			ShellExecute(@HomeDrive)
			ShellExecute('"cleanmgr"')
			MsgBox(0,'Backup','Cuando termine de ordenar presione OK')
			VerificarBackUp()
		EndIf
	EndIf

EndFunc

func limpiarescritorio()
	borrardetodoslosescritorios('CDBurnerXP.lnk')
	borrardetodoslosescritorios('ImgBurn.lnk')
	borrardetodoslosescritorios('Mozilla Firefox.lnk')
	borrardetodoslosescritorios('paint.net.lnk')
	borrardetodoslosescritorios('EZ CD Audio Converter.lnk')
	borrardetodoslosescritorios('Total Commander.lnk')
	borrardetodoslosescritorios('Total Commander 64 bit.lnk')
	borrardetodoslosescritorios('Nero StartSmart.lnk')
	borrardetodoslosescritorios('PDFlite.lnk')
	borrardetodoslosescritorios('TuneUp Utilities.lnk')
	borrardetodoslosescritorios('Winamp.lnk')
	borrardetodoslosescritorios('Skype.lnk')
	borrardetodoslosescritorios('Foxit Reader.lnk')
	borrardetodoslosescritorios('Ares.lnk')
	borrardetodoslosescritorios('System Explorer.lnk')
	borrardetodoslosescritorios('VLC media player.lnk')
	borrardetodoslosescritorios('aTube Catcher.lnk')
	borrardetodoslosescritorios('AIMP.lnk')
	borrardetodoslosescritorios('Oracle VM VirtualBox.lnk')
	borrardetodoslosescritorios('Chrome.lnk')
	borrardetodoslosescritorios('Wise Disk Cleaner.lnk')
	borrardetodoslosescritorios('Buscar con Everything.lnk')
	borrardetodoslosescritorios('MediaHuman YouTube Downloader.lnk')



	borrardetodoslosescritorios('REDborracopiaDIRECTORIO.txt')

	borrardetodoslosescritorios('Syspreped.txt')
	borrardetodoslosescritorios('SysprepClonar')

	borrardetodoslosescritorios('Allway Sync.lnk')
	borrardetodoslosescritorios('AutoCAD 2010 - Español.lnk')
	borrardetodoslosescritorios('DAEMON Tools Lite.lnk')
	borrardetodoslosescritorios('TeamViewer 10.lnk')
	borrardetodoslosescritorios('UltraISO.lnk')
	borrardetodoslosescritorios('Free Download Manager.lnk')

EndFunc

func borrardetodoslosescritorios($Nombre)
	borrarconwhile(@DesktopDir&'\'&$Nombre)
	borrarconwhile(@DesktopCommonDir&'\'&$Nombre)
EndFunc

func borrarconwhile($rutacompleta)
	while FileExists($rutacompleta)
		FileDelete($rutacompleta)
		DirRemove($rutacompleta,1)
	WEnd
EndFunc

func movermouse($x,$y)
	MouseMove(@DesktopWidth/2+$x,@DesktopHeight/2+$y,0)
EndFunc

func VentanitasMenuVerificar()

	if $debug=1 then SplashTextOn('Debug Menuverificar','Sonido',160,80,0,220)
	sonido()
	if $debug=1 then SplashTextOn('Debug Menuverificar','nod',160,80,0,220)
	if $Errornodalfinal=1 then
		movermouse(55,45)
		MsgBox(0,'','no encontre nod para exclusiones')
	EndIf

	if $debug=1 then SplashTextOn('Debug Menuverificar','malinstalado',160,80,0,220)
	MalInstalado()
	if $debug=1 then SplashTextOn('Debug Menuverificar','verificarbackup',160,80,0,220)
	VerificarBackUp()

	if $debug=1 then SplashTextOn('Debug Menuverificar','Prog Tareas',160,80,0,220)
	WinMove('Programador de tareas','',@DesktopWidth/8,@DesktopHeight/2)
	WinActivate('Programador de tareas')
	movermouse(50,68)
	$textoNod='NOD Reset Upgrade'
	If @OSVersion='WIN_10' then $textoNod=''
 	MsgBox(0,'Programador de tareas',		   @CRLF&'GoogleSchedulerTaskMachine'&@CRLF&'KMSAuto'&@CRLF&$textoNod&@CRLF)
	cerrarvent('Programador de tareas')

	if $debug=1 then SplashTextOn('Debug Menuverificar','Exclus()',160,80,0,220)
	if existenod()=1 Then
		WinMove('ESET NOD32 Antivirus','Exclusiones',0,0)
		WinActivate('ESET NOD32 Antivirus','Exclusiones')
		movermouse(23,70)
		if $veroffice=2010 Then						MsgBox(0,'NOD32','AutoKMS\*.*'&@CRLF&'Halted\*.*'&@CRLF&'KMSEmulator.exe')
		if $veroffice=2013 or $veroffice=2016 Then	MsgBox(0,'NOD32','Nod Reset Upgrade.exe'&@CRLF&'Halted\*.*'&@CRLF&'KMSAutoS\*.*'&@CRLF)
		cerrarvent('ESET NOD32 Antivirus')
	EndIf


;~ 	ListaExclusionWinDefender()
if @OSVersion='WIN_10' then
	WinActivate('Editor del Registro')
	movermouse(38,50)
	$halted=''
	if FileExists(@WindowsDir&'\Halted') then MsgBox(0,'Exclusiones WinDefender',@WindowsDir&'\KMSAutoS'&@CRLF&@WindowsDir&'\Halted')
	if not FileExists(@WindowsDir&'\Halted') then MsgBox(0,'Exclusiones WinDefender',@WindowsDir&'\KMSAutoS')
	cerrarvent('Editor del Registro')
EndIf

	if $debug=1 then SplashTextOn('Debug Menuverificar','expira',160,80,0,220)
	WinMove('Administrador: C:\Windows\System32\cmd.exe','',200,100)
	WinActivate('Administrador: C:\Windows\System32\cmd.exe')
	movermouse(25,50)
	if @OSVersion='WIN_7' then MsgBox(0,'','Cuenta Expira'&@CRLF&'Password Expira')
	if @OSVersion<>'WIN_7' then MsgBox(0,'','La Cuenta Expira'&@CRLF&'La Contraseña Expira')
	cerrarvent('Administrador: C:\Windows\System32\cmd.exe')

	if $debug=1 then SplashTextOn('Debug Menuverificar','drivers',160,80,0,220)
	WinWait('Administrador de dispositivos')
	WinActivate('Administrador de dispositivos')
	WinMove('Administrador de dispositivos','','160','30')
	WinWaitActive('Administrador de dispositivos')
	ControlClick('Administrador de dispositivos','','SysTreeView321')
	BlockInput(1)
	Send('controladoras de sonido',1)
	Send('{right}')
	Send('adaptadores de red',1)
	Send('{right}')
	Send('adaptadores de pantalla',1)
	Send('{right}')
	BlockInput(0)
	movermouse(-40,80)
	$rta=MsgBox(4,'Drivers','Adap. Pantalla'&@CRLF&'Adap. Red WIFI'&@CRLF&'Adap. Sonido'&@CRLF&@CRLF&'Si -> Continuo'&@CRLF&'No -> Escribo TXT en escritorio')
	if $rta=7 then FileWrite(@DesktopCommonDir&'\Drivers.txt','')
	cerrarvent('Administrador de dispositivos')

	if $debug=1 then SplashTextOn('Debug Menuverificar','Rest Sistema',160,80,0,220)
	if WinExists('Propiedades del sistema','Por ejemplo: "Equipo de la sala de estar"') then
		;ACA ES WINLITE QUE LO TRAE DESACTIVADO
		WinActivate('Propiedades del sistema','Por ejemplo: "Equipo de la sala de estar"')
		movermouse(100,50)
		MsgBox(0,'Restaurar Sistema','Esta version de windows ya lo trae desactivado')
		cerrarvent('Propiedades del sistema')
	ElseIf WinExists('Propiedades del sistema','El administrador del sistema deshabilitó Restaurar sistema.') Then
		;ACA ES WIN ORIGINAL QUE LO TRAE SIN DESACTIVAR
		WinActivate('Propiedades del sistema','El administrador del sistema deshabilitó Restaurar sistema.')
		movermouse(25,47)
		MsgBox(0,'Restaurar Sistema','Esta OK. Cerrando')
		cerrarvent('Propiedades del sistema')
	Else
		MsgBox(0,'Restaurar Sistema','Agregar ventana restaurar sistema')
	EndIf

	if $debug=1 then SplashTextOn('Debug Menuverificar','Act Windows',160,80,0,220)
	WinActivate('Sistema')
	movermouse(30,50)
	MsgBox(0,'Act Windows','Windows está activado')
	cerrarvent('Sistema')


	if $debug=1 then SplashTextOn('Debug Menuverificar','WinUpdate',160,80,0,220)
	winactivate('Configuración','Configuración')
	WinActivate('Cambiar configuración')
	movermouse(24,50)
	MsgBox(0,'Windows Update','Desactivado')

	cerrarvent('Cambiar configuración')
	winclose('Configuración','Configuración')
;MsgBox(0,'','2')

	if $debug=1 then SplashTextOn('Debug Menuverificar','Msconfig',160,80,0,220)
	if WinExists('Administrador de tareas') Then WinMove('Administrador de tareas','',200,0)
	if WinExists('Configuración del sistema') Then WinMove('Configuración del sistema','',200,300)
	WinActivate('Administrador de tareas')
	WinActivate('Configuración del sistema')
	movermouse(15,50)
	MsgBox(0,'MsConfig','Servicios')
	cerrarvent('Configuración del sistema')
	cerrarvent('Administrador de tareas')

	;if @OSVersion='WIN_7' or @OSVersion='WIN_XP' then
		if $debug=1 then SplashTextOn('Debug Menuverificar','msconfig(1)',160,80,0,220)
MsgBox(0,'','2 ventanas msconfig antes')
		msconfig(1)
MsgBox(0,'','2 ventanas msconfig despues? (en w7 func ok)')
		SplashOff()
		MsgBox(0,'MsConfig','Programas')
		cerrarvent('Configuración del sistema')
	;EndIf


	if $debug=1 then SplashTextOn('Debug Menuverificar','Act Off',160,80,0,220)
	$ventana='asdasdasdasdasdads'
	if WinExists('Documento1 - Word') then $ventana='Documento1 - Word'
	if WinExists('Documento1 - Microsoft Word') then $ventana='Documento1 - Microsoft Word'
	WinActivate($ventana)
	movermouse(18,50)
	MsgBox(0,'Office','Activado')
	cerrarvent($ventana)

	if $debug=1 then SplashTextOn('Debug Menuverificar','Prog Predet',160,80,0,220)
MenuEjecutarComoAdmin('control /name Microsoft.DefaultPrograms /page pageDefaultProgram')
Do
	Sleep(200)
until WinExists('Establecer programas predeterminados') or WinExists('Configuración')
Sleep(2000)
Winmove('Establecer programas predeterminados','',0,0,@DesktopWidth/2-150,@DesktopHeight-40)
WinMove('Configuración','',0,0,@DesktopWidth/2-150,@DesktopHeight-40)
WinMove('ARCHIVOS PRUEBA','',@DesktopWidth/2+150,0,@DesktopWidth/2,@DesktopHeight-40)
WinActivate('ARCHIVOS PRUEBA','')
movermouse(-5,50)
	$respuesta=MsgBox(4,'Prog Predeter','Ya Definio programas predeterminados?')
	if $respuesta=6 then
		WinClose('Establecer programas predeterminados')
		WinClose('Configuración')
		WinClose('ARCHIVOS PRUEBA')
	EndIf


	if $debug=1 then SplashTextOn('Debug Menuverificar','Archivos Escrit',160,80,0,220)
	movermouse(-20,50)
	$respuesta=MsgBox(4,'Escritorio','Desea borrar las pavadas del escritorio?')
	if $respuesta=6 then limpiarescritorio()



	if $debug=1 then SplashTextOn('Debug Menuverificar','Pinned Taskbar',160,80,0,220)
	$text1=''
	$text2=''
	$text3=''
	if FileExists(@AppDataDir& '\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Internet Explorer.lnk') then $text1=@CRLF&'Internet Explorer'
	if FileExists(@AppDataDir& '\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Windows Media Player.lnk') then $text2=@CRLF&'Windows Media Player'
	if @OSVersion='WIN_8' or @OSVersion='WIN_81' then $text3=@CRLF&'Tienda'
;~ 	if $text1<>'' or $text2<>'' then circulo(150,@DesktopHeight -20,3,30,150)
	movermouse(20,45)
	MsgBox(0,'Pinned Taskbar','Borrar Pinned Taskbar:'&@crlf&$text1&$text2&$text3)


	if $debug=1 then SplashTextOn('Debug Menuverificar','Numlock',160,80,0,220)
	movermouse(-50,60)
	$inp=InputBox('Numlock','Probar Numlock y TOUCHPAD.')
	movermouse(-20,50)
	$respuesta=MsgBox(4,'Numlock','Si -> Continuar'&@CRLF&'No -> Escribir TXT')
	if $respuesta=7 then FileWrite(@DesktopDir&'\Falla NumLock o TouchPad- Probar al reiniciar.txt','')

;~ 	movermouse(-25,50)
;~ 	$respuesta=MsgBox(4,'Ejecutar','Borrar listado ejecutar?')
;~ 	if $respuesta=6 then
;~ 		RegDelete('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU')
;~ 	EndIf


	if $debug=1 then SplashTextOn('Debug Menuverificar','Firefox',160,80,0,220)
	movermouse(75,50)
	$respuesta=MsgBox(4,'Firefox','Instalar extensiones y probar internet?'&@CRLF&'(no olvidar Modo Incognito)')

			;abrir ventana de navegador predeterminado
		;	ShellExecute('control',' /name Microsoft.DefaultPrograms /page pageDefaultProgram')

	if $respuesta=6 then


		finalizar()
		;chromesettings()
		;chromeextensiones()
		;ShellExecute('chrome',' https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=es')

		if FileExists(@DesktopDir&'\FirefExtABRIR.au3') then
			If @OSArch='X86' Then ShellExecute('AutoIt3.exe','FirefExtABRIR.au3',@DesktopDir)
			If @OSArch='X64' Then ShellExecute('AutoIt3_x64.exe','FirefExtABRIR.au3',@DesktopDir)
			WinWait('Ext Firefox')
			SplashTextOn('Espera','Menu Verif' & @crlf & 'Esperando terminar firefox',160,80,0,220)
			WinWaitClose('Ext Firefox')
			SplashOff()
		EndIf


		IF @OSVersion='WIN_7' THEN ShellExecute('explorer.exe',' shell:::{20D04FE0-3AEA-1069-A2D8-08002B30309D}\::{21EC2020-3AEA-1069-A2DD-08002B30309D}\::{38A98528-6CBF-4CA9-8DC0-B1E1D10F7B1B}')
		IF @OSVersion='WIN_10' THEN ShellExecute('explorer.exe',' ms-availablenetworks:')

;~ 		If @OSArch='X86' Then ShellExecute('AutoIt3.exe','ActivarInternet.au3')
;~ 		If @OSArch='X64' Then ShellExecute('AutoIt3_x64.exe','ActivarInternet.au3')
;~ 		IF @OSVersion='WIN_7' THEN ShellExecute('explorer.exe',' shell:::{20D04FE0-3AEA-1069-A2D8-08002B30309D}\::{21EC2020-3AEA-1069-A2DD-08002B30309D}\::{38A98528-6CBF-4CA9-8DC0-B1E1D10F7B1B}')
;~ 		IF @OSVersion='WIN_10' THEN ShellExecute('explorer.exe',' ms-availablenetworks:')
		return 0
	Else
		return 1
	EndIf
EndFunc




func chromeextensiones()
;~ 	ShellExecute('chrome',' "asd"')
	MenuEjecutarComoAdmin('chrome "asd"')
	Do
	Until WinExists('asd - Google Chrome') or WinExists('Sin título - Google Chrome')
	do
		WinActivate('asd - Google Chrome')
		WinActivate('Sin título - Google Chrome')
		Send('{altdown}{d}{altup}{ctrldown}{c}{ctrlup}')
		SplashTextOn('esperando 5 seg','',100,100,0,30)
	;~ 	Sleep(200)
		SplashOff()
	until ClipGet()='http://asd/'
	ClipPut('chrome://extensions/')
	Send('{ctrldown}{v}{ctrlup}{enter}')
EndFunc

func chromesettings()
	;MsgBox(0,'','settings')
;~ 	ShellExecute('chrome',' "asd"')
	MenuEjecutarComoAdmin('chrome "asd"')
	Do
	Until WinExists('asd - Google Chrome') or WinExists('Sin título - Google Chrome')
	do

		WinActivate('asd - Google Chrome')
		WinActivate('Sin título - Google Chrome')
		Send('{altdown}{d}{altup}{ctrldown}{c}{ctrlup}')
		SplashTextOn('esperando 5 seg','',100,100,0,30)
	;~ 	Sleep(200)
		SplashOff()
	until ClipGet()='http://asd/'
	ClipPut('chrome://settings/')
	Send('{ctrldown}{v}{ctrlup}{enter}')
EndFunc


Func cerrarvent($NombreVentana)
	if $NombreVentana='ESET NOD32 Antivirus' then
		do
			WinClose('ESET NOD32 Antivirus','Exclusiones')
		Until not WinExists('ESET NOD32 Antivirus','Exclusiones')
;~ 		if WinExists('ESET NOD32 Antivirus') then
;~ 			do

				WinsetState('ESET NOD32 Antivirus','',@SW_HIDE)
				WinMinimizeAll()
				WinMinimizeAllUndo()
				Sleep(300)
;~ 			until 5=WingetState('ESET NOD32 Antivirus','')
;~ 		EndIf
		Return
	Else
		while WinExists($NombreVentana)
			WinClose($NombreVentana)
		WEnd
	EndIf
EndFunc


func MalInstalado()

	If FileExists(@DesktopDir & "\Mal Instalado.txt") then
		$ProcessID=ShellExecute(@DesktopDir & "\Mal Instalado.txt")

		while not WinExists('Mal Instalado: Bloc de notas') and not WinExists('Mal Instalado.txt: Bloc de notas')
			Sleep(100)
		WEnd
		if WinExists('Mal Instalado: Bloc de notas') Then WinActivate('Mal Instalado: Bloc de notas')
		if WinExists('Mal Instalado.txt: Bloc de notas') then WinActivate('Mal Instalado.txt: Bloc de notas')

		movermouse(-5,50)
		$respuesta=MsgBox(4,'Mal Instalado','Desea borrar el archivo Mal "Instalado.txt"?')
		if $respuesta=6 then
			ProcessClose($ProcessID)
			borrarconwhile(@DesktopDir&'\Mal Instalado.txt')
		EndIf
	EndIf
EndFunc

func sonido()
	SoundPlay('Apagado de Windows XP.wav', 1)
	movermouse(-20,50)
	$respuesta=MsgBox(4,'Sonido','Desea volver a reproducir el Sonido?')
	if $respuesta=6 then
		sonido()
	Else

		movermouse(-20,43)
		$respuesta=MsgBox(4,'Sonido','El sonido funciona bien?')
		if $respuesta=6 then
			togglecolor('Button1')
			Return 1
		Else
			FileWrite(@DesktopCommonDir&'\Sonido.txt','')
			Return 1
		EndIf
	EndIf

EndFunc

func existenod()
	If FileExists ($ProgramFilesDir &'\ESET\ESET NOD32 Antivirus\egui.exe') or FileExists ($ProgramFilesDir &' (x86)\ESET\ESET NOD32 Antivirus\egui.exe') Then return 1
	Return 0
EndFunc

Func NodExclu()
	If FileExists ($ProgramFilesDir &'\ESET\ESET NOD32 Antivirus\egui.exe') Then
		ShellExecute($ProgramFilesDir &'\ESET\ESET NOD32 Antivirus\egui.exe')
	Elseif FileExists ($ProgramFilesDir &' (x86)\ESET\ESET NOD32 Antivirus\egui.exe') Then
		ShellExecute($ProgramFilesDir &' (x86)\ESET\ESET NOD32 Antivirus\egui.exe')
	Else
		$Errornodalfinal=1
		Return
		if @OSVersion='WIN_10' then $saltar=1
		if @OSVersion<>'WIN_10' then MsgBox(0,'Menu Verificar','No encontre nod32 para verificar exclusiones',6)
		if @OSVersion<>'WIN_10' then MsgBox(0,'Menu Verificar','No encontre nod32 para verificar exclusiones')
		if @OSVersion<>'WIN_10' then $saltar=MsgBox(1,'Menu Verificar','Continuo con la verificacion?')
		if $saltar=2 then
			Exit
		Else
			Return
		EndIf

	EndIf


	While not WinExists ('ESET NOD32 Antivirus','Predeterminado')
		WinWait('ESET NOD32 Antivirus')
		WinActivate('ESET NOD32 Antivirus')
		Send('{F5}')
	WEnd

$exit=0
while $exit<20
	Sleep(100)
	if WinExists('ESET NOD32 Antivirus','Protección Antivirus y antiespía') then
		$exit=20
		WinActivate('ESET NOD32 Antivirus','Protección Antivirus y antiespía')
		WinWaitActive('ESET NOD32 Antivirus','Protección Antivirus y antiespía')
		Send('{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}')
	Else
		$exit=20;$exit+1
	EndIf
WEnd

	$sentido=0
	while not WinExists('ESET NOD32 Antivirus','Exclusiones')
		Sleep(500)
		if not WinActive('ESET NOD32 Antivirus','') then WinActivate('ESET NOD32 Antivirus','')

		if WinExists('ESET NOD32 Antivirus','Integración con el cliente de correo electrónico') then $sentido=1
		if WinExists('ESET NOD32 Antivirus','Protección Antivirus y antiespía') then $sentido=0
		if $sentido=0 then Send('{down}')
		if $sentido=1 then Send('{up}')
	WEnd
;	MsgBox(0,'','salgo de nodexclu')

EndFunc

func actoffice()
	$veroffice=0
	$existe=0
;MsgBox(0,'',$ProgramFilesDir & "\Microsoft Office\Office14\WINWORD.EXE")
	if FileExists($ProgramFilesDir & "\Microsoft Office\Office14\WINWORD.EXE") Then
		ShellExecute($ProgramFilesDir & "\Microsoft Office\Office14\WINWORD.EXE")
		$t=0
		while not WinActive('Documento1 - Microsoft Word','MsoDockTop')
;		while not WinExists('Documento1 - Microsoft Word','MsoDockTop')
			$t=$t+1
			if $t>300 then MsgBox(0,'','menuverificar falla ventana word. en el while en donde está este texto agregar que saque esa ventana de falla')
			WinActivate('Documento1 - Microsoft Word','MsoDockTop')
			Sleep(100)
		WEnd
		Opt('SendKeyDelay',600)
		Send('{altdown}{a}{x}{altup}')
		Opt('SendKeyDelay',5)
		$existe=1
		$veroffice=2010
	EndIf

	If FileExists($ProgramFilesDir & "\Microsoft Office 15\root\office15\WINWORD.EXE") Then
		;MsgBox(0,'','Menuverificar en office 2013 falta sacar la ventana de bienvenido. Todo el codigo que sigue sin la ventana funciona bien')
		ShellExecute($ProgramFilesDir & "\Microsoft Office 15\root\office15\WINWORD.EXE")
		WinWait('Word','MsoDockTop');ventana comun
		Opt('SendKeyDelay', 600)
		Send('{f10}{d}{f10}{a}{w}')
		Opt('SendKeyDelay', 5)
		$existe=1
		$veroffice=2013
	EndIf

	If FileExists($ProgramFilesDir & "\Microsoft Office\root\office16\WINWORD.EXE") Then
		ShellExecute($ProgramFilesDir & "\Microsoft Office\root\office16\WINWORD.EXE")
		WinWait('Word','MsoDockTop')
		Opt('SendKeyDelay', 1600)
		Send('{f10}{d}{f10}{a}{w}')
		Opt('SendKeyDelay', 5)
		$existe=1
		$veroffice=2016
	EndIf

;~ 	if @OSVersion<>'WIN_XP' And @OSVersion<>'WIN_7' And @OSVersion<>'WIN_10' Then MsgBox(0,'','menu verificar falta codigo office')
	if $existe=0 Then FileWrite(@DesktopDir & "\No hay instalado ningun office.txt",""&@CRLF)
	return $veroffice
EndFunc


func msconfig($ServProg)
	RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','MSConfig')

	Do
		ProcessClose('msconfig1.exe')
		ProcessClose('msconfig.exe')
		ProcessClose('taskmgr.exe')
	Until not ProcessExists ('msconfig.exe') and Not ProcessExists ('taskmgr.exe') and Not ProcessExists('msconfig1.exe')

;	if @OSVersion<>'WIN_XP' And @OSVersion<>'WIN_7' And @OSVersion<>'WIN_10' Then MsgBox(0,'','menu verificar falta codigo msconfig')
	if @OSVersion<>'WIN_XP' And @OSVersion<>'WIN_7' And @OSVersion<>'WIN_81' And @OSVersion<>'WIN_10' Then MsgBox(0,'','menu verificar falta codigo msconfig')
;MsgBox(0,'','ANTES DE EJEC')
if $debug=1 then SplashTextOn('Depurando msconfig','MenuEjecutarComoAdmin',300,80,0,220)
	MenuEjecutarComoAdmin('msconfig.exe')		;Lo que se pega en ejecutar
if $debug=1 then SplashOff()

; hasta aca abrir msconfig
;~ MsgBox(0,'','DESP DE EJEC (ver nombre ventana antes de continuar)')
	If @OSVersion='WIN_XP' Then $msconfig='Utilidad de configuración del sistema'
	If @OSVersion='WIN_7' Then $msconfig='Configuración del sistema'
	If @OSVersion='WIN_81' Then $msconfig='Configuración del sistema'
	If @OSVersion='WIN_10' Then $msconfig='Configuración del sistema'

	WinWait($msconfig)
	WinActivate($msconfig)
	WinWaitActive($msconfig)
	If @OSVersion='WIN_XP' Then
		while (ControlCommand ($msconfig, "", 'SysTabControl321', "CurrentTab", "" )) <> 5 + $ServProg
			ControlCommand ($msconfig, "", 'SysTabControl321', "TabRight", "" )
			Sleep(200)
			if (ControlCommand ($msconfig, "", 'SysTabControl321', "CurrentTab", "" )) = 7 Then msconfig($ServProg)
		WEnd
	EndIf
	If @OSVersion='WIN_7' Then
		while (ControlCommand ($msconfig, "", 'SysTabControl321', "CurrentTab", "" )) <> 3 + $ServProg
			ControlCommand ($msconfig, "", 'SysTabControl321', "TabRight", "" )
			Sleep(200)
			if (ControlCommand ($msconfig, "", 'SysTabControl321', "CurrentTab", "" )) = 5 Then msconfig($ServProg)
			ConsoleWrite(@CRLF&ControlCommand ($msconfig, "", 'SysTabControl321', "CurrentTab", "" )&@CRLF)
		WEnd
	EndIf
	If @OSVersion='WIN_81' Then
		while (ControlCommand ($msconfig, "", 'SysTabControl321', "CurrentTab", "" )) <> 3 + $ServProg
			ControlCommand ($msconfig, "", 'SysTabControl321', "TabRight", "" )
			Sleep(200)
			if (ControlCommand ($msconfig, "", 'SysTabControl321', "CurrentTab", "" )) = 7 Then msconfig($ServProg)
			ConsoleWrite(@CRLF&ControlCommand ($msconfig, "", 'SysTabControl321', "CurrentTab", "" )&@CRLF)
		WEnd
	EndIf
	If @OSVersion='WIN_10' Then

		while (ControlCommand ($msconfig, "", 'SysTabControl321', "CurrentTab", "" )) <> 3 + $ServProg
			ControlCommand ($msconfig, "", 'SysTabControl321', "TabRight", "" )
			Sleep(200)
			if (ControlCommand ($msconfig, "", 'SysTabControl321', "CurrentTab", "" )) = 7 Then msconfig($ServProg)
			ConsoleWrite(@CRLF&ControlCommand ($msconfig, "", 'SysTabControl321', "CurrentTab", "" )&@CRLF)
		WEnd
	EndIf
	If @OSVersion='WIN_XP' Then ControlCommand($msconfig,'&Ocultar todos los servicios de Microsoft','Button1',"Check", "")
	If @OSVersion='WIN_7' Then ControlCommand($msconfig,'&Ocultar todos los servicios de Microsoft','Button3',"Check", "")
	If @OSVersion='WIN_81' Then ControlCommand($msconfig,'&Ocultar todos los servicios de Microsoft','Button3',"Check", "")
	If @OSVersion='WIN_10' Then ControlCommand($msconfig,'&Ocultar todos los servicios de Microsoft','Button3',"Check", "")



;	If @OSVersion='WIN_10' Then
	If @OSVersion='WIN_81' or @OSVersion='WIN_10' Then
		ShellExecute('Taskmgr')
		$VentAdminTareas='Administrador de tareas'

		WinWait($VentAdminTareas)
		WinActivate($VentAdminTareas)
		WinWaitActive($VentAdminTareas)




		Do
			$pos1=WinGetPos('Administrador de tareas');~ contr
			WinActivate('Administrador de tareas')
			WinWaitActive('Administrador de tareas')
			ControlSend('Administrador de tareas','','DirectUIHWND1','{altdown}{d}{altup}')
			$pos2=WinGetPos('Administrador de tareas');~ contr
		until $pos1[2]<$pos2[2]





		while (ControlCommand ($VentAdminTareas, "", 'SysTabControl321', "CurrentTab", "" )) <> 4
			;MsgBox(0,'','b')
			ControlCommand ($VentAdminTareas, "", 'SysTabControl321', "TabRight", "" )
			;MsgBox(0,'','c')
			if (ControlCommand ($VentAdminTareas, "", 'SysTabControl321', "CurrentTab", "" )) = 7 Then msconfig($ServProg)
			;MsgBox(0,'','d')
			ConsoleWrite(@CRLF&ControlCommand ($VentAdminTareas, "", 'SysTabControl321', "CurrentTab", "" )&@CRLF)
		WEnd
	EndIf


EndFunc

;~ func centsegurwinupdate()
;~ 	if @OSVersion = 'WIN_XP' Then
;~ 		ShellExecute('WSCUI.CPL')
;~ 		WinWait('Centro de seguridad de Windows')
;~ 	EndIf

;~ 	if @OSVersion = 'WIN_7' Then
;~ 		Opt('SendKeyDelay', 200)
;~ 			while WinExists('Windows Update') Or WinExists('Cambiar configuración')
;~ 				WinClose('Cambiar configuración')
;~ 				WinClose('Windows Update')
;~ 			WEnd
;~ 			ShellExecute('control',' wuaucpl.cpl')
;~ 			WinWait('Windows Update')
; 			Sleep(200)
; 			Send('{SHIFTDOWN}{tab}{tab}{tab}{tab}{tab}{SHIFTUP}{space}')
; 		$i=0
; 		While Not WinExists('Cambiar configuración') And $i<3
; 			$i=$i+1
; 			Sleep(1000)
; 		WEnd
; 		If Not WinExists('Cambiar configuración') Then Send('{SHIFTDOWN}{tab}{tab}{tab}{tab}{tab}{SHIFTUP}{space}')
;~ 		Opt('SendKeyDelay', 5)
;~ 	EndIf
;~ 	if @OSVersion<>'WIN_XP' And @OSVersion<>'WIN_7' And @OSVersion<>'WIN_10' Then MsgBox(0,'','menu verificar falta codigo centro seguridad')
;~ EndFunc


func centsegurwinupdate2()
	if @OSVersion = 'WIN_XP' Then
		ShellExecute('WSCUI.CPL')
		WinWait('Centro de seguridad de Windows')
	EndIf

	if @OSVersion = 'WIN_7' Then
		ShellExecute('cmd',' /c wuapp.exe /detectnow','','',@SW_HIDE)
		WinWaitActive('Windows Update','Panel de control')
		$pos=WinGetPos('Windows Update','Panel de control')
		;~ MouseMove($pos[0]+100,$pos[1]+158)
		MouseClick('left',$pos[0]+100,$pos[1]+158,1,0)
	EndIf

	if @OSVersion = 'WIN_10' Then
		MenuEjecutarComoAdmin('ms-settings:windowsupdate')
;		ShellExecute('ms-settings:windowsupdate')
	EndIf


EndFunc


func restaursistema()
	if @OSVersion='WIN_XP' then
		ShellExecute(@WindowsDir & '\System32\restore\rstrui.exe')
;~ 		WinWait('Restaurar sistema')
;~ 		if WinExists ('Restaurar sistema','Restaurar sistema ha sido desactivado') Then
;~ 			while ProcessExists ('rstrui.exe')
;~ 				ProcessClose ('rstrui.exe')
;~ 			WEnd
;~ 			FileWrite(@DesktopDir & "\Bien Verificado.txt","OK Restaurar sistema desactivado"&@CRLF)
;~ 		Else
;~ 			FileWrite(@DesktopDir & "\Mal Verificado.txt","FALLO Restaurar sistema"&@CRLF)
;~ 		EndIf
	EndIf

	if @OSVersion='WIN_7' or @OSVersion='WIN_81' or @OSVersion='WIN_10' then
		Sleep(2000)
;		ShellExecute('cmd',' /c control.exe sysdm.cpl,,4','','',@SW_HIDE)
		;ventanitacomandoejecutar('control.exe sysdm.cpl,,4')
		MenuEjecutarComoAdmin('control.exe sysdm.cpl,,4')

	EndIf
	if @OSVersion<>'WIN_XP' And @OSVersion<>'WIN_7' And @OSVersion<>'WIN_81' And @OSVersion<>'WIN_10' Then MsgBox(0,'','menu verificar falta codigo rest sist')

EndFunc

func drivers()
	ShellExecute('devmgmt.msc')
	if @OSVersion = 'WIN_XP' Then
		WinWait('Administrador de dispositivos')
	EndIf
;	if @OSVersion = 'WIN_7' or @OSVersion = 'WIN_10' Then
	if @OSVersion = 'WIN_7' or @OSVersion = 'WIN_81' or @OSVersion = 'WIN_10' Then
		WinWait('Administrador de dispositivos')
	EndIf
;	if @OSVersion<>'WIN_XP' And @OSVersion<>'WIN_7' And @OSVersion<>'WIN_10' Then MsgBox(0,'','menu verificar falta codigo drivers')
	if @OSVersion<>'WIN_XP' And @OSVersion<>'WIN_7' And @OSVersion<>'WIN_81' And @OSVersion<>'WIN_10' Then MsgBox(0,'','menu verificar falta codigo drivers')

EndFunc

Func w710validado()
	if @OSVersion='WIN_7' Then
		ShellExecute('control.exe',' system')
		WinWait('Sistema')
		send('{down}{down}{down}{down}')
;~ 		ShellExecute('Validar W7\W7 Loader\w7lxe.exe','')
;~ 		WinWait('Activation (Basic Mode)','Modo Avanzado (Advanced Mode)')
;~ 		if ControlGetText('Activation (Basic Mode)','','TMemo1') = ('Already activated!') Then
;~ 			FileWrite(@DesktopDir & "\Bien Verificado.txt","OK W7 Validado"&@CRLF)
;~ 		Else
;~ 			while ProcessExists('w7lxe.exe')
;~ 				ProcessClose('w7lxe.exe')
;~ 			WEnd
;~ 				FileWrite(@DesktopDir & "\Mal Verificado.txt","Fallo validador W7"&@CRLF)
;~ 		EndIf
;~ 		while ProcessExists('w7lxe.exe')
;~ 			ProcessClose('w7lxe.exe')
;~ 		WEnd
	EndIf
;	if @OSVersion='WIN_10' Then
	if @OSVersion='WIN_81' or @OSVersion='WIN_10' Then
		ShellExecute('control.exe',' system')
		Do
			Sleep(10)
		Until WinExists('Sistema') or WinExists('Configuración')
	EndIf
EndFunc


Func verifwmp11()
	if @OSVersion='WIN_XP' Then
		if FileExists($ProgramFilesDir &"\Windows Media Player\wmplayer.exe") Then
			ShellExecute ($ProgramFilesDir &"\Windows Media Player\wmplayer.exe")
			While Not WinExists('Reproductor de Windows Media 11') and Not WinExists('Reproductor de Windows Media')
				sleep (500)
			WEnd
			sleep (1000)
			if WinExists('Reproductor de Windows Media 11','&Validar') Then
				FileWrite(@DesktopDir & "\Mal Verificado.txt","FALLO WMP, Falta validar"&@CRLF)
			ElseIf WinExists('Reproductor de Windows Media 11','Elija la configuración principal del Reproductor') Then
				FileWrite(@DesktopDir & "\Mal Verificado.txt","FALLO WMP, Falta configurar"&@CRLF)
			ElseIf WinExists('Reproductor de Windows Media','Barra de herramientas de diseño y visualización') Then
				FileWrite(@DesktopDir & "\Bien Verificado.txt","OK WMP11"&@CRLF)
				ProcessClose('wmplayer.exe')
			EndIf

		Else
			FileWrite(@DesktopDir & "\Mal Verificado.txt","FALLO WMP, No se encuentra wmplayer.exe"&@CRLF)
;~ 			MsgBox(0,'','Falla WMP, No se encuentra wmplayer.exe')
		EndIf
	EndIf

EndFunc






func confnod32()
	$nod1 = RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000101\Profiles\@My profile','DiskFloppyOnExecuteAH')
	$nod2 = RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000101\Profiles\@My profile','OnOpen_AdvanceHeuristic')
	$nod3 = RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Profiles\@My profile','WUWarningLevel')
	$nod4 = RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000102\Profiles\@My profile','BuildRescan')
	$nod5 = RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Profiles\@My profile','SampleEnable')
	$nod6 = RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Profiles\@My profile','StatisticsEnabled')

	if ($nod1 + $nod2 + $nod3 + $nod4 + $nod5 + $nod6) = 0 then FileWrite(@DesktopDir & "\Bien Verificado.txt","OK Configuracion NOD"&@CRLF)
	if ($nod1 + $nod2 + $nod3 + $nod4 + $nod5 + $nod6) <> 0 then FileWrite(@DesktopDir & "\Mal Verificado.txt","FALLO Configuracion NOD"&@CRLF)

EndFunc


func verifadblock()

;	Verificar adblock
	if FileExists($ProgramFilesDir & "\Google\Chrome\Application\chrome.exe") Then
		ShellExecute('chrome.exe',' chrome-extension://cfhdojbkjhnklbpkdaibdccddilifddb/firstRun.html')
		WinWait('Se ha instalado Adblock Plus - Google Chrome')
		sleep(6000)
		ShellExecute('chrome.exe',' chrome-extension://cfhdojbkjhnklbpkdaibdccddilifddb/options.html')
		WinWait('Opciones de Adblock Plus - Google Chrome')
		sleep(4000)
	;-------- 	FUNC MOUSE	--------------------------
;~ 		SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Conf. Ad Block P.' & @crlf & 'No tocar el Mouse',160,80,0,70)
;~ 		WinSetState('Opciones de Adblock Plus - Google Chrome','',@SW_MAXIMIZE)
;~ 		WinActivate('Opciones de Adblock Plus - Google Chrome')
;~ 		WinWaitActive('Opciones de Adblock Plus - Google Chrome')
;~ 		$positionArray = WinGetPos ('Opciones de Adblock Plus - Google Chrome')
;~ 		WinActivate('Opciones de Adblock Plus - Google Chrome')
;~ 		WinWaitActive('Opciones de Adblock Plus - Google Chrome')
;~ 		MouseMove($positionArray[0] + 105 , $positionArray[1] + 337,0)
;~ 		WinActivate('Opciones de Adblock Plus - Google Chrome')
;~ 		WinWaitActive('Opciones de Adblock Plus - Google Chrome')
;~ 		MouseClick('left')

;~ 		WinSetState('Opciones de Adblock Plus - Google Chrome','',@SW_MAXIMIZE)
;~ 		WinActivate('Opciones de Adblock Plus - Google Chrome')
;~ 		WinWaitActive('Opciones de Adblock Plus - Google Chrome')
;~ 		$positionArray = WinGetPos ('Opciones de Adblock Plus - Google Chrome')
;~ 		WinActivate('Opciones de Adblock Plus - Google Chrome')
;~ 		WinWaitActive('Opciones de Adblock Plus - Google Chrome')
;~ 		MouseMove($positionArray[0] + 68 , $positionArray[1] + 460,0)
;~ 		WinActivate('Opciones de Adblock Plus - Google Chrome')
;~ 		WinWaitActive('Opciones de Adblock Plus - Google Chrome')
;~ 		MouseClick('left')

;~ 		WinSetState('Opciones de Adblock Plus - Google Chrome','',@SW_MAXIMIZE)
;~ 		WinActivate('Opciones de Adblock Plus - Google Chrome')
;~ 		WinWaitActive('Opciones de Adblock Plus - Google Chrome')
;~ 		$positionArray = WinGetPos ('Opciones de Adblock Plus - Google Chrome')
;~ 		WinActivate('Opciones de Adblock Plus - Google Chrome')
;~ 		WinWaitActive('Opciones de Adblock Plus - Google Chrome')
;~ 		MouseMove($positionArray[0] + 68 , $positionArray[1] + 472,0)
;~ 		WinActivate('Opciones de Adblock Plus - Google Chrome')
;~ 		WinWaitActive('Opciones de Adblock Plus - Google Chrome')
;~ 		MouseClick('left')
	;-------------------------------------------------
	WinSetState('Opciones de Adblock Plus - Google Chrome','',@SW_MAXIMIZE )
;~ 	WinActivate('Opciones de Adblock Plus - Google Chrome')
;~ 	WinWaitActive('Opciones de Adblock Plus - Google Chrome')
;~ 	send('{tab}{tab}{tab}{tab}{tab}{tab}{tab}{space}')
;~ 	send('{tab}{tab}{tab}{tab}{tab}{tab}{space}')
;~ WinSetState(
;~ 	{}{}@SW_MAXIMIZE

EndIf
EndFunc

Func tareaprog()
	ShellExecute('taskschd.msc')
	WinWait('Programador de tareas')
	$exit=0
	$loop=0
	while not WinExists('Programador de tareas','General') And $exit<4
		WinActivate('Programador de tareas')
		if WinActive('Programador de tareas') Then Send('{down}')
		$exit=$exit+1
		Sleep(1000)
	WEnd
EndFunc

func lusrmgr()
	if @OSVersion='WIN_7' then
		ShellExecute('mmc',' lusrmgr.msc')

		WinWait('lusrmgr - [Usuarios y grupos locales (local)]')
		$timer=0
		$cant=0
		while $timer<3 And $cant<>2
			$timer=$timer+1
			Sleep(1000)
			$cant=ControlListView('lusrmgr - [Usuarios y grupos locales (local)]','','SysListView321',"GetItemCount") ;<> 4 And $1<7
		WEnd

		while not WinExists('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
			WinActivate('lusrmgr - [Usuarios y grupos locales (local)]')
			ControlSend('lusrmgr - [Usuarios y grupos locales (local)]','','SysTreeView321','{right}')
		WEnd

		$cant=99
		while WinExists('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]') And $cant<>3
			$cant=ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"GetItemCount")
		WEnd

		While not ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"IsSelected",2)
			ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"Select",2)
		WEnd

		While not WinExists('Propiedades: Usuario','')
			ControlClick('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321')
			WinActivate('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
			WinWaitActive('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
			While not ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"IsSelected",2)
				ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"Select",2)
			WEnd
			Send('{altdown}{enter}{altup}')

			$timer=0
			while $timer<3 And not WinExists('Propiedades: Usuario','')
				$timer=$timer+1
				Sleep(1000)
			WEnd
		WEnd
	EndIf

	if @OSVersion='WIN_10' Then
	$ventana='Propiedades de '&@UserName


		While WinExists($ventana)
			WinClose($ventana)
		WEnd
		;MsgBox(0,'','1')
		While WinExists('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
			WinClose('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
		WEnd
		;MsgBox(0,'','2')
		While WinExists('lusrmgr - [Usuarios y grupos locales (local)]')
			WinClose('lusrmgr - [Usuarios y grupos locales (local)]')
		WEnd
		;MsgBox(0,'','3')
		ShellExecute('mmc',' lusrmgr.msc')

		WinWait('lusrmgr - [Usuarios y grupos locales (local)]')
		;MsgBox(0,'','4')

		$timer=0
		$cant=0
		while $timer<3 And $cant<>2
			$timer=$timer+1
			Sleep(1000)
			$cant=ControlListView('lusrmgr - [Usuarios y grupos locales (local)]','','SysListView321',"GetItemCount") ;<> 4 And $1<7
			;MsgBox(0,'',$cant)
		WEnd
		;MsgBox(0,'','1')

		while not WinExists('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
			WinActivate('lusrmgr - [Usuarios y grupos locales (local)]')
			ControlSend('lusrmgr - [Usuarios y grupos locales (local)]','','SysTreeView321','{right}')
		WEnd
		;MsgBox(0,'','2')

		$cant=99
		if @OSVersion='WIN_7' then
			$cantwin=3
		ElseIf @OSVersion='WIN_10' then
			$cantwin=4
		Else
			MsgBox(0,'','Falla modificar lusrmgr')
		EndIf
		;MsgBox(0,'','asd')
		while WinExists('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]') And $cant<>$cantwin
			$cant=ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"GetItemCount")
 			;MsgBox(0,'',$cant)
		WEnd
		;MsgBox(0,'','A')


		;-- aca obtengo nro de item = a usuario actual -------------------------
		for $i=0 to $cant-1 step 1
			$j=ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"GetText", $i,0)
			if $j=@UserName then ExitLoop
		Next


	if @OSVersion='WIN_10' then $ventana='Propiedades de '& @UserName

		While not WinExists($ventana)
			WinActivate('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
			WinWaitActive('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]')
			ControlClick('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321')
			ControlListView('lusrmgr - [Usuarios y grupos locales (local)\Usuarios]','','SysListView321',"Select", $i,0)



			Send('{altdown}{enter}{altup}')
			$timer=0
			while $timer<3 And not WinExists($ventana)
				;MsgBox(0,'','r')
				$timer=$timer+1
				Sleep(1000)
			WEnd
		WEnd
	EndIf
EndFunc

func passwordexpira()
	$prog=ShellExecute('cmd',' /k net user '&@UserName)
EndFunc


Func circulo($X,$Y,$XDesp,$radio,$salida)
	$i = 0
	$count=0
	MouseMove($X,$Y,30)
	While 1
		MouseMove($X + $XDesp*($radio * Cos($i)), $Y + ($radio * Sin($i)),0)
		$i += 0.1
		Sleep(10)
		if $count>=$salida then Return $count
		$count=$count+1
	WEnd
EndFunc

func finalizar()
	if WinExists('Menu en modo LOCAL') then WinActivate('Menu en modo LOCAL')
	if WinExists('Menu en modo RED') then WinActivate('Menu en modo RED')
	if WinExists('QUE HACER EN PC nuevo: Bloc de notas') or WinExists('QUE HACER EN PC nuevo.txt: Bloc de notas') Then
		WinActivate('QUE HACER EN PC nuevo: Bloc de notas')
		WinActivate('QUE HACER EN PC nuevo.txt: Bloc de notas')
	Elseif FileExists(@DesktopDir&'\QUE HACER EN PC nuevo.txt') then
		ShellExecute(@DesktopDir&'\QUE HACER EN PC nuevo.txt')
	EndIf

	Return 1
EndFunc

func extensiones()

		ShellExecute('ARCHIVOS PRUEBA')
		WinWait('ARCHIVOS PRUEBA')

		;MenuEjecutarComoAdmin('control /name Microsoft.DefaultPrograms /page pageDefaultProgram')
		;ShellExecute('control',' /name Microsoft.DefaultPrograms /page pageDefaultProgram')

		;Do
		;	Sleep(2000)
		;Until WinExists('Establecer programas predeterminados','Descripción del programa') or WinExists('Configuración','Configuración')



; TEXTO EN W7 32 Lite POR SI FALLA EN W10
;~ Dirección: Panel de control\Todos los elementos de Panel de control\Programas predeterminados\Establecer programas predeterminados
;~ Establecer programas predeterminados
;~ ShellView
;~ Descripción del programa
;~ Aceptar





EndFunc


func cerrarloqueestabien()
	if @OSVersion='WIN_XP' Then
		$imagen = ('Visor de imágenes y fax de Windows')
		$propimagen = ('Propiedades de IMAGEN')
		$propmusica = ('Propiedades de MUSICA')
		$propvideo = ('Propiedades de VIDEO')
	EndIf

	if @OSVersion='WIN_7' Then
		$imagen = ('Visualizador de fotos de Windows')
		$propimagen = ('Propiedades: IMAGEN')
		$propmusica = ('Propiedades: MUSICA')
		$propvideo = ('Propiedades: VIDEO')
	EndIf

	if @OSVersion='WIN_8' Then
		MsgBox(0,'','menuverificar falta codigo w8 extensiones')
	EndIf

	if @OSVersion='WIN_81' Then
		$imagen = ('Visualizador de fotos de Windows')
		$propimagen = ('Propiedades de IMAGEN')
		$propmusica = ('Propiedades de MUSICA')
		$propvideo = ('Propiedades de VIDEO')
	EndIf

	if @OSVersion='WIN_10' Then
		$imagen = ('Visualizador de fotos de Windows')
		$propimagen = ('Propiedades de IMAGEN')
		$propmusica = ('Propiedades de MUSICA')
		$propvideo = ('Propiedades de VIDEO')
	EndIf

	$musica = ('Winamp')
	$video = ('MPC-HC')
	While WinExists($propvideo,$video)
		WinClose($propvideo,$video)
	wend

	While WinExists($propmusica,$musica)
		WinClose($propmusica,$musica)
	wend

	While WinExists($propimagen,$imagen)
		WinClose($propimagen,$imagen)
	wend
EndFunc

func minimizartodo()
	$ventactiva=WinGetTitle("[active]")
	send('#{d}')	;minimizar todo y esperar al escritorio
	while $ventactiva=WinGetTitle("[active]")
	WEnd
EndFunc


func togglecolor($texto)
	Opt('MouseClickDelay',100)
	ControlClick('MenuVerificar GUI','',$texto)
	Opt('MouseClickDelay',10)
EndFunc

func borrarcacheiconos()
	if @OSVersion='WIN_XP' then
		Do
			MsgBox(0,'','menuverificar falta codigo cache iconos windows xp')
		Until 0
	EndIf

	if @OSVersion='WIN_7' then $diriconcache=@LocalAppDataDir
	if @OSVersion="WIN_10" or @OSVersion="WIN_81" or @OSVersion="WIN_8" then $diriconcache=@LocalAppDataDir&'\Microsoft\Windows\Explorer'

	ShellExecuteWait('cmd',' /c del iconcache*.db',$diriconcache,'',@SW_HIDE)

EndFunc

func ventanitacomandoejecutar($comando)
	ShellExecute('explorer.exe',' Shell:::{2559a1f3-21d7-11d4-bdaf-00c04f60b9f0}','','',@SW_HIDE)	;abrir ventana ejecutar
MsgBox(0,'','1',5)

	WinWait('Ejecutar','Escriba el nombre del programa')
MsgBox(0,'','2',5)
	while ControlGetText('Ejecutar','','Edit1') <> $comando
		ControlsetText('Ejecutar','','Edit1',$comando)								;pegar comando
	WEnd
	while WinExists('Ejecutar','Escriba el nombre del programa')					;clickear aceptar
		ControlClick('Ejecutar','','Button2')
	WEnd
EndFunc

func ListaExclusionWinDefender()
	Global $lista = ""
	For $i = 1 To 100
		$sVar = RegEnumval("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths", $i)
		MsgBox(0,'','aca')
		If @error <> 0 Then ExitLoop
		MsgBox(0,'',$sVar)
		$lista=$sVar&@crlf& $lista
	Next
	MsgBox(0,'Exclusiones WinDefender',$lista)





;~ 	ShellExecuteWait('regjump','HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths')

EndFunc

func regjump()
	RegWrite('HKEY_CURRENT_USER\Software\Sysinternals\Regjump','EulaAccepted','REG_DWORD',1)
	if @OSVersion='WIN_10' then ShellExecuteWait('regjump','HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths')
EndFunc



Func MenuEjecutarComoAdmin($comando)

;~ SplashTextOn('Espera','Menuejecutarcomoadmin ' & @crlf & '1',160,180,0,320)

	if @OSVersion='WIN_10' or @OSVersion= 'WIN_8' or @OSVersion= 'WIN_81' then
		$ventana='Administrador de tareas'
		$ventana2='Crear nueva tarea'
	ElseIf @OSVersion='WIN_7' then
		$ventana='Administrador de tareas de Windows'
		$ventana2='Crear una tarea nueva'
	Else
		MsgBox(0,'','ventanita ejecutar falla, falta código')
	EndIf
;~ SplashTextOn('Espera','Menuejecutarcomoadmin ' & @crlf & '2',160,180,0,320)
	Do
		WinClose($ventana)
	until not WinExists($ventana)
	send('{ctrldown}{shiftdown}{esc}{ctrlup}{shiftup}')				;Espero ventana de Administrador de Tareas
	WinWait($ventana)
	WinActivate($ventana)
	WinSetTrans($ventana,'',150)
	WinWaitActive($ventana)
	$antes=WinGetPos($ventana)										;obtengo tamaño antes
	$despues=$antes

;~ SplashTextOn('Espera','Menuejecutarcomoadmin ' & @crlf & '3',160,180,0,320)

	if @OSVersion<>'WIN_7' then
		send('{altdown}{d}{altup}')
		do
			$despues=WinGetPos($ventana)								;obtengo tamaño despues
		until $despues[2]<>$antes[2]

		if $antes[2]>$despues[2] then									;si tamaño mas chico cambio a ventana grande
			WinActivate($ventana)
			WinWaitActive($ventana)
			send('{altdown}{d}{altup}')
		EndIf
	EndIf
;~ SplashTextOn('Espera','Menuejecutarcomoadmin ' & @crlf & '4',160,180,0,320)

	send('{altdown}{a}{n}{altup}')									;Abro ventanita ejecutar
	WinWait($ventana2,'Escriba el nombre del programa')
	;Espero ventanita de ejecutar
	do
		ControlsetText($ventana2,'','Edit1',$comando)				;Pegar comando
	until ControlGetText($ventana2,'','Edit1') = $comando
;~ SplashTextOn('Espera','Menuejecutarcomoadmin ' & @crlf & '5',160,180,0,320)

	Sleep(1000)
;~ MsgBox(0,'','ACA')
	if @OSVersion<>'WIN_7' and ControlGetText($ventana2,'','Static5')<>'Esta tarea se creará con privilegios administrativos.' then

		while ControlCommand($ventana2,'','Button2','ischecked')=0
			ControlClick($ventana2,'','Button2')						;Clickear con privilegios administrativos
		WEnd
	EndIf
;SplashTextOn('Espera','Autoit corriendo ' & @crlf & ControlGetText($ventana2,'','Button2')& @crlf & ControlGetText($ventana2,'','Button3'),160,180,0,220)
;~ SplashTextOn('Espera','Menuejecutarcomoadmin ' & @crlf & '6',160,180,0,320)

	while WinExists($ventana2,'Escriba el nombre del programa')		;Clickear aceptar

		if ControlGetText($ventana2,'','Button3')='Aceptar' then
			ControlClick($ventana2,'','Button3')
			MsgBox(0,'','no sacar',1)
		EndIf

		if ControlGetText($ventana2,'','Button2')='Aceptar' then
			ControlClick($ventana2,'','Button2')
			MsgBox(0,'','no sacar',1)
		EndIf

	WEnd
;~ SplashTextOn('Espera','Menuejecutarcomoadmin ' & @crlf & '7',160,180,0,320)



	WinWaitClose($ventana2,'Escriba el nombre del programa')

	Do																;Cerrar ventana de administrador de tareas
		WinClose($ventana)
	until not WinExists($ventana)
;~ splashoff()
EndFunc