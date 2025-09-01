if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Chrome-Act',160,80,0,110)

global $debug=1

If FileExists("ChromeStandaloneSetup64-Act.exe") Then
	if @OSVersion <> 'WIN_XP' Then
		if @OSArch='x86' Then
			$chromeversion='ChromeStandaloneSetup-Act.exe'
		Else
			$chromeversion='ChromeStandaloneSetup64-Act.exe'
		EndIf
	Else
 		MsgBox(0,'','En XP no se actualiza chrome. Cerrando')
		Exit
	EndIf

if ProcessExists('chrome.exe') and 6=MsgBox(4,'Actualizar chrome','Para actualizar chrome este se cerrará. Continuar?') then processclose('chrome.exe')

	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Chrome-Act',160,80,0,110)
	ShellExecuteWait($chromeversion,' /silent /install')

	ProcessWaitClose($chromeversion)

	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Conf. Chrome-Act',160,80,0,110)
	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\gupdatem", "Start", "REG_DWORD", 4)
	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\gupdate", "Start", "REG_DWORD", 4)

	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Conf 2. Chrome-Act',160,80,0,110)
	ShellExecuteWait('chrome',' --make-default-browser')


;~ 	ShellExecute('chrome')
;~ 	Sleep(5000)
;~ 	esperarventana()
;~ 	Do
;~ 		cerrarventana()
;~ 	until not ProcessExists('chrome.exe')


	tareaprogramada()

;~ 	copiarext()
;~ 	copiarcerr()
;	$borrar=0
;	if StringRight(@ScriptDir,8)='\Desktop' Then $borrar=1

	if StringRight(@ScriptDir,8)='\Desktop' and 6=MsgBox(4,'Chrome Actualizado','Terminé de actualizar chrome. Borrar?') Then
		if 6=MsgBox(4,'Chrome Actualizado','Borrar Universal Bypass?') Then DirRemove('Universal.Bypass.for.Chromium-based.browsers',1)
		FileDelete('ChromeStandaloneSetup-Act.exe')
		FileDelete('ChromeStandaloneSetup64-Act.exe')
		FileDelete(@ScriptFullPath)
		FileDelete('uBlock-1_14_8.crx')
	EndIf

	ShellExecute('chrome.exe','chrome-extension://cjpalhdlnbpafiamejdnhcphjbkeiagm/dashboard.html#3p-filters.html')
;	chrome-extension://cjpalhdlnbpafiamejdnhcphjbkeiagm/dashboard.html#3p-filters.html

	SplashTextOn('Espera','Abriendo Chrome',160,80,0,110)
	Sleep(2000)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","ChromeNuevo"&@CRLF)
EndIf


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
