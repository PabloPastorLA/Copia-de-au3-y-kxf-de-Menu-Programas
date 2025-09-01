SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Conf. ExtChrome',160,80,0,110)

extenchrome()

Func extenchrome()

   $pag="asdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd.com"

   ShellExecute("chrome",$pag)
   While Not WinExists ('Sin título - Google Chrome') and Not WinExists ('http://'&$pag&'/ no está disponible. - Google Chrome')
	   sleep(1000)
   WEnd


   while WinExists ('Sin título - Google Chrome') or WinExists ('http://'&$pag&'/ no está disponible. - Google Chrome')
	  SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Espera 5s',160,80,0,110)
	  Sleep (5000)
	  SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Espera Vent',160,80,0,110)
	   If WinExists ('Sin título - Google Chrome') Then
		   WinActivate('Sin título - Google Chrome')
		   WinWaitActive('Sin título - Google Chrome')
	   EndIf
	   If WinExists ('http://'&$pag&'/ no está disponible. - Google Chrome') Then
		   WinActivate('http://'&$pag&'/ no está disponible. - Google Chrome')
		   WinWaitActive('http://'&$pag&'/ no está disponible. - Google Chrome')
	   EndIf
	   $tacho=ClipGet
	   ClipPut('chrome://extensions/')
	   Send('{ALTdown}{d}{ALTup}{ctrldown}{v}{ctrlup}{enter}')
	   ClipPut($tacho)
	   sleep(3000)

	   For $i=1 to 10 step 1
		 SplashTextOn('Espera','Autoit corriendo ' & @crlf & '10 - '&$i,160,80,0,110)
		   If (not WinExists ('Sin título - Google Chrome')) and (not WinExists ('http://'&$pag&'/ no está disponible. - Google Chrome')) Then
			   sleep(2000)
			   Exit
		   EndIf
		   sleep(2000)
	   Next

	  while ProcessExists('chrome.exe')
		 WinClose ('Sin título - Google Chrome')
		 WinClose ('http://'&$pag&'/ no está disponible. - Google Chrome')
		 Sleep(1000)
		 ProcessClose('chrome.exe')
	  WEnd
   WEnd
   extenchrome()
EndFunc