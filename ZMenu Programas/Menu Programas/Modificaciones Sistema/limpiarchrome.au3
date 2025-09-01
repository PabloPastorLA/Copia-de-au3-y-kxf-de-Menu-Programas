	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Limp. Chrome',160,80,0,110)
;~ WinExists ('http://asdasdasd.com/ no está disponible. - Google Chrome'))
$pag="asdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd.com"

ShellExecute("chrome",$pag)

While (Not WinExists ('Sin título - Google Chrome')) or (Not WinExists ('','Chrome Legacy Window'))
	sleep(100)
WEnd


while (WinExists ('Sin título - Google Chrome') or WinExists ('http://'&$pag&'/ no está disponible. - Google Chrome'))
	Sleep (5000)
	If WinExists ('Sin título - Google Chrome') Then
	;~ 	while not WinActive('Sin título - Google Chrome')
		WinActivate('Sin título - Google Chrome')
		WinWaitActive('Sin título - Google Chrome')
	EndIf
	If WinExists ('http://'&$pag&'/ no está disponible. - Google Chrome') Then
		WinActivate('http://'&$pag&'/ no está disponible. - Google Chrome')
		WinWaitActive('http://'&$pag&'/ no está disponible. - Google Chrome')
	EndIf
	$tacho=ClipGet
	ClipPut('chrome://settings/clearBrowserData')
	Send('{ALTdown}{d}{ALTup}{ctrldown}{v}{ctrlup}{enter}')
	ClipPut($tacho)
	sleep(3000)

	For $i=1 to 10 step 1
	If (not WinExists ('Sin título - Google Chrome')) and (not WinExists ('http://'&$pag&'/ no está disponible. - Google Chrome')) Then
;~ 		MsgBox(0,'','')
		Exit
	EndIf
	sleep(2000)
	Next

WEnd

