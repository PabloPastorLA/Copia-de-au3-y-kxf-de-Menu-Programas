#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf

$Instalador='idman638build22'&'.exe'

;Instalar Silencioso
$SilentSwitch=' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
;~ $SilentSwitch=' /S'
;~ $SilentSwitch=' /Silent'


;Instalar con Ventana
$vent0='IDM Setup'
$vent1='Asistente de instalación de Internet Download Manager'
$vent2='Por favor, lee la licencia de IDM'
$vent3='Elegir ubicación de destino'
$vent4='Comenzar la instalación de Internet Download Manager'
$vent5='Instalación Completa'

;Nombre para mostrar con splash
$NombrePrograma='IDM'

;Ruta Instalacion.
$ruta='Internet Download Manager\IDMan.exe'

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
;~ 	ShellExecuteWait($Instalador,$SilentSwitch)


;Instalar con ventana
	ShellExecute($Instalador)
	ProcessWait('idman638build22.exe')
	ProcessWaitClose('idman638build22.exe')
	$proceso=''
	for $i=1 to 99 step 1
		if ProcessExists('IDM'&$i&'.tmp') then $proceso=('IDM'&$i&'.tmp')
	Next
	if $proceso='' then
		MsgBox(0,'','Error en proceso de IDM. Cerrando...')
		Exit
	EndIf



	Do
		if WinExists($vent0,'OK') then clickear($vent0,'OK')
		if WinExists($vent1,'Siguiente >') then clickear($vent1,'Siguiente >')
		if WinExists($vent2,'License Agreement') and estachequeado($vent2,'Acepto los términos en el acuerdo de licencia')=0 then clickear($vent2,'Acepto los términos en el acuerdo de licencia')
		if WinExists($vent2,'License Agreement') and estachequeado($vent2,'Acepto los términos en el acuerdo de licencia')=1 then clickear($vent2,'Siguiente >')
		if WinExists($vent3,'Para instalar en una carpeta diferente') and estachequeado($vent3,'Crear un icono para IDM en el escritorio')=1 then clickear($vent3,'Crear un icono para IDM en el escritorio')
		if WinExists($vent3,'Para instalar en una carpeta diferente') and estachequeado($vent3,'Crear un icono para IDM en el escritorio')=0 then clickear($vent3,'Siguiente >')
		if WinExists($vent4,'Ahora estás listo ') then clickear($vent4,'Siguiente >')
		if WinExists($vent5,'Se ha instalado ') then clickear($vent5,'Finalizar >')
		Sleep(100)
	until not ProcessExists($proceso)

;Copiar Extension chrome a escritorio
	if FileExists ($ProgramFilesDir&'\'&$ruta) then
		FileCopy($ProgramFilesDir&'\Internet Download Manager\IDMGCExt59.crx',@DesktopDir&'\IDMGCExt59.crx',9)
	ElseIf FileExists ($ProgramFilesDir&' (x86)\'&$ruta) Then
		FileCopy($ProgramFilesDir&' (x86)\Internet Download Manager\IDMGCExt59.crx',@DesktopDir&'\IDMGCExt59.crx',9)
	Else
		MsgBox(0,$NombrePrograma,'No encontre extension Chrome. Cerrando...')
		Exit
	EndIf


;esperar y cerrar todo
	ProcessWait('IDMan.exe')
	Do
		WinClose('Google Chrome Integration',' funcione con IDM propiamente.')
		WinClose('Integración del navegador de IDM')
		WinClose('Integración en Microsoft Edge')
		WinClose('Una nueva versión de Internet Download Manager está disponible')

	until not ProcessExists('IDMan.exe')


	ProcessWait('IEMonitor.exe')
	ProcessWait('IDMan.exe')
	Do
		ProcessClose('IEMonitor.exe')
		ProcessClose('IDMan.exe')
	until not ProcessExists	('IDMan.exe') and not ProcessExists('IEMonitor.exe')



;Copiar crack
	if FileExists ($ProgramFilesDir&'\'&$ruta) then
		FileCopy('IDMan.exe',$ProgramFilesDir&'\'&$ruta,9)
		FileCopy('IDMGrHlp.exe',$ProgramFilesDir&'\Internet Download Manager\IDMGrHlp.exe',9)
	ElseIf FileExists ($ProgramFilesDir&' (x86)\'&$ruta) Then
		FileCopy('IDMan.exe',$ProgramFilesDir&' (x86)\'&$ruta,9)
		FileCopy('IDMGrHlp.exe',$ProgramFilesDir&' (x86)\Internet Download Manager\IDMGrHlp.exe',9)
	Else
		MsgBox(0,$NombrePrograma,'No encontre ejecutable de cracks. Cerrando')
		Exit
	EndIf



;Registro
	RegWrite('HKEY_CURRENT_USER\Software\DownloadManager','CheckUpdtVM','REG_SZ',0)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Internet Download Manager','CheckUpdtVM','REG_SZ',0)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Internet Download Manager','CheckUpdtVM','REG_SZ',0)


	ShellExecuteWait('Hosts Blocker.bat','','','',@SW_HIDE)





;Mover Acceso Directo a Juegos
;~ 	Do
;~ 	until FileExists (@DesktopDir&'\'&$accesojuego)
;~ 	Do
;~ 		FileMove(@DesktopDir&'\'& $accesojuego,@DesktopCommonDir&'\Juegos\'& $accesojuego,9)
;~ 	Until not FileExists (@DesktopDir&'\'&$accesojuego)


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



