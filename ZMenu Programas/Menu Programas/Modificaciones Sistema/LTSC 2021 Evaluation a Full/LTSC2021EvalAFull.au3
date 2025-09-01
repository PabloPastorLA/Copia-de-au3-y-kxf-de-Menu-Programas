
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'LTSC 2021'& @crlf & 'Eval -> Full',160,80,0,110)
unrar()
copiar()
ejecutar()

func ejecutar()

	comandos('cscript.exe %windir%\system32\slmgr.vbs /rilc')
	comandos('cscript.exe %windir%\system32\slmgr.vbs /upk >nul 2>&1')
	comandos('cscript.exe %windir%\system32\slmgr.vbs /ckms >nul 2>&1')
	comandos('cscript.exe %windir%\system32\slmgr.vbs /cpky >nul 2>&1')
	comandos('cscript.exe %windir%\system32\slmgr.vbs /ipk M7XTQ-FN8P6-TTKYV-9D4CC-J462D')
	comandos('sc config LicenseManager start= auto & net start LicenseManager')
	comandos('sc config wuauserv start= auto & net start wuauserv')

EndFunc

func comandos($comm)
	ShellExecuteWait('cmd',' /C '&$comm)
EndFunc

Func copiar()
	DirCopy(@ScriptDir&'\skus\EnterpriseS',@SystemDir &'\spp\tokens\skus\EnterpriseS',1)
EndFunc


func unrar()
	DirRemove(@ScriptDir&'\skus',1)
	ShellExecuteWait('UnRAR.exe','x -p123 -y "skus_zentinels pass 123.rar"')
	sleep(500)
;~ 	while not FileExists ('KMSAuto.exe') and not FileExists ('KMSAuto x64.exe')
;~ 		MsgBox(0,'Antivirus activo','Desactive el antivirus y presiones OK para poder extraer KMSAuto Net')
;~ 		sleep(500)
;~ 		unrar()
;~ 	WEnd
EndFunc





