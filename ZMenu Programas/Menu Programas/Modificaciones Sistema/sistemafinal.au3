	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Sist. Final',160,80,0,110)

;-----------------------------------------------------------------------------
FileCopy('QUE HACER EN PC nuevo.txt',@DesktopDir)

if FileExists(@DesktopDir &"\Configuration.mc") and FileExists(@ProgramFilesDir & "\Google\Chrome\Application\chrome.exe") Then
	ShellExecute("chrome","http://www.ma-config.com/es/deteccionfueradered")
EndIf

;-----------------------
RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','MSConfig')

if @OSVersion='WIN_XP' Then
		;desactivar Globos Windows update firewall antiv
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center','UpdatesDisableNotify','REG_DWORD',1)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center','AntiVirusDisableNotify','REG_DWORD',1)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center','FirewallDisableNotify','REG_DWORD',1)

EndIf


If @OSArch='X86' Then ShellExecuteWait('AutoIt3.exe','iconcache.au3', 'Icon Cache Rebuilder')
If @OSArch='X64' Then ShellExecuteWait('AutoIt3_x64.exe','iconcache.au3', 'Icon Cache Rebuilder')





;desactivar WINDOWS DEFENDER
if @OSVersion='WIN_10' then ShellExecuteWait('WinDefAct.exe','',menuprogramas()&'\Windows Defender Control')





func menuprogramas()
	$MenuProgramas=@ScriptDir
	Do
	$MenuProgramas=StringTrimRight($MenuProgramas,1)
	until StringRight($MenuProgramas,1)='\'
	$MenuProgramas=StringTrimRight($MenuProgramas,1)
	Return $MenuProgramas
EndFunc
