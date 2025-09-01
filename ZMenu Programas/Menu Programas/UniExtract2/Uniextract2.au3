if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Universal Extractor 2',160,80,0,110)


$NombrePrograma='Universal Extractor 2'
$ruta='UniExtract2\UniExtract.exe'



$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


If FileExists('UniExtract2') AND not FileExists ($ProgramFilesDir&'\'&$ruta) AND not FileExists ($ProgramFilesDir&' (x86)\'&$ruta) Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	"&$NombrePrograma&@CRLF)

	if @OSArch<>'x86' then DirCopy('UniExtract2',@ProgramFilesDir & " (x86)\UniExtract2\")
	if @OSArch='x86' then DirCopy('UniExtract2',@ProgramFilesDir & "\UniExtract2\")

	If not FileExists (@ProgramFilesDir & "\UniExtract2\UniExtract.exe") and not FileExists (@ProgramFilesDir & " (x86)\UniExtract2\UniExtract.exe") Then
		While 1
			MsgBox(0,'','ERROR Uniextract2')
		WEnd
	EndIf


	If FileExists (@ProgramFilesDir & "\UniExtract2\UniExtract.exe") then ShellExecute(@ProgramFilesDir & "\UniExtract2\UniExtract.exe")
	if FileExists (@ProgramFilesDir & " (x86)\UniExtract2\UniExtract.exe") Then ShellExecute(@ProgramFilesDir & " (x86)\UniExtract2\UniExtract.exe")

	WinWait('Universal Extractor 2.0.0 RC 1')
	send('{altdown}{e}{c}{altup}')
	Sleep(300)
	while not WinExists('Preferencias')
		WinActivate('Universal Extractor 2.0.0 RC 1')
		WinWaitActive('Universal Extractor 2.0.0 RC 1')
		send('{altdown}{e}{c}{altup}')
		Sleep(300)
	WEnd
	while ControlCommand('Preferencias','enabled','Button2',"IsChecked", "") = 0
		ControlCommand('Preferencias','enabled','Button2',"check", "")
	WEnd
	while ControlCommand('Preferencias','Extraer en la &Subcarpeta con UniExtract','Button8',"IsChecked", "") = 0
		ControlCommand('Preferencias','Extraer en la &Subcarpeta con UniExtract','Button8',"check", "")
	WEnd
	while WinExists('Preferencias')
		ControlClick('Preferencias','&Aceptar','Button16')
	WEnd
	while WinExists('Universal Extractor 2.0.0 RC 1')
		ControlClick('Universal Extractor 2.0.0 RC 1','&Cancelar','Button7')
	WEnd



	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	"&$NombrePrograma&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt",$NombrePrograma&@CRLF)
EndIf






