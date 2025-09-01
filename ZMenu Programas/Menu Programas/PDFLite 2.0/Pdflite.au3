#include <File.au3>
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. PDF Lite',160,80,0,110)

If FileExists("Pdf Lite 2.0.exe") AND not FileExists (@ProgramFilesDir & "\PDFlite\PDFlite.exe") AND not FileExists (@ProgramFilesDir & " (x86)\PDFlite\PDFlite.exe")  Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	PDF Lite"&@CRLF)

	ShellExecuteWait('Pdf Lite 2.0.exe','')
	If FileExists (@ProgramFilesDir & "\PDFlite\PDFlite.exe") then
		ShellExecute(@ProgramFilesDir & "\PDFlite\PDFlite.exe",'','','',@SW_HIDE)
	ElseIf FileExists (@ProgramFilesDir & " (x86)\PDFlite\PDFlite.exe") Then
		ShellExecute(@ProgramFilesDir & " (x86)\PDFlite\PDFlite.exe",'','','',@SW_HIDE)
	Else
		MsgBox(0,'','PDFLite no escuentro ejecutable')
	EndIf

	While Not WinExists('PDFlite','Buscar:') And WinExists('Actualizar PDFlite')
		Sleep(500)
	WEnd
	Sleep(1000)
	$salir=0
	While Not FileExists(@AppDataDir & '\PDFlite\PDFlite-settings.txt') and $salir<8
		Sleep (1000)
		$salir=$salir+1
	WEnd
	if $salir=8 then MsgBox(0,'','no encontre arch de config')
	while ProcessExists('PDFlite.exe')
		ProcessClose('PDFlite.exe')
;~ 		MsgBox(0,'','b')
	WEnd
;~ MsgBox(0,'','fin')
	if FileExists(@AppDataDir & '\PDFlite\PDFlite-settings.txt') Then
		$Harch=FileOpen(@AppDataDir & '\PDFlite\PDFlite-settings.txt')
		$cantlineas=_FileCountLines(@AppDataDir & '\PDFlite\PDFlite-settings.txt')
		For $i=0 to $cantlineas step 1
			if FileReadLine($Harch,$i)='CheckForUpdates = true' then
				_FileWriteToLine(@AppDataDir & '\PDFlite\PDFlite-settings.txt',$i,'CheckForUpdates = false',True)
			EndIf
		Next
		FileClose($Harch)


		$Harch=FileOpen(@AppDataDir & '\PDFlite\PDFlite-settings.txt')
		$cantlineas=_FileCountLines(@AppDataDir & '\PDFlite\PDFlite-settings.txt')
		$encontrado=0
		For $i=0 to $cantlineas step 1
			if FileReadLine($Harch,$i)='CheckForUpdates = false' then
				$encontrado=1
			EndIf
		Next
		if $encontrado=0 then MsgBox(0,'','error pdflite no desactive update')

	Else
		MsgBox(0,'','error pdflite no encuentro archivos config')
	EndIf

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	PDF Lite"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","PDF Lite"&@CRLF)
EndIf