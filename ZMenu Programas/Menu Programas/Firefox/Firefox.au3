if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Firefox',160,80,0,110)






$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


;IF FileGetVersion(@ProgramFilesDir & "\Mozilla Firefox\firefox.exe")>'97.0.0.8068' then
;~ MsgBox(0,'',FileGetVersion(@ProgramFilesDir & "\Mozilla Firefox\firefox.exe"))




If FileExists("Firefox Setup 41.0.2.exe") AND FileGetVersion(@ProgramFilesDir & "\Mozilla Firefox\firefox.exe") < '97.0.0.8068' AND FileGetVersion(@ProgramFilesDir & " (x86)\Mozilla Firefox\firefox.exe") < '97.0.0.8068' Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Firefox"&@CRLF)
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Firefox',160,80,0,110)

	if @OSVersion='WIN_XP' then
		ShellExecuteWait('Firefox Setup 41.0.2.exe',' -ms')
		agregarextension('asd')
	ElseIf @OSArch= 'X86' and (@OSVersion='WIN_7' or @OSVersion='WIN_8' or @OSVersion='WIN_81') Then
		ShellExecuteWait('Firefox Setup 115.18.0esr x86.exe',' -ms')
		;MsgBox(0,'','termine setup nuevo firefox x86')
	ElseIf @OSArch<>'X86' and (@OSVersion='WIN_7' or @OSVersion='WIN_8' or @OSVersion='WIN_81') Then
		ShellExecuteWait('Firefox Setup 115.18.0esr x64.exe',' -ms')
		;MsgBox(0,'','termine setup nuevo firefox x64')
	ElseIf @OSArch= 'X86' and (@OSVersion='WIN_10') Then
		ShellExecuteWait('Firefox Setup 128.5.1esr x86.exe',' -ms')
		;MsgBox(0,'','termine setup nuevo firefox x86')
	ElseIf @OSArch<>'X86' and (@OSVersion='WIN_10') Then
		ShellExecuteWait('Firefox Setup 128.5.1esr x64.exe',' -ms')
		;MsgBox(0,'','termine setup nuevo firefox x64')

	EndIf


	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MozillaMaintenance", "Start", "REG_DWORD", 4)

	;mozillamaintenanceservice()


;		MsgBox(0,'','aora termine de quitar mozilla maintenance service')


DirRemove(@AppDataDir&'\Mozilla\Firefox\Profile',1)
global	$sFileName = ''
global	$sFileName2 = ''

	ejecutarfirefox()
	ProcessWait('firefox.exe')
	Sleep(5000)
	ProcessClose('firefox.exe')
	Sleep(1000)

	ejecutarfirefox()
	esperaraqueexistaprofile()
	esperaraqueexistaconfig()
	configurarprefs()

;MsgBox(0,'','firefox. hasta aca instale ok. ahora sigo con extensiones. en windows 10 x64 instalacion de cero funciona ok')

	$ext1='ublock_origin-1.61.2.xpi'
	$ext2='fastforwardteam-0.2383.xpi'

	FileCopy($ext1,@DesktopDir&'\'&$ext1)
	FileCopy($ext2,@DesktopDir&'\'&$ext2)
	FileCopy('FirefExtABRIR.au3',@DesktopDir&'\FirefExtABRIR.au3')

	RegWrite('HKLM\Software\Mozilla\Firefox\Crash Reporter','SubmitCrashReport','REG_DWORD',0)

;	If @OSArch = 'X86' Then ShellExecuteWait('AutoIt3.exe', 'FirefExtens.au3','')
;	If @OSArch = 'X64' Then ShellExecuteWait('AutoIt3_x64.exe', 'FirefExtens.au3','')

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Firefox"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Firefox"&@CRLF)
EndIf


func mozillamaintenanceservice()
	if FileExists (@ProgramFilesDir & "\Mozilla Maintenance Service\Uninstall.exe") Then
		ShellExecuteWait (@ProgramFilesDir & "\Mozilla Maintenance Service\Uninstall.exe",' /S')
	Elseif FileExists (@ProgramFilesDir & " (x86)\Mozilla Maintenance Service\Uninstall.exe") Then
		ShellExecuteWait (@ProgramFilesDir & " (x86)\Mozilla Maintenance Service\Uninstall.exe",' /S')
	Else
		FileWrite(@DesktopDir & "\Mal Instalado.txt","Firefox - Mozilla Maintenance Service no desinstalado"&@CRLF)
	EndIf
EndFunc

func ejecutarfirefox()
	if FileExists (@ProgramFilesDir & "\Mozilla Firefox\firefox.exe") Then
		ShellExecute(@ProgramFilesDir & "\Mozilla Firefox\firefox.exe")
	Elseif FileExists (@ProgramFilesDir & " (x86)\Mozilla Firefox\firefox.exe") Then
		ShellExecute(@ProgramFilesDir & " (x86)\Mozilla Firefox\firefox.exe")
	Else
		MsgBox(0,'','No encontre ejecutable de firefox')
	EndIF
EndFunc


func agregarextension($ext)

	Do
		ProcessClose('Firefox.exe')
	until not ProcessExists('Firefox.exe')
	ShellExecute('Firefox','""')


EndFunc



Func esperaraqueexistaprofile()
	While $sFileName='' or $sFileName2=''
;		FileFindNextFile(
		$hSearch = FileFindFirstFile(@AppDataDir&'\Mozilla\Firefox\Profiles\*')
		$sFileName = FileFindNextFile($hSearch)
		$sFileName2 = FileFindNextFile($hSearch)
		Sleep(500)
	WEnd
;~ 	MsgBox(0,'',$sFileName)
;~ 	MsgBox(0,'',$sFileName2)
	FileClose($hSearch)
EndFunc

Func esperaraqueexistaconfig()
	while Not FileExists(@AppDataDir&'\Mozilla\Firefox\Profiles\'&$sFileName&'\prefs.js') and Not FileExists(@AppDataDir&'\Mozilla\Firefox\Profiles\'&$sFileName2&'\prefs.js')
		if WinExists('Asistente de importación') Then WinClose('Asistente de importación')
		Sleep(500)
	WEnd
;~ 	MsgBox(0,'','00')
	$exit=0
	While Not ProcessExists('firefox.exe') And $exit<5
		$exit=$exit+1
		Sleep(1000)
	WEnd
;~ 		MsgBox(0,'','22')

	while ProcessExists('firefox.exe')
		ProcessClose('firefox.exe')
	WEnd
EndFunc

Func configurarprefs()
;	MsgBox(0,'','config')
	$archivo=''
	if FileExists(@AppDataDir&'\Mozilla\Firefox\Profiles\'&$sFileName&'\prefs.js') then $archivo=@AppDataDir&'\Mozilla\Firefox\Profiles\'&$sFileName&'\prefs.js'
	if FileExists(@AppDataDir&'\Mozilla\Firefox\Profiles\'&$sFileName2&'\prefs.js') then $archivo=@AppDataDir&'\Mozilla\Firefox\Profiles\'&$sFileName2&'\prefs.js'
	if $archivo<>'' Then
		FileWriteLine($archivo,'user_pref("app.update.auto", false);')
		FileWriteLine($archivo,'user_pref("app.update.enabled", false);')
		FileWriteLine($archivo,'user_pref("browser.search.update", false);')
		FileWriteLine($archivo,'user_pref("browser.shell.checkDefaultBrowser", false);')
		FileWriteLine($archivo,'user_pref("browser.startup.homepage_override.mstone", "41.0.2");')
		FileClose($archivo)
	else
		MsgBox(0,'','Falla $archivo en firefox. Cerrando')
		Exit
	EndIf

EndFunc
