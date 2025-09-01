SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Sacando Dll Suite' & @crlf & 'No tocar el Mouse',160,80,0,110)


$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)



If FileExists (@ProgramFilesDir &"\DLL Suite\DLLSuite.exe") or FileExists (@ProgramFilesDir &" (x86)\DLL Suite\DLLSuite.exe") Then
	if FileExists (@ProgramFilesDir &"\DLL Suite\DLLSuite.exe") Then $ruta = @ProgramFilesDir &"\DLL Suite"
	if FileExists (@ProgramFilesDir &" (x86)\DLL Suite\DLLSuite.exe") Then $ruta = @ProgramFilesDir &" (x86)\DLL Suite"

	If FileExists ($ruta &"\unins000.exe") Then
		FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Desinst DLL Suite"&@CRLF)
		ShellExecute($ruta &"\unins000.exe")

		WinWait("[CLASS:TForm]", "")
		WinActivate("[CLASS:TForm]", "")
		WinWaitActive("[CLASS:TForm]", "")

		SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Sacando Dll Suite' & @crlf & 'No tocar el Mouse',160,80,0,110)

		$positionArray = WinGetPos ("[CLASS:TForm]", "")
		WinActivate("[CLASS:TForm]", "")
		WinWaitActive("[CLASS:TForm]", "")
		MouseMove($positionArray[0] + 475 , $positionArray[1] + 420,0)
		WinActivate("[CLASS:TForm]", "")
		WinWaitActive("[CLASS:TForm]", "")
		MouseClick('left')

		$i=0
		while ProcessExists ('_iu14D2N.tmp') and $i<11
			sleep (1000)
			$i=$i+1
		WEnd

		if ProcessExists ('_iu14D2N.tmp') Then ultimo()

		DirCreate($ProgramFilesDir&'\MenuInstalado')
		FileWrite($ProgramFilesDir&'\MenuInstalado\DLL','')

		FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Desinst DLL Suite"&@CRLF)
	else
		FileWrite(@DesktopDir & "\Mal Instalado.txt","No existe el desinstalador de DLLSuite"&@CRLF)
	EndIf
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","No se instalo ni desinstalo DLLSuite"&@CRLF)
EndIf





func ultimo()

	$positionArray = WinGetPos ("[CLASS:TForm]", "")
	WinActivate("[CLASS:TForm]", "")
	WinWaitActive("[CLASS:TForm]", "")
	MouseMove($positionArray[0] + 330 , $positionArray[1] + 400,0)
	WinActivate("[CLASS:TForm]", "")
	WinWaitActive("[CLASS:TForm]", "")
	MouseClick('left')

	WinWaitClose("[CLASS:TForm]", "")

EndFunc


