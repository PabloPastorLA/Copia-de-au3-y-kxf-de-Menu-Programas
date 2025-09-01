if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
#include <File.au3>

$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)

$NombrePrograma='Notepad++'

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Notepad ++',160,80,0,110)

If FileExists('npp.6.9.1.Installer.exe') AND not FileExists ($ProgramFilesDir&'\Notepad++\notepad++.exe') AND not FileExists ($ProgramFilesDir&' (x86)\Notepad++\notepad++.exe') Then
	;MsgBox(0,'','')
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	"&$NombrePrograma&@CRLF)

	ShellExecuteWait("npp.6.9.1.Installer.exe"," /S")

	if FileExists(@ProgramFilesDir & '\Notepad++\config.model.xml') then
		$arch=FileOpen(@ProgramFilesDir & '\Notepad++\config.model.xml')
		For $i =0 to 100 step 1
			if FileReadLine($arch,$i) = '        <GUIConfig name="noUpdate">no</GUIConfig>' then
				_FileWriteToLine(@ProgramFilesDir & '\Notepad++\config.model.xml',$i,'        <GUIConfig name="noUpdate">yes</GUIConfig>',True)
			EndIf
		Next

	ElseIf FileExists(@ProgramFilesDir & ' (x86)\Notepad++\config.model.xml') then
		$arch=FileOpen(@ProgramFilesDir & ' (x86)\Notepad++\config.model.xml')
		For $i =0 to 100 step 1
			if FileReadLine($arch,$i) = '        <GUIConfig name="noUpdate">no</GUIConfig>' then
				_FileWriteToLine(@ProgramFilesDir & ' (x86)\Notepad++\config.model.xml',$i,'        <GUIConfig name="noUpdate">yes</GUIConfig>',True)
			EndIf
		Next

	Else
		MsgBox(0,'','no encontre xml notepad')
	EndIf


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	"&$NombrePrograma&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt",$NombrePrograma&@CRLF)
EndIf


