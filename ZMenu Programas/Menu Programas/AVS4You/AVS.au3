#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf

$Instalador='INSTALLPACK'&'.exe'

;Instalar Silencioso
$SilentSwitch=' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
;~ $SilentSwitch=' /S'
;~ $SilentSwitch=' /Silent'


;Instalar con Ventana
$vent='VentanaDelPrograma'

;Nombre para mostrar con splash
$NombrePrograma='AVS4YOU'

;Ruta Instalacion.

$ruta='AVS4YOU\'
$exe=$ruta&'Registration.exe'

;~ agragar
;~ vhs


$patch='Patch.exe'
$ventpatch='AVS4YOU® Software Patch 1.0'


;Solo Juego: mover acceso directo a carpeta Juegos en escritorio
$accesojuego='Zombie Night Terror Special Edition.lnk'



SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. '&$NombrePrograma,160,80,0,110)

$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


If FileExists($Instalador) AND not FileExists ($ProgramFilesDir&'\'&$exe) AND not FileExists ($ProgramFilesDir&' (x86)\'&$exe) Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	"&$NombrePrograma&@CRLF)


;Instalar silencioso
	ShellExecuteWait($Instalador,$SilentSwitch)


;~ ;Instalar con Patch
	ShellExecute($patch)
	WinWait($ventpatch,'HOW TO USE')
;~ 	WinWait($ventpatch,'Auto-Patch')
;~ 	Exit
;~ 	Sleep
	Do
		if WinExists($ventpatch,'HOW TO USE') then clickear($ventpatch,'Auto-Patch')
		if WinExists('Info','patched') then clickear('Info','Aceptar')
		if WinExists($ventpatch,'PATCH END') then WinClose($ventpatch)
		Sleep(100)
	until not WinExists($ventpatch)



;Copiar LOADER
	if FileExists ($ProgramFilesDir&'\'&$exe) then

		FileCopy('AVSConv Loader.exe',$ProgramFilesDir&'\'&$ruta&'AVSConv Loader.exe',1)
		FileCopy('AVS VHS.exe',$ProgramFilesDir&'\'&$ruta&'AVS VHS.exe',1)
		FileCopy('avserror.exe',$ProgramFilesDir&'\'&$ruta&'avserror.exe',1)

		FileCreateShortcut($ProgramFilesDir&'\'&$ruta&'AVSConv Loader.exe',@DesktopDir&'\AVSConv Loader.lnk',$ProgramFilesDir&'\'&$ruta)
		FileCreateShortcut($ProgramFilesDir&'\'&$ruta&'AVS VHS.exe',@DesktopDir&'\AVS VHS.lnk',$ProgramFilesDir&'\'&$ruta)
	ElseIf FileExists ($ProgramFilesDir&' (x86)\'&$exe) Then

		FileCopy('AVSConv Loader.exe',$ProgramFilesDir&' (x86)\'&$ruta&'AVSConv Loader.exe',1)
		FileCopy('AVS VHS.exe',$ProgramFilesDir&' (x86)\'&$ruta&'AVS VHS.exe',1)
		FileCopy('avserror.exe',$ProgramFilesDir&' (x86)\'&$ruta&'avserror.exe',1)

		FileCreateShortcut($ProgramFilesDir&' (x86)\'&$ruta&'AVSConv Loader.exe',@DesktopDir&'\AVSConv Loader.lnk',$ProgramFilesDir&'\'&$ruta)
		FileCreateShortcut($ProgramFilesDir&' (x86)\'&$ruta&'AVS VHS.exe',@DesktopDir&'\AVS VHS.lnk',$ProgramFilesDir&'\'&$ruta)
	Else
		MsgBox(0,$NombrePrograma,'No encontre ejecutable. Cerrando')
		Exit
	EndIf


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
	For $i=1 to 999 step 1
		if ControlGetText($vent,$textoboton,'Button'&$i)=$textoboton and ControlCommand($vent,$textoboton,'Button'&$i,'ischecked','')=1 then Return 1
		if ControlGetText($vent,$textoboton,'TsCheckBox'&$i)=$textoboton and ControlCommand($vent,$textoboton,'TsCheckBox'&$i,'ischecked','')=1 then Return 1
	Next
	Return 0
EndFunc


func clickear($vent,$textoboton)
	For $i=1 to 999 step 1
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
	Next
EndFunc

;EOF



