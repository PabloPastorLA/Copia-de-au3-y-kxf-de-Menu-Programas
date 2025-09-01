;MsgBox(0,'','Ver error de memoria. falta un reinicio'&@CRLF&'probar abrir al final del au3 de instalar')




ShellExecute('test.docx')
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Vent Off 2010' & @crlf & '',160,80,0,110)
Do
	Sleep(300)
Until WinExists('test - Microsoft Word') or WinExists('test - Microsoft Word uso no comercial')
;MsgBox(0,'','espera')
$espera=0
Do
	$espera=$espera+1
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Vent Off 2010' & @crlf & $espera&'/120 o menos',160,80,0,110)
	Sleep(1000)
until $espera=120 or WinExists ('Microsoft Office Professional Plus 2010')

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Vent Off 2010' & @crlf & 'Esperando',160,80,0,110)
WinWaitClose('Microsoft Office Professional Plus 2010')

do
	sleep(300)
until WinExists('test - Microsoft Word') or WinExists('test - Microsoft Word uso no comercial')

Sleep(5000)

Do
	WinClose('test - Microsoft Word uso no comercial')
	WinClose('test - Microsoft Word')
Until not WinExists('test - Microsoft Word') and not WinExists('test - Microsoft Word uso no comercial')

ProcessWaitClose('word.exe')





;----------			VENTANAS .doDE ERROR



					 ;ventanas:
					 ;1	WinExists('Microsoft Word','No se puede registrar este documento')
					 ;2	WinExists('Microsoft Word','Memoria o espacio en disco insuficiente')
					 ;3	WinExists("[TITLE:Microsoft Office 2010; CLASS:NUIDialog", "")
					 ;	laa de arriba es la del mouse
;~ 					 $exit=0
;~ 					 while ProcessExists('winword.exe') and $exit<7
;~ 						 sleep(1000)
;~ 						 $exit = $exit + 1

;~ 						 if $exit = 3 or $exit = 9 or $exit = 14 then MsgBox (0,'','Depurando, estoy en el while, cuando complete todas las ventanas en el codigo borro esto')
;~ 						 if WinExists('Microsoft Word','No se puede registrar este documento') then
;~ 							 MsgBox (0,'','error 1, completar codigo')
;~ 							 ControlClick('Microsoft Word','Memoria o espacio en disco insuficiente','Button1')
;~ 							 $exit=0
;~ 						 EndIf
;~ 						 if WinExists('Microsoft Word','Memoria o espacio en disco insuficiente') then
;~ 							 ;MsgBox (0,'','error 2, completar codigo')
;~ 							 ControlClick('Microsoft Word','Memoria o espacio en disco insuficiente','Button1')
;~ 							 $exit=0
;~ 						  EndIf
;~ 						 if WinExists("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]") then
;~ 					 ;~ 		MsgBox (0,'','error 3, completar codigo')
;~ 							 $exit=0
;~ 							 WinActivate("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 WinWaitActive("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 $positionArray = WinGetPos ("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 WinActivate("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 WinWaitActive("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 MouseMove($positionArray[0] + 75 , $positionArray[1] + 280,0)
;~ 							 WinActivate("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 WinWaitActive("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 MouseClick('left')

;~ 							 WinActivate("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 WinWaitActive("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 $positionArray = WinGetPos ("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 WinActivate("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 WinWaitActive("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 MouseMove($positionArray[0] + 700 , $positionArray[1] + 390,0)
;~ 							 WinActivate("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 WinWaitActive("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 MouseClick('left')

;~ 							  $ventanita=0
;~ 							  while WinExists("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]") And $ventanita<6
;~ 								 Sleep (1000)
;~ 								 $ventanita=$ventanita+1
;~ 							  WEnd

;~ 						  EndIf
;ventana 4
;~ 						 if WinExists('Alerta de seguridad de Windows','Firewall de Windows bloqueó') then
;~ 							 MsgBox (0,'','error 4, completar codigo')
;~ 							 $exit=0
;~ 						  EndIf
;ventana 5
;~ 						 if WinExists('Asistente para la activación de Microsoft Office') then
;~ 							 MsgBox (0,'','error 5, completar codigo')
;~ 						   WinActivate('Asistente para la activación de Microsoft Office')
;~ 						   WinWaitActive('Asistente para la activación de Microsoft Office')
;~ 						   Send('{altdown}{c}{altup}')
;~ 							 $exit=0
;~ 						  EndIf


;~ 						 SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Off 2010',160,80,0,110)
;~ 						 SplashTextOn('Espera','Autoit corriendo ' & @crlf & '$EXIT<7 '& $exit,160,80,0,110)

;~ 					 wend
;~ 					 MsgBox(0,'','sali del while, aca sigue el codigo como iba antes')




;--------------------------------------------------------------------------




;~ 	While WinExists('Documento1 - Microsoft Word')
;~ 		WinClose('Documento1 - Microsoft Word')
;~ 	 WEnd
;~ 	 While WinExists('Documento1 - Microsoft Word (Error de activación de productos)')
;~ 		WinClose('Documento1 - Microsoft Word (Error de activación de productos)')
;~ 	WEnd




;~ 	if FileExists(@ProgramFilesDir & "\Microsoft Office\Office14\EXCEL.EXE") Then
;~ 		ShellExecute(@ProgramFilesDir & "\Microsoft Office\Office14\EXCEL.EXE")
;~ 	Else
;~ 		while 1
;~ 			MsgBox(0,'','No encuentro ejecutable excel.exe')
;~ 		WEnd
;~ 	EndIf
;~ 		WinWait('Microsoft Excel - Libro1')
;~ 		sleep(2000)
;~ 		$salir=0
;~ 		While ProcessExists ('excel.exe') And $salir<7
;~ 		   $salir = $salir + 1
;~ 		   sleep(1000)
;~ 		   	SplashTextOn('Espera','Autoit corriendo ' & @crlf & '$salir<7 '& $salir,160,80,0,110)
;~ 			if WinExists('Microsoft Excel','Recursos insuficientes para presentar todo.') Then
;~ 			   ControlClick('Microsoft Excel','Recursos insuficientes para presentar todo.','Button1')
;~ 			   $salir=0
;~ 			EndIf
;~ 			if WinExists('Asistente para la activación de Microsoft Office') then
;~ 				  WinActivate('Asistente para la activación de Microsoft Office')
;~ 				  WinWaitActive('Asistente para la activación de Microsoft Office')
;~ 				  Send('{altdown}{c}{altup}')
;~ 				  $salir=0
;~ 			EndIf

;~ 		 WEnd

;~ 		While WinExists ('Microsoft Excel - Libro1')
;~ 			WinClose('Microsoft Excel - Libro1')
;~ 		WEnd
;~ 		While WinExists ('Microsoft Excel (Error de activación de productos) - Libro1')
;~ 			WinClose('Microsoft Excel (Error de activación de productos) - Libro1')
;~ 		WEnd




;--------------------------------------------
;~ 	If $ventprog = 1 Then abrircarpetaoffice2k10()

