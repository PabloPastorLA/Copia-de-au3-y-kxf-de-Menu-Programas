	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Nero 7',160,80,0,110)




; check inicio final
;~ RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Ahead\Installation\Families\Nero 7\Info','Serial7_1192857362','REG_SZ','4C81-E085-09M3-0000-KK33-CCXE-4K56')

If FileExists("Nero-7.11.10.0c_all_update\SetupX.exe") and @OSArch = 'x86' AND not FileExists (@ProgramFilesDir & "\Nero\Nero 7\Nero StartSmart\NeroStartSmart.exe") AND not FileExists (@ProgramFilesDir & " (x86)\Nero\Nero 7\Nero StartSmart\NeroStartSmart.exe") Then

	If @OSArch = 'X86' Then RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Ahead\Installation\Families\Nero 7\Info','Serial7_1192857362','REG_SZ','4C81-E085-09M3-0000-KK33-CCXE-4K56')
	If @OSArch = 'X64' Then RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Ahead\Installation\Families\Nero 7\Info','Serial7_1192857362','REG_SZ','4C81-E085-09M3-0000-KK33-CCXE-4K56')
	ShellExecuteWait("Nero-7.11.10.0c_all_update\SetupX.exe",' /quiet /norestart')
	RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','NeroFilterCheck')
	ShellExecuteWait('regsvr32',' /u /s \"%commonprogramfiles%\\Ahead\\Lib\\MediaLibraryNSE.dll')
;MsgBox(0,'','nero 7 11111111111')
	If FileExists (@ProgramFilesDir & '\Nero\Nero 7\Nero StartSmart\NeroStartSmart.exe') Then ShellExecute(@ProgramFilesDir & '\Nero\Nero 7\Nero StartSmart\NeroStartSmart.exe')
	If FileExists (@ProgramFilesDir & ' (x86)\Nero\Nero 7\Nero StartSmart\NeroStartSmart.exe') Then ShellExecute(@ProgramFilesDir & ' (x86)\Nero\Nero 7\Nero StartSmart\NeroStartSmart.exe')
;MsgBox(0,'','nero 7 22222222222')
	ProcessWait('NeroStartSmart.exe')
	WinWait('Bienvenido a Nero','El objeto de este contrato')
	WinActivate('Bienvenido a Nero','El objeto de este contrato')
	WinWaitActive('Bienvenido a Nero','El objeto de este contrato')
	while WinExists('Bienvenido a Nero','El objeto de este contrato') and ControlCommand(WinGetHandle('Bienvenido a Nero','El objeto de este contrato'),'Acepto los términos de la condición de licencia','Button6',"IsChecked", "") = 0
		ControlCommand(WinGetHandle('Bienvenido a Nero','El objeto de este contrato'),'Acepto los términos de la condición de licencia','Button6',"Check", "")
	WEnd
;MsgBox(0,'','nero 7 3333333333333')
	while WinExists('Bienvenido a Nero','El objeto de este contrato') and ControlCommand(WinGetHandle('Bienvenido a Nero','El objeto de este contrato'),'Acepto los términos de la condición de licencia','Button6',"IsChecked", "") = 1
		ControlCommand(WinGetHandle('Bienvenido a Nero','El objeto de este contrato'),'&Aceptar','Button3',"Check", "")
	WEnd
;MsgBox(0,'','nero 7 444444444444')

	WinWaitClose('Bienvenido a Nero','El objeto de este contrato')
	while ProcessExists('NeroStartSmart.exe')
		ProcessClose('NeroStartSmart.exe')
	WEnd
;MsgBox(0,'','nero 7 555555555555')

;	------------------		X86		-----------------------------------------------------------
	while FileExists(@ProgramFilesDir & "\Archivos comunes\Ahead\Lib\NeroCheck.exe")
		FileDelete(@ProgramFilesDir & "\Archivos comunes\Ahead\Lib\NeroCheck.exe")
	WEnd
	while FileExists(@ProgramFilesDir & "\Archivos comunes\Ahead\Lib\NeroPatentActivation.exe")
		FileDelete(@ProgramFilesDir & "\Archivos comunes\Ahead\Lib\NeroPatentActivation.exe")
	WEnd
;	------------------		X86		-----------------------------------------------------------
;MsgBox(0,'','nero 7 6666666666')

;	------------------		X64		-----------------------------------------------------------
	while FileExists(@ProgramFilesDir & " (x86)\Archivos comunes\Ahead\Lib\NeroCheck.exe")
		FileDelete(@ProgramFilesDir & " (x86)\Archivos comunes\Ahead\Lib\NeroCheck.exe")
	WEnd
	while FileExists(@ProgramFilesDir & " (x86)\Archivos comunes\Ahead\Lib\NeroPatentActivation.exe")
		FileDelete(@ProgramFilesDir & " (x86)\Archivos comunes\Ahead\Lib\NeroPatentActivation.exe")
	WEnd
;	------------------		X64		-----------------------------------------------------------

;MsgBox(0,'','nero 7 777777777777')


;	------------------		X86		-----------------------------------------------------------
	If @OSArch = 'X86' Then
		RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Ahead\Installation\Settings','AutomaticUpdate','REG_DWORD',0)
		RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','NvCplDaemon')
		RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','NvMediaCenter')
		RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NMIndexingService','Start','REG_DWORD',4)
		RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','BgMonitor_{79662E04-7C6C-4d9f-84C7-88D8A56B10AA}')
	EndIf
;	------------------		X86		-----------------------------------------------------------
;	------------------		X64		-----------------------------------------------------------
	If @OSArch = 'X64' Then
		RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Ahead\Installation\Settings','AutomaticUpdate','REG_DWORD',0)
		RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','NvCplDaemon')
		RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','NvMediaCenter')
		RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NMIndexingService','Start','REG_DWORD',4)
		RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','BgMonitor_{79662E04-7C6C-4d9f-84C7-88D8A56B10AA}')
	EndIf
;	------------------		X64		-----------------------------------------------------------


;MsgBox(0,'','nero 7 88888888888')



	ShellExecuteWait('Cmd.exe',' /c regsvr32 /u /s "'&@CommonFilesDir&'\Ahead\Lib\NeroSearch.dll" && regsvr32 /u /s "'&@CommonFilesDir&'\Ahead\Lib\NeroSearchBar.dll" && regsvr32 /u /s "'&@CommonFilesDir&'\Ahead\Lib\NeroSearchTray.dll"')
;~ 	WinActivate('Bienvenido a Nero','El objeto de este contrato')
;~ 	WinWaitActive('Bienvenido a Nero','El objeto de este contrato')
	ProcessClose('NMBgMonitor.exe')
	ProcessClose('NMIndexStoreSvr.exe')

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Nero 7"&@CRLF)
else
	if @OSArch = 'x86' then FileWrite(@DesktopDir & "\Mal Instalado.txt","Nero 7"&@CRLF)
EndIf

