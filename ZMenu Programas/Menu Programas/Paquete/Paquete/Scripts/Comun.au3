#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf

$Instalador='Setup'&'.exe'

;Instalar Silencioso
$SilentSwitch=' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
;~ $SilentSwitch=' /S'
;~ $SilentSwitch=' /Silent'


$vent='VentanaDelPrograma'

$NombrePrograma='Max Payne 1'

$ruta='Max Payne\MaxPayne.exe'

$patch='Patch.exe'
$ventpatch='AVS4YOU® Software Patch 1.0'


$accesojuego='Max Payne' & '.lnk'
;~ AccesoDirecto()
;~ Exit

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. '&$NombrePrograma,160,80,0,110)

$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


If FileExists($Instalador) AND not FileExists ($ProgramFilesDir&'\'&$ruta) AND not FileExists ($ProgramFilesDir&' (x86)\'&$ruta) and not FileExists(@HomeDrive&'\Games\'&$ruta) Then
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
;~ 	Do
;~ 		ProcessClose('YouTubeDownloader.exe')
;~ 	Until not ProcessExists('YouTubeDownloader.exe')

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
;~ 	if FileExists ($ProgramFilesDir&'\'&$ruta) then
;~ 		FileCopy('Crack\YouTubeDownloader.exe',$ProgramFilesDir&'\'&$ruta,9)
;~ 	ElseIf FileExists ($ProgramFilesDir&' (x86)\'&$ruta) Then
;~ 		FileCopy('Crack\YouTubeDownloader.exe',$ProgramFilesDir&' (x86)\'&$ruta,9)
;~ 	Else
;~ 		MsgBox(0,$NombrePrograma,'No encontre ejecutable. Cerrando')
;~ 		Exit
;~ 	EndIf


;Mover Acceso Directo a Juegos
;AccesoDirecto()

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	"&$NombrePrograma&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt",$NombrePrograma&@CRLF)
EndIf

func AccesoDirecto()
	Do
	until FileExists (@DesktopCommonDir &'\' & $accesojuego) or FileExists (@DesktopDir&'\'&$accesojuego)
	Do
		if StringRight($accesojuego,4)<>'.lnk' Then
			DirMove(@DesktopDir&'\'& $accesojuego,      @DesktopCommonDir&'\Juegos\'& $accesojuego,1)
			DirMove(@DesktopCommonDir&'\'& $accesojuego,@DesktopCommonDir&'\Juegos\'& $accesojuego,1)
		ElseIf StringRight($accesojuego,4)='.lnk' then
			FileMove(@DesktopDir&'\'& $accesojuego,      @DesktopCommonDir&'\Juegos\'& $accesojuego,9)
			FileMove(@DesktopCommonDir&'\'& $accesojuego,@DesktopCommonDir&'\Juegos\'& $accesojuego,9)
		Else
			MsgBox(0,$accesojuego,'Error, no se si es directorio o archivo')
		EndIf
	Until not FileExists (@DesktopCommonDir&'\'&$accesojuego) and not FileExists (@DesktopDir&'\'&$accesojuego)
EndFunc


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



