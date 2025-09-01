if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. VC Redist',160,80,0,110)

$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)

If not FileExists($ProgramFilesDir&'\MenuInstalado\VC') and FileExists('Setup.exe') then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	VC Redist"&@CRLF)
	$textoventana='Microsoft Visual Basic/C++ Redistributable Setup'

	ShellExecute('Setup.exe')
	ProcessWait('Setup.exe')

	While ProcessExists ("Setup.exe")
		if WinExists($textoventana) Then
			if ControlGetText($textoventana,'','Button1')='Next' and ControlCommand($textoventana,'','Button1',"IsVisible", "") then ControlClick($textoventana,'Next','Button1')
			if ControlGetText($textoventana,'','Button1')='Finish' and ControlCommand($textoventana,'','Button1',"IsVisible", "") then ControlClick($textoventana,'Finish','Button1')
		EndIf
		sleep(500)
	WEnd


	DirCreate($ProgramFilesDir&'\MenuInstalado')
	FileWrite($ProgramFilesDir&'\MenuInstalado\VC','')


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	VC Redist"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","VC Redist"&@CRLF)
EndIf

