#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf


$Instalador='RevoUninProSetup.exe'
$SilentSwitch=' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'


$NombrePrograma='Revo Uninstaller'
$ruta='VS Revo Group\Revo Uninstaller Pro\RevoUninPro.exe'



SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. '&$NombrePrograma,160,80,0,110)


$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


If FileExists($Instalador) AND not FileExists ($ProgramFilesDir&'\'&$ruta) AND not FileExists ($ProgramFilesDir&' (x86)\'&$ruta) Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	"&$NombrePrograma&@CRLF)

;Instalar
	ShellExecuteWait($Instalador,$SilentSwitch)


;borrar y Copiar CRACK
	Do
		FileDelete(@AppDataCommonDir & '\VS Revo Group\Revo Uninstaller Pro\revouninstallerpro4.lic')
	until not FileExists(@AppDataCommonDir & '\VS Revo Group\Revo Uninstaller Pro\revouninstallerpro4.lic')
	do
		FileCopy('revouninstallerpro4.lic',@AppDataCommonDir & '\VS Revo Group\Revo Uninstaller Pro\revouninstallerpro4.lic',9)
	until FileExists(@AppDataCommonDir & '\VS Revo Group\Revo Uninstaller Pro\revouninstallerpro4.lic')

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	"&$NombrePrograma&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt",$NombrePrograma&@CRLF)
EndIf





;EOF


