#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. WiseDiskCleaner',160,80,0,110)


$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


If FileExists("WDCFree_10.2.8.779.exe") AND not FileExists ($ProgramFilesDir & "\Wise\Wise Disk Cleaner\WiseDiskCleaner.exe") AND not FileExists ($ProgramFilesDir & " (x86)\Wise\Wise Disk Cleaner\WiseDiskCleaner.exe") Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Wise Disk Cleaner"&@CRLF)

	FileCopy('Config definitivo.ini',@AppDataDir&'\Wise Disk Cleaner\Config.ini',9)

	ShellExecuteWait("WDCFree_10.2.8.779.exe",' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-')







	if FileExists ($ProgramFilesDir & "\Wise\Wise Disk Cleaner\WiseDiskCleaner.exe") then
		$ruta=$ProgramFilesDir & "\Wise\Wise Disk Cleaner\"
	ElseIf FileExists ($ProgramFilesDir & " (x86)\Wise\Wise Disk Cleaner\WiseDiskCleaner.exe") then
		$ruta=$ProgramFilesDir & " (x86)\Wise\Wise Disk Cleaner\"
	else
		MsgBox(0,'Wise Disk Cleaner','No encontre ejecutable. Cerrando')
		Exit
	EndIf


	FileCreateShortcut($ruta&'WiseDiskCleaner.exe',@DesktopDir&'\Clean Disk With 1-Click.lnk',$ruta,'-a','',$ruta&'1c.ico')





	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Wise Disk Cleaner"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","WiseDiskCleaner"&@CRLF)
EndIf

