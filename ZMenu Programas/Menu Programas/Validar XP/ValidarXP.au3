SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Val. XP',160,80,0,110)

	;---		Cambiar LOGO E INFO OEM		---
	ShellExecuteWait('AutoIt3.exe',"Logoxp.au3", "Logo XP")
	;---------------------------------------------------------------






If FileExists("MGADiag.exe") and FileExists("MGADiag.exe") Then

	ShellExecuteWait("wganotifypackageinner.exe","/q /norestart","")
	ProcessWaitClose("wganotifypackageinner.exe")
	$x=6
	Global $serial[$x]
	$serial[1]="KR276-QTT6Q-BGFXV-KMK48-BKW3W"
	$serial[2]="GKRJK-Y778F-22VFF-847V2-7TYP3"
	$serial[3]="P4XK3-TGQ3P-F9JB2-GC6XQ-VXTMW"
	$serial[4]="RP4WP-GB23G-3DC4P-X446K-M2DMJ"
	$serial[5]="RP4WP-GB23G-3DC4P-X446K-M2DMJ"
	$x=1
	$exit=0
;~ 	MsgBox(0,'','1')
	while $exit=0
		run("MGADiag.exe")
		WinWait("Microsoft Genuine Advantage Diagnostic Tool (1.9.0027.0)","Press CONTINUE to perform diagnostics.")
		BlockInput(1)
		$seguridad=0
		While WinExists ("Microsoft Genuine Advantage Diagnostic Tool (1.9.0027.0)","Press CONTINUE to perform diagnostics.")
;~ 			$seguridad<=80 and
			WinActivate ("Microsoft Genuine Advantage Diagnostic Tool (1.9.0027.0)","Press CONTINUE to perform diagnostics.")
			Send("{ALTDOWN}{c}{ALTUP}")
			Sleep(100)
			$seguridad=$seguridad+1
		WEnd
		BlockInput(0)
;~ 		MsgBox(0,'','seguridad: '&$seguridad)
;~ MsgBox(0,'','2')
		ProcessWait("MGADiag.exe")
;~ 		MsgBox(0,'','3')

		WinWait("Microsoft Genuine Advantage Diagnostic Tool (1.9.0027.0)",'MGA Diagnostic Tool ver 2.0 ')
;~ 			MsgBox(0,'','ventana')
;~ 		MsgBox(0,'','4')

		If WinExists("Microsoft Genuine Advantage Diagnostic Tool (1.9.0027.0)","Genuine") Then
			$exit=1

		Else
			Processclose("MGADiag.exe")
			ProcessWaitclose("MGADiag.exe")
			ShellExecute("ChangeVLKeySP1.vbs",$serial[$x])
			ProcessWaitClose("wscript.exe")
			$x= $x + 1
		EndIf
		Processclose("MGADiag.exe")
		ProcessWaitclose("MGADiag.exe")
	WEnd
;~ MsgBox(0,'','termine wend')
   ;---		Cambiar Nombres wgalogon.dll a .exe y wgatray.exe a dll		---
;~ 	MsgBox(0,'','VERIFICAR DESPUES DE QUE TERMINE EL VALIDADOR, QUE hayan cambiano los nombres del WgaTray.exe y Wgalogon.dll')
	$I=0
	while (not FileExists (@WindowsDir &'\SYSTEM32\WgaLogon.dll') AND not FileExists (@WindowsDir &'\SYSTEM32\WgaTray.exe')) OR $I<6
		Sleep(1000)
		$I=$I+1
	WEnd

	If FileExists (@WindowsDir &'\SYSTEM32\WgaLogon.dll') Then
		while FileExists (@WindowsDir &'\SYSTEM32\WgaLogon.dll')
			FileDelete(@WindowsDir &'\SYSTEM32\WgaLogon.exe')
			FileMove (@WindowsDir &'\SYSTEM32\WgaLogon.dll',@WindowsDir &'\SYSTEM32\WgaLogon.exe')
			SLEEP(500)
		WEnd
	EndIf
	If FileExists (@WindowsDir &'\SYSTEM32\WgaTray.exe') Then
		while FileExists (@WindowsDir &'\SYSTEM32\WgaTray.exe')
			FileDelete(@WindowsDir &'\SYSTEM32\WgaTray.dll')
			FileMove (@WindowsDir &'\SYSTEM32\WgaTray.exe',@WindowsDir &'\SYSTEM32\WgaTray.dll')
			SLEEP(500)
		WEnd
	EndIf

	while ProcessExists ('Wgatray.exe')
		ProcessClose ('Wgatray.exe')
	WEnd

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Validador XP"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Validador XP"&@CRLF)
EndIf


