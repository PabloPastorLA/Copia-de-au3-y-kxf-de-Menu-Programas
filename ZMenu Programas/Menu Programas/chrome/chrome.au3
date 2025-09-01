if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Chrome',160,80,0,110)

global $debug=1


;MsgBox(0,'','chrome falta hacer cerr.bat y agregarlo a menu en la parte progs')

If FileExists("ChromeStandaloneSetup.exe") AND FileExists("ChromeStandaloneSetup64.exe") AND not FileExists (@ProgramFilesDir & "\Google\Chrome\Application\chrome.exe") AND not FileExists (@ProgramFilesDir & " (x86)\Google\Chrome\Application\chrome.exe") Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Chrome"&@CRLF)
	if @OSVersion <> 'WIN_XP' Then
		if @OSArch='x86' Then
			$chromeversion='ChromeStandaloneSetup.exe'
		Else
			$chromeversion='ChromeStandaloneSetup64.exe'
		EndIf
	Else
;~ 		MsgBox(0,'','Error en chrome xp. falta codigo')
		$chromeversion='Google_Chrome_(32bit)_v49.0.2623.112 XP.exe'
	EndIf

	ShellExecuteWait($chromeversion,' /silent /install')
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Esp. Chrome',160,80,0,110)


;MsgBox(0,'','termine de shelleecute')
;	ProcessWait($chromeversion)
;	While ProcessExists($chromeversion) And Not WinExists('Programa de instalación de Google Chrome','Se ha completado la instalación.')
;~ 		Sleep(1000)
;	WEnd

;~ 	If WinExists('Programa de instalación de Google Chrome','Se ha completado la instalación.') Then
;~ 		while WinExists('Programa de instalación de Google Chrome','Se ha completado la instalación.')
;~ 			ControlClick('Programa de instalación de Google Chrome','Cerrar','Button2')
;			Sleep(500)
;~ 		WEnd
;~ 	EndIf

	ProcessWaitClose($chromeversion)
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Conf. Chrome',160,80,0,110)


	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\gupdatem", "Start", "REG_DWORD", 4)
	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\gupdate", "Start", "REG_DWORD", 4)
;~ 	while ProcessExists('GoogleUpdate.exe')
;~ 		ProcessClose('GoogleUpdate.exe')
;~ 	WEnd

;~ 	$i=0
;~ 	while $i<6
;~ 		if ProcessExists("chrome.exe") then
;~ 			ProcessClose("chrome.exe")
;~ 		EndIf
;~ 		sleep(1000)
;~ 		$i= 1 + $i
;~ 	WEnd

;MsgBox(0,'','0')

;~ 	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\gupdatem", "Start", "REG_DWORD", 4)
;~ 	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\gupdate", "Start", "REG_DWORD", 4)

	ShellExecuteWait('chrome',' --make-default-browser')
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Conf 2. Chrome',160,80,0,110)
;~ MsgBox(0,'','hasta aca ok')


	ShellExecute('chrome')
	Sleep(5000)
		esperarventana()
;~ 		MsgBox(0,'','hasta aca ok22')

	Do
;~ 		MsgBox(0,'','hasta aca ok333')

		cerrarventana()
	until not ProcessExists('chrome.exe')








;~ MsgBox(0,'chrome','w10 ltsc x64 TODO OK'&@CRLF&'7x86 lite hasta aca ok')












;~ 	while ProcessExists("chrome.exe")
;~ 		ProcessClose("chrome.exe")
;~ 	WEnd
;~ 	ProcessWaitClose("chrome.exe")

;	desde aca espero a googleupdate.exe y lo cierro
;~ 	$salida=0
;~ 	while Not ProcessExists('GoogleUpdate.exe') and $salida < 6
;~ 		Sleep(1000)
;~ 		$salida=$salida+1
;~ 	WEnd
;~ 	while ProcessExists('GoogleUpdate.exe')
;~ 		ProcessClose('GoogleUpdate.exe')
;~ 	WEnd
;~ 	$salida=0
;~ 	while Not ProcessExists('GoogleUpdate.exe') and $salida < 3
;~ 		Sleep(1000)
;~ 		$salida=$salida+1
;~ 	WEnd
;~ 	while ProcessExists('GoogleUpdate.exe')
;~ 		ProcessClose('GoogleUpdate.exe')
;~ 	WEnd

;MsgBox(0,'','ahora sigue tarea pog')
	tareaprogramada()
;MsgBox(0,'','ahora sigue dirblock')

	copiarext()
	copiarcerr()
;~ 	DirUblock()
	copiarChromeAct()
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Chrome"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Chrome"&@CRLF)
EndIf


func copiarChromeAct()
	FileCopy('ChromeActualizado\ChromeAct.au3',@DesktopDir)
	FileCopy('ChromeActualizado\ChromeStandaloneSetup64-Act.exe',@DesktopDir)
	FileCopy('ChromeActualizado\ChromeStandaloneSetup-Act.exe',@DesktopDir)
EndFunc

func copiarcerr()
	FileCopy('cerr.bat',@SystemDir)
EndFunc


func DirUblock()
	ShellExecute('chrome.exe',' https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=es')
	esperarventana()
EndFunc

func esperarventana()
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Conf 2. Chrome'& @crlf & 'esperarventana()',160,80,0,110)

	while Not WinExists('chrome.google.com - Google Chrome') and not WinExists('Nueva pestaña - Google Chrome') and not WinExists('Sin título - Google Chrome') and not WinExists('Te damos la bienvenida a Chrome - Google Chrome')
		Sleep(100)
	WEnd
EndFunc


func cerrarventana()
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Conf 2. Chrome'& @crlf & 'cerrarventana()',160,80,0,110)
	while 	  WinExists('chrome.google.com - Google Chrome') or      WinExists('Sin título - Google Chrome') or         WinExists('Nueva pestaña - Google Chrome') or WinExists('Te damos la bienvenida a Chrome - Google Chrome')
		WinClose('chrome.google.com - Google Chrome')
		WinClose('Sin título - Google Chrome')
		WinClose('Nueva pestaña - Google Chrome')
		WinClose('Te damos la bienvenida a Chrome - Google Chrome')
	WEnd
EndFunc


func copiarext()
	If FileExists(@ProgramFilesDir & "\Google\Chrome\Application\chrome.exe") or FileExists(@ProgramFilesDir & " (x86)\Google\Chrome\Application\chrome.exe") Then
		FileCopy ('uBlock-1_14_8.crx',@DesktopDir,9)
		DirCopy('Universal.Bypass.for.Chromium-based.browsers',@DesktopDir&'\Universal.Bypass.for.Chromium-based.browsers',1)
	EndIf
EndFunc

Func tareaprogramada()
	ShellExecuteWait('schtasks.exe',' /End /TN "GoogleUpdateTaskMachineCore"','','',@SW_HIDE )
	ShellExecuteWait('schtasks.exe',' /End /TN "GoogleUpdateTaskMachineUA"','','',@SW_HIDE)
	ShellExecuteWait('schtasks.exe',' /Delete /TN "GoogleUpdateTaskMachineCore" /F','','',@SW_HIDE)
	ShellExecuteWait('schtasks.exe',' /Delete /TN "GoogleUpdateTaskMachineUA" /F','','',@SW_HIDE)
 	while ProcessExists('GoogleUpdate.exe')
 		ProcessClose('GoogleUpdate.exe')
 	WEnd
EndFunc
