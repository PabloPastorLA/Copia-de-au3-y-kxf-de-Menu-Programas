#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf

$Instalador='SETUP 64 BITS'&'.exe'

;Instalar Silencioso
;~ $SilentSwitch=' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$SilentSwitch=' /S'
;~ $SilentSwitch=' /Silent'


;Instalar con Ventana
$vent='VentanaDelPrograma'

;Nombre para mostrar con splash
$NombrePrograma='Movavi Video Converter'

;Ruta Instalacion.
$ruta=@AppDataDir&'\Movavi Video Converter 21 Premium'
$rutacompleta=@AppDataDir&'\Movavi Video Converter 21 Premium\converter.exe'
;Crackear con patch
$patch='Patch.exe'
$ventpatch='AVS4YOU® Software Patch 1.0'


;Solo Juego: mover acceso directo a carpeta Juegos en escritorio
$accesojuego='asd'&'.lnk'



;~ MsgBox(0,'',@AppDataDir&'\Movavi Video Converter 21 Premium\converter.exe')
;~ Exit
;~ C:\Users\Usuario\AppData\Roaming\Movavi Video Converter 21 Premium\converter.exe

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. '&$NombrePrograma,160,80,0,110)

$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)

;~ MsgBox(0,'',' /k copy "'&@ScriptDir&'\CRACK64\converter.exe" "'&$ruta&'\converter.exe"')


;~ Exit
If FileExists($Instalador) AND not FileExists ($rutacompleta) AND not FileExists ($rutacompleta) Then
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
	ProcessWait('ConverterAgent.exe')
	Do
		ProcessClose('ConverterAgent.exe')
	Until not ProcessExists('ConverterAgent.exe')

;desinstalar lo que sobra
;~ 	if FileExists ($ProgramFilesDir&'\Apple Software Update\SoftwareUpdate.exe') then ShellExecuteWait('msiexec.exe',' /x {789A5B64-9DD9-4BA5-915A-F0FC0A1B7BFE} /qn')
;~ 	If FileExists ($ProgramFilesDir&' (x86)\Apple Software Update\SoftwareUpdate.exe') Then ShellExecuteWait('msiexec.exe',' /x {789A5B64-9DD9-4BA5-915A-F0FC0A1B7BFE} /qn')



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
	if FileExists ($rutacompleta) and @OSArch='x86' then
;~ 		MsgBox(0,'','existe x86')
		do
			FileDelete($ruta&'\converter.exe')
		until not FileExists($ruta&'\converter.exe')
;~ 		ShellExecuteWait('cmd.exe',' /k copy "'&@ScriptDir&'\CRACK32\converter.exe" "'&$ruta&'\converter.exe"')
		FileCopy(@ScriptDir&'\CRACK32\Converter.exe',$ruta&'\Converter.exe',1)
	ElseIf FileExists ($rutacompleta) and @OSArch<>'x86' then
;~ 		MsgBox(0,'','existe x64')
		Do
			FileDelete($ruta&'\converter.exe')
			FileDelete($ruta&'\ConverterAgent.exe')
		until Not FileExists($ruta&'\converter.exe') and not FileExists($ruta&'\ConverterAgent.exe')
;~ 		ShellExecuteWait('cmd.exe',' /k copy "'&@ScriptDir&'\CRACK64\converter.exe" "'&$ruta&'\converter.exe"')
;~ 		ShellExecuteWait('cmd.exe',' /k copy "'&@ScriptDir&'\CRACK64\ConverterAgent.exe" "'&$ruta&'\ConverterAgent.exe"')
		FileCopy(@ScriptDir&'\CRACK64\Converter.exe',$ruta&'\Converter.exe',1)
		FileCopy(@ScriptDir&'\CRACK64\ConverterAgent.exe',$ruta&'\ConverterAgent.exe',1)

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



