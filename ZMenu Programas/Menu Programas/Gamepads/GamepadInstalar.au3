#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf


SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Gamepads',160,80,0,110)

$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)

if not FileExists($ProgramFilesDir&'\Nefarius Software Solutions\ScpToolkit\ScpDriverInstaller.exe') and not FileExists($ProgramFilesDir&' (x86)\Nefarius Software Solutions\ScpToolkit\ScpDriverInstaller.exe') Then

	ProcessClose('ScpToolkit_Setup.exe')

;~ 	MsgBox(0,'Gamepads','Falla ventada drivers 1')

	ShellExecute('ScpToolkit_Setup.exe','/exenoupdates')
	WinWait('ScpToolkit Setup')
	WinWaitClose('ScpToolkit Setup')
	WinWait('ScpToolkit Setup')
	Sleep(1000)
	Do
;~ 			MsgBox(0,'Gamepads','Falla ventada drivers 2')

		WinActivate('ScpToolkit Setup')
		$pos=WinGetPos('ScpToolkit Setup')

		MouseMove($pos[0]+30,$pos[1]+445,0)
		MouseClick('left')
		MouseClick('left',$pos[0]+30,$pos[1]+445,0)
		Sleep(500)
		if not WinExists('ScpToolkit Setup') then ExitLoop
		Send('{altdown}{n}{altup}')
		Sleep(500)
		if not WinExists('ScpToolkit Setup') then ExitLoop
		Send('{altdown}{i}{altup}')
		Sleep(500)
		if not WinExists('ScpToolkit Setup') then ExitLoop
		Send('{altdown}{f}{altup}')

;~ 	MsgBox(0,'Gamepads','Falla ventada drivers 3')

		Sleep(2000)
		if not WinExists('ScpToolkit Setup') then ExitLoop
	until not WinExists('ScpToolkit Setup')
;~ 	MsgBox(0,'Gamepads','Falla ventada drivers 4444')

	while not FileExists($ProgramFilesDir&'\Nefarius Software Solutions\ScpToolkit\ScpDriverInstaller.exe') and not FileExists($ProgramFilesDir&' (x86)\Nefarius Software Solutions\ScpToolkit\ScpDriverInstaller.exe')
		Sleep(300)
	WEnd

;~ 	MsgBox(0,'Gamepads','Falla ventada drivers 5')

	while not FileExists($ProgramFilesDir&'\Nefarius Software Solutions\ScpToolkit\ScpDriverInstaller.exe') and not FileExists($ProgramFilesDir&' (x86)\Nefarius Software Solutions\ScpToolkit\ScpDriverInstaller.exe')
;~ 	MsgBox(0,'Gamepads','Falla ventada drivers 6')

		WinWait('ScpToolkit Setup')
		WinWaitActive('ScpToolkit Setup')

;~ 	MsgBox(0,'Gamepads','Falla ventada drivers 7')

		MsgBox(0,'Instalador de Gamepads.','Instalar a mano ScpToolkit.'&@CRLF&'Una vez que termine continuar')

	WEnd
EndIf


	MsgBox(0,'Gamepads','Falla ventada drivers 888888')





;Inst driver

ProcessClose('ScpDriverInstaller.exe')
	MsgBox(0,'Gamepads','Falla ventada drivers 9')

if FileExists($ProgramFilesDir&'\Nefarius Software Solutions\ScpToolkit\ScpDriverInstaller.exe') Then
	ShellExecute($ProgramFilesDir&'\Nefarius Software Solutions\ScpToolkit\ScpDriverInstaller.exe')
ElseIf FileExists($ProgramFilesDir&' (x86)\Nefarius Software Solutions\ScpToolkit\ScpDriverInstaller.exe') Then
	ShellExecute($ProgramFilesDir&' (x86)\Nefarius Software Solutions\ScpToolkit\ScpDriverInstaller.exe')
EndIf

	MsgBox(0,'Gamepads','Falla ventada drivers 10')

WinWait('ScpToolkit Driver Installer')
WinWaitActive('ScpToolkit Driver Installer')

	MsgBox(0,'Gamepads','Falla ventada drivers 11')

Sleep(1000)

Do
	WinActivate('ScpToolkit Driver Installer')
	$pos=WinGetPos('ScpToolkit Driver Installer')
	MouseMove($pos[0]+300,$pos[1]+300)
;	MsgBox(0,'','',10)
until PixelGetColor($pos[0]+300,$pos[1]+300)=5658198


	MsgBox(0,'Gamepads','Falla ventada drivers 12')



Do
	MouseMove($pos[0]+900,$pos[1]+70,0)
	MouseClick('left')
	MouseClick('left',$pos[0]+900,$pos[1]+70,0)
	if WinExists('Seguridad de Windows','Sólo debería instalar software de controlador ') then ControlClick('Seguridad de Windows','','Button1')
	Sleep(1000)
until PixelGetColor($pos[0]+300,$pos[1]+300)<>5658198
	MsgBox(0,'Gamepads','Falla ventada drivers 1333')

Do
	if WinExists('Seguridad de Windows','Sólo debería instalar software de controlador ') then ControlClick('Seguridad de Windows','','Button1')
	Sleep(1000)
until PixelGetColor($pos[0]+300,$pos[1]+300)=5658198
	MsgBox(0,'Gamepads','Falla ventada drivers 14')

do
	WinClose('ScpToolkit Driver Installer')
until not WinExists('ScpToolkit Driver Installer')

;termine inst driver

	MsgBox(0,'Gamepads','Falla ventada drivers 15')


;
filecopy('Gamepad.exe',@ProgramFilesDir&'\Gamepad\Gamepad.exe',9)
FileCreateShortcut(@ProgramFilesDir&'\Gamepad\Gamepad.exe',@DesktopDir&'\Gamepad.lnk',@ProgramFilesDir&'\Gamepad\')

FileDelete(@AppDataCommonDir&'\Microsoft\Windows\Start Menu\Programs\Startup\ScpToolkit Tray Notifications.lnk')
FileDelete(@DesktopCommonDir&'\ScpToolkit Settings Manager.lnk')
FileDelete(@DesktopCommonDir&'\ScpToolkit Updater.lnk')
FileDelete(@DesktopCommonDir&'\ScpToolkit Monitor (legacy).lnk')
FileDelete(@DesktopCommonDir&'\ScpToolkit Driver Installer.lnk')

Do
	ProcessClose('ScpUpdater.exe')
until not ProcessExists('ScpUpdater.exe')
if FileExists($ProgramFilesDir&'\Nefarius Software Solutions\ScpToolkit\ScpUpdater.exe') then FileMove($ProgramFilesDir&'\Nefarius Software Solutions\ScpToolkit\ScpUpdater.exe',$ProgramFilesDir&'\Nefarius Software Solutions\ScpToolkit\ScpUpdater     asd     .exe',0)
if FileExists($ProgramFilesDir&' (x86)\Nefarius Software Solutions\ScpToolkit\ScpUpdater.exe') then FileMove($ProgramFilesDir&' (x86)\Nefarius Software Solutions\ScpToolkit\ScpUpdater.exe',$ProgramFilesDir&' (x86)\Nefarius Software Solutions\ScpToolkit\ScpUpdater     asd     .exe',0)







;borrarupdaterdetareasprogramadas
	ShellExecuteWait('cmd.exe',' /C schtasks /end /TN "updater"','','',@SW_HIDE)
	ShellExecuteWait('cmd.exe',' /C schtasks /delete /TN "updater" /F','','',@SW_HIDE)


exit



$Instalador='Setup'&'.exe'

;Instalar Silencioso
$SilentSwitch=' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
;~ $SilentSwitch=' /S'
;~ $SilentSwitch=' /Silent'


;Instalar con Ventana
$vent='VentanaDelPrograma'

;Nombre para mostrar con splash
$NombrePrograma='NombreMostrar'

;Ruta Instalacion.
$ruta='MediaHuman\YouTuder\YouTubeDownloader.exe'

;Crackear con patch
$patch='Patch.exe'
$ventpatch='AVS4YOU® Software Patch 1.0'


;Solo Juego: mover acceso directo a carpeta Juegos en escritorio
$accesojuego='asd'&'.lnk'



SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. '&$NombrePrograma,160,80,0,110)

$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


If FileExists($Instalador) AND not FileExists ($ProgramFilesDir&'\'&$ruta) AND not FileExists ($ProgramFilesDir&' (x86)\'&$ruta) Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	"&$NombrePrograma&@CRLF)


;Instalar silencioso
	ShellExecuteWait($Instalador,$SilentSwitch)


;Instalar con ventana
;~ 	ShellExecute($Instalador)
;~ 	WinWait($vent)
;~ 	Do
;~ 		if WinExists($vent,'&Siguiente >') then clickear($vent,'&Siguiente >')
;~ 		if WinExists($vent,'&Sí') then clickear($vent,'&Sí')
;~ 		if WinExists($vent,'&Instalar') and estachequeado($vent,'Instalar accesos directos en el escritorio')=1 then clickear($vent,'Instalar accesos directos en el escritorio')
;~ 		if WinExists($vent,'&Instalar') and estachequeado($vent,'Instalar accesos directos en el escritorio')=0 then clickear($vent,'&Instalar')
;~ 		if WinExists($vent,'&Finalizar') then clickear($vent,'&Finalizar')
;~ 		Sleep(100)
;~ 	until (not WinExists($vent) and not WinExists('Configuración de QuickTime 7')) or $exit>=20


;esperar y cerrar
;~ 	if ProcessExists("YouTubeDownloader.exe") then MsgBox(0,'','existe proceso')
	Do
		ProcessClose('YouTubeDownloader.exe')
	Until not ProcessExists('YouTubeDownloader.exe')

;desinstalar lo que sobra
	if FileExists ($ProgramFilesDir&'\Apple Software Update\SoftwareUpdate.exe') then ShellExecuteWait('msiexec.exe',' /x {789A5B64-9DD9-4BA5-915A-F0FC0A1B7BFE} /qn')
	If FileExists ($ProgramFilesDir&' (x86)\Apple Software Update\SoftwareUpdate.exe') Then ShellExecuteWait('msiexec.exe',' /x {789A5B64-9DD9-4BA5-915A-F0FC0A1B7BFE} /qn')



;~ ;Crackear con Patch
;~ 	ShellExecute($patch)
;~ 	WinWait($ventpatch,'HOW TO USE')
;~ 	Do
;~ 		if WinExists($ventpatch,'HOW TO USE') then clickear($ventpatch,'Auto-Patch')
;~ 		if WinExists('Info','patched') then clickear('Info','Aceptar')
;~ 		if WinExists($ventpatch,'PATCH END') then WinClose($ventpatch)
;~ ; 		if WinExists($ventpatch,'&Instalar') and estachequeado($ventpatch,'Instalar accesos directos en el escritorio')=1 then clickear($ventpatch,'Instalar accesos directos en el escritorio')
;~ ; 		if WinExists($ventpatch,'&Instalar') and estachequeado($ventpatch,'Instalar accesos directos en el escritorio')=0 then clickear($ventpatch,'&Instalar')
;~ ; 		if WinExists($ventpatch,'&Finalizar') then clickear($ventpatch,'&Finalizar')
;~ 		Sleep(100)
;~ 	until not WinExists($ventpatch)



;Copiar CRACK
	if FileExists ($ProgramFilesDir&'\'&$ruta) then
		FileCopy('Crack\YouTubeDownloader.exe',$ProgramFilesDir&'\'&$ruta,9)
	ElseIf FileExists ($ProgramFilesDir&' (x86)\'&$ruta) Then
		FileCopy('Crack\YouTubeDownloader.exe',$ProgramFilesDir&' (x86)\'&$ruta,9)
	Else
		MsgBox(0,$NombrePrograma,'No encontre ejecutable. Cerrando')
		Exit
	EndIf


;Mover Acceso Directo a Juegos
	Do
	until FileExists (@DesktopDir&'\'&$accesojuego)
	Do
		FileMove(@DesktopDir&'\'& $accesojuego,@DesktopCommonDir&'\Juegos\'& $accesojuego,9)
	Until not FileExists (@DesktopDir&'\'&$accesojuego)


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	"&$NombrePrograma&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt",$NombrePrograma&@CRLF)
EndIf



func estachequeado($vent,$textoboton)
	For $i=1 to 99 step 1
		if ControlGetText($vent,$textoboton,'Button'&$i)=$textoboton and ControlCommand($vent,$textoboton,'Button'&$i,'ischecked','')=1 then Return 1
		if ControlGetText($vent,$textoboton,'TsCheckBox'&$i)=$textoboton and ControlCommand($vent,$textoboton,'TsCheckBox'&$i,'ischecked','')=1 then Return 1
		if ControlGetText($vent,$textoboton,'TCheckBox'&$i)=$textoboton and ControlCommand($vent,$textoboton,'TCheckBox'&$i,'ischecked','')=1 then Return 1
	Next
	Return 0
EndFunc


func clickear($vent,$textoboton)
	For $i=1 to 99 step 1
		if ControlGetText($vent,$textoboton,'Button'&$i)=$textoboton then
;			MsgBox(0,'','voy a clickear')
			ControlClick($vent,$textoboton,'Button'&$i)
			Return
		EndIf
		if ControlGetText($vent,$textoboton,'TsButton'&$i)=$textoboton then
;			MsgBox(0,'','voy a clickear')
			ControlClick($vent,$textoboton,'TsButton'&$i)
			Return
		EndIf
		if ControlGetText($vent,$textoboton,'TButton'&$i)=$textoboton then
;			MsgBox(0,'','voy a clickear')
			ControlClick($vent,$textoboton,'TButton'&$i)
			Return
		EndIf
	Next
EndFunc
;EOF



