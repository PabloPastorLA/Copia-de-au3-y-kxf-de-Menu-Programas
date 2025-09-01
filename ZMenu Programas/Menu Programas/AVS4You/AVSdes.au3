#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf

$Instalador='unins000'&'.exe'

;Instalar Silencioso
$SilentSwitch=' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
;~ $SilentSwitch=' /S'
;~ $SilentSwitch=' /Silent'


;Instalar con Ventana
$vent='VentanaDelPrograma'

;Nombre para mostrar con splash
$NombrePrograma='Desinstalando AVS4YOU'

;Ruta Instalacion.
$ruta='AVS4YOU\'
$exe=$ruta&'unins000.exe'


$patch='Patch.exe'
$ventpatch='AVS4YOU® Software Patch 1.0'


;Solo Juego: mover acceso directo a carpeta Juegos en escritorio
$accesojuego='Zombie Night Terror Special Edition.lnk'

;~ accsso directo de receta y de vhs

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. '&$NombrePrograma,160,80,0,110)

$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


If 1 then;FileExists($Instalador) AND not FileExists ($ProgramFilesDir&'\'&$ruta) AND not FileExists ($ProgramFilesDir&' (x86)\'&$ruta) Then
		FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	"&$NombrePrograma&@CRLF)



if FileExists ($ProgramFilesDir&'\'&$exe) then
		$aFileList = _FileListToArray($ProgramFilesDir&'\AVS4YOU\','*',2)
		for $i=1 to UBound($aFileList)-1
			if FileExists($ProgramFilesDir&'\AVS4YOU\'&$aFileList[$i]&'\unins000.exe') then ShellExecuteWait($ProgramFilesDir&'\AVS4YOU\'&$aFileList[$i]&'\unins000.exe',$SilentSwitch)
;~ 			WinWait('Desinstalar - AVS')
;~ 			Do
;~ 				clickear('Desinstalar - AVS','&Sí')
;~ 			until not WinExists('Desinstalar - AVS')

		Next
		ShellExecuteWait($ProgramFilesDir&'\'&$exe,$SilentSwitch)
		Do
			DirRemove($ProgramFilesDir&'\'&$ruta,1)
		until not FileExists($ProgramFilesDir&'\'&$ruta)
		FileDelete(@DesktopDir&'\AVS VHS.lnk')
		FileDelete(@DesktopDir&'\AVSConv Loader.lnk')
	ElseIf FileExists ($ProgramFilesDir&' (x86)\'&$exe) Then
		$aFileList = _FileListToArray($ProgramFilesDir&' (x86)\AVS4YOU\','*')
		for $i=1 to UBound($aFileList)-1
			if FileExists($ProgramFilesDir&' (x86)\AVS4YOU\'&$aFileList[$i]&'\unins000.exe') then ShellExecuteWait($ProgramFilesDir&' (x86)\AVS4YOU\'&$aFileList[$i]&'\unins000.exe',$SilentSwitch)
;~ 			WinWait('Desinstalar - AVS')
;~ 			Do
;~ 				clickear('Desinstalar - AVS','&Sí')
;~ 			until not WinExists('Desinstalar - AVS')

		Next
		ShellExecuteWait($ProgramFilesDir&' (x86)\'&$exe,$SilentSwitch)
		Do
			DirRemove($ProgramFilesDir&' (x86)\'&$ruta,1)
		until not FileExists($ProgramFilesDir&' (x86)\'&$ruta)
		FileDelete(@DesktopDir&'\AVS VHS.lnk')
		FileDelete(@DesktopDir&'\AVSConv Loader.lnk')
	Else
		MsgBox(0,$NombrePrograma,'No encontre ejecutable. Cerrando')
		Exit
	EndIf


;Instalar silencioso



;Copiar LOADER


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



