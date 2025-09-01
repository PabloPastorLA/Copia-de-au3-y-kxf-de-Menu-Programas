#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf


;"cloudmounter.exe" /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-
$Instalador='cloudmounter.exe'

;Instalar Silencioso
$SilentSwitch=' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
;~ $SilentSwitch=' /S'
;~ $SilentSwitch=' /Silent'


;Instalar con Ventana
$vent='VentanaDelPrograma'

;Nombre para mostrar con splash
$NombrePrograma='Cloud Mounter'

;Ruta Instalacion.
$ruta='CloudMounter\CloudMounter.exe'

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


;MsgBox(0,'','')

ProcessClose('CloudMounter.exe')


ShellExecuteWait($Instalador,$SilentSwitch)


WinWait('CloudMounter')
Do
	ProcessClose('cloudmounter.exe')
	WinClose('CloudMounter')
	WinClose('CloudMounter Activation')
until not WinExists('CloudMounter Activation') and not WinExists('CloudMounter')

if FileExists($ProgramFilesDir&'\CloudMounter') then DirCopy('crack',$ProgramFilesDir&'\CloudMounter',1)
if FileExists($ProgramFilesDir&' (x86)\CloudMounter') then DirCopy('crack',$ProgramFilesDir&' (x86)\CloudMounter',1)







;~ 	dircopy('CloudMounter',$ProgramFilesDir&'\CloudMounter')
;~ 	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run','CloudMounter','REG_SZ',$ProgramFilesDir&'\CloudMounter\CloudMounter.exe /nowindow')
;~ 	FileCreateShortcut($ProgramFilesDir&'\CloudMounter\CloudMounter.exe',@DesktopDir&'\CloudMounter.lnk',$ProgramFilesDir&'\CloudMounter\')
;~ 	DirCreate(@ProgramsCommonDir&'\CloudMounter\')
;~ 	FileCreateShortcut($ProgramFilesDir&'\CloudMounter\CloudMounter.exe',@ProgramsCommonDir&'\CloudMounter\CloudMounter.lnk',$ProgramFilesDir&'\CloudMounter\')

;~ 	if not FileExists($ProgramFilesDir&'\Dokan\Dokan Library-1.4.1\dokanctl.exe') and not FileExists($ProgramFilesDir&' (x86)\Dokan\Dokan Library-1.4.1\dokanctl.exe') Then


;NO DESINSTALAR, MANDA A REINICIAR







;~ 		$existe=0
;~ 		If FileExists(@AppDataCommonDir&"\Package Cache\{9af3b5e1-ed1b-48df-a34f-22fa6bcc4b04}\DokanSetup.exe") then $existe=1




;~ 		if FileExists($ProgramFilesDir&'\CloudMounter\DokanSetup.exe') then
;~ 			ShellExecute($ProgramFilesDir&'\CloudMounter\DokanSetup.exe','',$ProgramFilesDir&'\CloudMounter\')
;~ 		ElseIf FileExists($ProgramFilesDir&' (x86)\CloudMounter\DokanSetup.exe') then
;~ 			ShellExecute($ProgramFilesDir&' (x86)\CloudMounter\DokanSetup.exe','',$ProgramFilesDir&' (x86)\CloudMounter\')
;~ 		Else
;~ 			MsgBox(0,'','Error cloudmounter en dokan')
;~ 		EndIf


;~ 		WinWait('Dokan Library 1.4.1.1000 Bundle Setup')
;~ 		if WinExists('Dokan Library 1.4.1.1000 Bundle Setup','&Uninstall') then $existe=1







;~ 		if $existe=1 Then
;~ 			WinWait('Dokan Library 1.4.1.1000 Bundle Setup','&Uninstall')
;~ 			Do
;~ 				if not 	WinExists('Dokan Library 1.4.1.1000 Bundle Setup','Are you sure you want to cancel?') then ControlClick('Dokan Library 1.4.1.1000 Bundle Setup','&Uninstall','Button17')
;~ 				if 		WinExists('Dokan Library 1.4.1.1000 Bundle Setup','Are you sure you want to cancel?') then ControlClick('Dokan Library 1.4.1.1000 Bundle Setup','Are you sure you want to cancel?','Button1')
;~ 			until not WinExists('Dokan Library 1.4.1.1000 Bundle Setup','&Uninstall')
;~ 		EndIf

;~ 		if $existe=0 Then
;~ 			WinWait('Dokan Library 1.4.1.1000 Bundle Setup','I &agree to the license terms and conditions')
;~ 			do
;~ 				ControlClick('Dokan Library 1.4.1.1000 Bundle Setup','','Button2')
;~ 				ControlClick('Dokan Library 1.4.1.1000 Bundle Setup','','Button4')
;~ 			until not WinExists('Dokan Library 1.4.1.1000 Bundle Setup','I &agree to the license terms and conditions')

;~ 			WinWait('Dokan Library 1.4.1.1000 Bundle Setup','&Close')
;~ 			;MsgBox(0,'','ll')
;~ 			do
;~ 				ControlClick('Dokan Library 1.4.1.1000 Bundle Setup','','Button20')
;~ 			until not WinExists('Dokan Library 1.4.1.1000 Bundle Setup')
;~ 		EndIf
;~ 	EndIf




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



