#include <MsgBoxConstants.au3>
if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. R Studio 7',160,80,0,110)

If FileExists("RStudio7.exe") AND not FileExists (@ProgramFilesDir & "\R-Studio\RStudio32.exe") AND not FileExists (@ProgramFilesDir & " (x86)\R-Studio\RStudio32.exe")  Then
	RegDelete('HKEY_CURRENT_USER\Software\R-TT')
	ShellExecuteWait("RStudio7.exe"," /S")

	crack()

	registro()

	FileWrite(@DesktopDir & "\Bien Instalado.txt","R Studio 7"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","R Studio 7"&@CRLF)
EndIf



func crack()
	if FileExists (@ProgramFilesDir & "\R-Studio\RStudio32.exe") Then
		FileCopy('Crack\RStudio32.exe',@ProgramFilesDir & "\R-Studio\RStudio32.exe",1)
		FileCopy('Crack\RStudio64.exe',@ProgramFilesDir & "\R-Studio\RStudio64.exe",1)
	ElseIf FileExists (@ProgramFilesDir & " (x86)\R-Studio\RStudio32.exe") Then
		FileCopy('Crack\RStudio32.exe',@ProgramFilesDir & " (x86)\R-Studio\RStudio32.exe",1)
		FileCopy('Crack\RStudio64.exe',@ProgramFilesDir & " (x86)\R-Studio\RStudio64.exe",1)
	Else
		while 1
			MsgBox(0,'','Fallo Crack r studio. no encontre destino')
		WEnd
	EndIf
EndFunc



func registro()
	if FileExists (@ProgramFilesDir & "\R-Studio\r-studio.exe") Then
		ShellExecute(@ProgramFilesDir & "\R-Studio\r-studio.exe")
	Elseif FileExists (@ProgramFilesDir & " (x86)\R-Studio\r-studio.exe") Then
		ShellExecute(@ProgramFilesDir & " (x86)\R-Studio\r-studio.exe")
	Else
		while 1
			MsgBox(0,'','Fallo registro r studio. no encontre exe')
		WEnd
	EndIf
	WinWait('Por favor, registre R-Studio Demo 7.8.160654')
	while WinExists('Por favor, registre R-Studio Demo 7.8.160654')
		ClipPut('Do1z6USGB+sPvR7JD+zAKwU9hlBQE/8MTYGbKXdFvuou+7k8egArDY+EsRigGExVhdx/pRoAgwrumwtOLEu7Gg5+AG4adwdwJ3Pnhg5qOXJlZ6HbHv8Eka3iAOn4')
		if not WinActive('Por favor, registre R-Studio Demo 7.8.160654') then WinActivate('Por favor, registre R-Studio Demo 7.8.160654')
		if WinActive('Por favor, registre R-Studio Demo 7.8.160654') then send ('{ctrldown}{v}{ctrlup}{tab}{ctrldown}{v}{ctrlup}{tab}{ctrldown}{v}{ctrlup}')
;~ MsgBox(0,'','modificar serial')
		$aPos=WinGetPos('Por favor, registre R-Studio Demo 7.8.160654')
		MouseClick('left',$aPos[0]+$aPos[2]*2/3,$aPos[1]+$aPos[3]*10/11,1,0)
		$exit=0
		While not WinExists('R-STUDIO') And $exit<18
			$exit=$exit+1
			Sleep(200)
		WEnd
		if WinExists('R-STUDIO') Then
			while WinExists('R-STUDIO')
				if not WinActive('R-STUDIO') Then WinActivate('R-STUDIO')
				if WinActive('R-STUDIO') Then send('{enter}')
				$exit=0
				While WinExists('R-STUDIO') And $exit<12
					$exit=$exit+1
					Sleep(200)
				WEnd
			WEnd
			$exit=0
			While not WinExists('R-STUDIO Network 7.8.160654 - Visualización de dispositivos') And $exit<12
				$exit=$exit+1
				Sleep(200)
			WEnd
			cerrar()
		EndIf

;~ 		MsgBox(0,'','aca')

		cerrar2()

		$exit=0
		While not WinExists('Por favor, registre R-Studio Demo 7.8.160654') and not WinExists('R-STUDIO Network 7.8.160654 - Visualización de dispositivos') And $exit<18
			$exit=$exit+1
			Sleep(200)
		WEnd
		if WinExists('Por favor, registre R-Studio Demo 7.8.160654') Then
;~ 			MsgBox(0,'','1')
			cerrar()
			registro()
		ElseIf WinExists('R-STUDIO Network 7.8.160654 - Visualización de dispositivos') Then
			cerrar()
			Exit
		Else
			While 1
				MsgBox(0,'','algo esta mal')
			WEnd
		EndIf
	WEnd
EndFunc



func cerrar()
	while ProcessExists('RStudio32.exe') or ProcessExists('RStudio64.exe')
		ProcessClose('RStudio32.exe')
		ProcessClose('RStudio64.exe')
	WEnd
EndFunc



func cerrar2()
	if FileExists (@ProgramFilesDir & "\R-Studio\r-studio.exe") Then
			ShellExecute(@ProgramFilesDir & "\R-Studio\r-studio.exe")
		Elseif FileExists (@ProgramFilesDir & " (x86)\R-Studio\r-studio.exe") Then
			ShellExecute(@ProgramFilesDir & " (x86)\R-Studio\r-studio.exe")
		Else
			while 1
				MsgBox(0,'','Fallo registro r studio. no encontre exe OTRO')
			WEnd
		EndIf
EndFunc
