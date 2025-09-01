#RequireAdmin
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Sist. Inicio 1',160,80,0,110)


FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	SistemaInicio"&@CRLF)

;desactivar WINDOWS DEFENDER
if @OSVersion='WIN_10' then ShellExecuteWait('WinDefDesact.exe','',menuprogramas()&'\Windows Defender Control')

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Sist. Inicio 2',160,80,0,110)

ShellExecuteWait('CMD',' /C net accounts /maxpwage:unlimited')

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Sist. Inicio 3',160,80,0,110)

;crear en escritorio accesos directos usuario equipo y papelera
;Papelera
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel",'{645FF040-5081-101B-9F08-00AA002F954E}','REG_DWORD',00000000)
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu",'{645FF040-5081-101B-9F08-00AA002F954E}','REG_DWORD',00000000)
;Equipo
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel",'{20D04FE0-3AEA-1069-A2D8-08002B30309D}','REG_DWORD',00000000)
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu",'{20D04FE0-3AEA-1069-A2D8-08002B30309D}','REG_DWORD',00000000)
;Usuario
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel",'{59031a47-3f72-44a7-89c5-5595fe6b30ee}','REG_DWORD',00000000)
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu",'{59031a47-3f72-44a7-89c5-5595fe6b30ee}','REG_DWORD',00000000)

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Sist. Inicio 4',160,80,0,110)


;if @OSVersion = "WIN_8" or @OSVersion = "WIN_81"  Then
; MsgBox(0,'','sistemainicio falta codifo w8, no8.1')
;EndIf

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Sist. Inicio 5',160,80,0,110)


if @OSVersion = "WIN_XP" Then
	;No mostrar docs recientes
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced","Start_ShowRecentDocs","REG_DWORD",0)

	;desactivar restaurar sistema
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore","DisableSR","REG_DWORD",1)

	;desactivar pestañas agrupadas
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced","TaskbarGlomming","REG_DWORD",0)

	;Acelerar menu inicio
	RegWrite("HKEY_CURRENT_USER\Control Panel\Desktop","MenuShowDelay","REG_SZ",100)

	;Agregar CMD al menu contextual
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\shell\doshere","","REG_SZ","Command Prompt")
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\shell\doshere\command","","REG_SZ","cmd.exe /k cd %1")

	;desactivar Globos Windows update firewall antiv
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center','UpdatesDisableNotify','REG_DWORD',1)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center','AntiVirusDisableNotify','REG_DWORD',1)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center','FirewallDisableNotify','REG_DWORD',1)
	;desactivar serv red WMP
	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WMPNetworkSvc","Start","REG_DWORD",4)

	;desactivar pastallas azules c archprog windows y panel
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\WebView\BarricadedFolders","shell:ControlPanelFolder","REG_DWORD",0)
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\WebView\BarricadedFolders","shell:ProgramFiles","REG_DWORD",0)
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\WebView\BarricadedFolders","shell:SystemDriveRootFolder","REG_DWORD",0)
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\WebView\BarricadedFolders","shell:Windows","REG_DWORD",0)
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\WebView\BarricadedFolders","shell:System","REG_DWORD",0)

	;msconfig pide reiniciar
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Shared Tools\MsConfig',"NoRebootUI","REG_DWORD",1)
	RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Shared Tools\MsConfig',"NoRebootUI","REG_DWORD",1)
EndIf




if @OSVersion = "WIN_7" Then


	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Sist. Inicio 6',160,80,0,110)

	;desactivar banderita al costado del reloj
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer','HideSCAHealth','REG_DWORD',1)

	;desactivar restaurar sistema
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore","EnableLUA","REG_DWORD",0)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows NT\SystemRestore','DisableSR','REG_DWORD',1)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore','DisableSR','REG_DWORD',1)

	;desactivar UAC W 7
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System","DisableSR","REG_DWORD",1)

	;reporte errores w7
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\Windows Error Reporting',"Disabled","REG_DWORD",1)
	RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Windows Error Reporting',"Disabled","REG_DWORD",1)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\ScheduledDiagnostics',"EnabledExecution","REG_DWORD",0)

	;Configurar windows update
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU","NoAutoUpdate","REG_DWORD",1)

EndIf





if @OSVersion = "WIN_8" or @OSVersion = "WIN_81" Then


	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Sist. Inicio 6',160,80,0,110)

	;desactivar banderita al costado del reloj
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer','HideSCAHealth','REG_DWORD',1)

	;desactivar restaurar sistema
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore","EnableLUA","REG_DWORD",0)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows NT\SystemRestore','DisableSR','REG_DWORD',1)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore','DisableSR','REG_DWORD',1)

	;desactivar UAC W 8
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System","DisableSR","REG_DWORD",1)

	;reporte errores w8
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\Windows Error Reporting',"Disabled","REG_DWORD",1)
	RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Windows Error Reporting',"Disabled","REG_DWORD",1)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\ScheduledDiagnostics',"EnabledExecution","REG_DWORD",0)

	;Configurar windows update
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU","NoAutoUpdate","REG_DWORD",1)

EndIf

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Sist. Inicio 7',160,80,0,110)

if @OSVersion='WIN_8' or @OSVersion='WIN_81' or @OSVersion='WIN_10' Then ShellExecuteWait('MSCONFIG for Windows 10 and 8.exe','/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-','MsConfig W8-W10')

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Sist. Inicio 8',160,80,0,110)




if @OSVersion = "WIN_81" Then

	;desactivar restaurar sistema
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore","DisableSR","REG_DWORD",1)

	;Configurar windows update
	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\wuauserv","Start","REG_DWORD",4)
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU","NoAutoUpdate",'REG_DWORD',1)
EndIf

if @OSVersion = "WIN_10" Then

	;desactivar restaurar sistema
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore","DisableSR","REG_DWORD",1)

	;Configurar windows update
	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\wuauserv","Start","REG_DWORD",4)
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU","NoAutoUpdate",'REG_DWORD',1)

;~ 	;desactivar UAC W 7
;~ 	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System","DisableSR","REG_DWORD",1)

;~ 	;reporte errores w7
;~ 	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\Windows Error Reporting',"Disabled","REG_DWORD",1)
;~ 	RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Windows Error Reporting',"Disabled","REG_DWORD",1)
;~ 	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\ScheduledDiagnostics',"EnabledExecution","REG_DWORD",0)

	;Desactivar Cortana
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search','AllowCortana','REG_DWORD',0)
;~ 	if not FileExists(@WindowsDir&'\SystemApps\Microsoft.Windows.Cortana_cw5n1h2txyewy') Then MsgBox(0,'','error no encontre carpeta de cortana')
;~ 	while FileExists(@WindowsDir&'\SystemApps\Microsoft.Windows.Cortana_cw5n1h2txyewy')
;~ 		ProcessClose('SearchUI.exe')
;~ 		DirMove(@WindowsDir&'\SystemApps\Microsoft.Windows.Cortana_cw5n1h2txyewy',@WindowsDir&'\SystemApps\Microsoft.Windows.Cortana_cw5n1h2txyewy.bak',1)
;~ 	WEnd

	;Desactivar Windows Defender
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender','DisableAntiSpyware','REG_DWORD',1)

	;desinstalar OneDrive
	ShellExecuteWait('taskkill',' /f /im OneDrive.exe')
	if FileExists(@WindowsDir&'\System32\OneDriveSetup.exe') Then ShellExecuteWait('OneDriveSetup.exe',' /uninstall',@WindowsDir&'\System32')
	if FileExists(@WindowsDir&'\SysWOW64\OneDriveSetup.exe') Then ShellExecuteWait('OneDriveSetup.exe',' /uninstall',@WindowsDir&'\SysWOW64')

	if RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion','ProductName') = 'Windows 10 Enterprise LTSC 2021 Evaluation' Then
		If @OSArch = 'X86' Then ShellExecuteWait('AutoIt3.exe', 'LTSC2021EvalAFull.au3', 'LTSC 2021 Evaluation a Full')
		If @OSArch = 'X64' Then ShellExecuteWait('AutoIt3_x64.exe', 'LTSC2021EvalAFull.au3', 'LTSC 2021 Evaluation a Full')
	EndIf


EndIf

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Sist. Inicio 9',160,80,0,110)

;	Ventana MSCONFIG
RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Shared Tools\MsConfig','NoRebootUI','REG_DWORD',1)



;desac winupdate
desacwinupdate()

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Sist. Inicio 10',160,80,0,110)

;reiniciar explorer
ProcessClose('explorer.exe')
ProcessWaitClose('explorer.exe')
run('explorer.exe')

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Sist. Inicio 11',160,80,0,110)

while not WinExists('Mis documentos') and not WinExists('Bibliotecas') and not WinExists('Explorador de archivos') and not WinExists('Este equipo')
	sleep (500)
WEnd

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Sist. Inicio 12',160,80,0,110)

if WinExists('Mis documentos') then WinClose('Mis documentos')

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Sist. Inicio 13',160,80,0,110)

if WinExists('Bibliotecas') then WinClose('Bibliotecas')

if WinExists('Explorador de archivos') then WinClose('Explorador de archivos')

if WinExists('Este equipo') then WinClose('Este equipo')


SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Sist. Inicio 14',160,80,0,110)


FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	SistemaInicio"&@CRLF)



func windowsupdate7()
	Opt('SendKeyDelay', 200)
		while WinExists('Windows Update') Or WinExists('Cambiar configuración')
			WinClose('Cambiar configuración')
			WinClose('Windows Update')
		WEnd
		ShellExecute('control',' wuaucpl.cpl')
		WinWait('Windows Update')
		Send('{SHIFTDOWN}{tab}{tab}{tab}{tab}{tab}{SHIFTUP}{space}')
	$i=0
	While Not WinExists('Cambiar configuración') And $i<3
		$i=$i+1
		Sleep(1000)
	WEnd
	If Not WinExists('Cambiar configuración') Then Send('{SHIFTDOWN}{tab}{tab}{tab}{tab}{tab}{SHIFTUP}{space}')
	Send('{tab}{tab}{tab}{tab}{tab}{right}{right}{right}{right}{right}')
	While WinExists('Cambiar configuración')
		ControlClick('Cambiar configuración','Cambiar configuración','Button5')
	WEnd
	While WinExists('Windows Update')
		WinClose('Windows Update')
	WEnd
	Opt('SendKeyDelay', 5)


EndFunc

func desacwinupdate()
	if @OSArch='X86' then ShellExecute('WinUpdatesDisabler_x86.exe','','win-updates-disabler-portable')
	if @OSArch<>'X86' then ShellExecute('WinUpdatesDisabler_x64.exe','','win-updates-disabler-portable')

	WinWait('Win Updates Disabler v1.4')
	do
		if ControlCommand('Win Updates Disabler v1.4','','TCheckBox4','IsChecked','')=0 then ControlCommand('Win Updates Disabler v1.4','','TCheckBox4','Check','')
		if ControlCommand('Win Updates Disabler v1.4','','TCheckBox3','IsChecked','')=1 then ControlCommand('Win Updates Disabler v1.4','','TCheckBox3','UnCheck','')
		if ControlCommand('Win Updates Disabler v1.4','','TCheckBox2','IsChecked','')=1 then ControlCommand('Win Updates Disabler v1.4','','TCheckBox2','UnCheck','')
		if ControlCommand('Win Updates Disabler v1.4','','TCheckBox1','IsChecked','')=1 then ControlCommand('Win Updates Disabler v1.4','','TCheckBox1','UnCheck','')

;~ MsgBox(0,'','1')

		if ControlCommand('Win Updates Disabler v1.4','','TCheckBox4','IsChecked','')=1 and ControlCommand('Win Updates Disabler v1.4','','TCheckBox3','IsChecked','')=0 and ControlCommand('Win Updates Disabler v1.4','','TCheckBox2','IsChecked','')=0 and ControlCommand('Win Updates Disabler v1.4','','TCheckBox1','IsChecked','')=0 then ControlClick('Win Updates Disabler v1.4','','TButton2')
		$t=0
		Do
			Sleep(100)
			$t=$t+1
		until $t>=20 or WinExists('Win Updates Disabler')


;~ MsgBox(0,'','2')

		while ControlCommand('Win Updates Disabler','','Button2','IsVisible')=1
			if ControlCommand('Win Updates Disabler','','Button2','IsVisible')=1 and ControlGetText('Win Updates Disabler','','Button2')='&No' then ControlClick('Win Updates Disabler','','Button2')
			if ControlCommand('Win Updates Disabler','','Button1','IsVisible')=1 and ControlGetText('Win Updates Disabler','','Button1')='&No' then ControlClick('Win Updates Disabler','','Button1')
			if ControlCommand('Win Updates Disabler','','Button2','IsVisible')=0 then WinClose('Win Updates Disabler v1.4')
		WEnd
;~ MsgBox(0,'','3')

	Sleep(200)
	Until not WinExists('Win Updates Disabler v1.4')
EndFunc


func menuprogramas()
	$MenuProgramas=@ScriptDir
	Do
	$MenuProgramas=StringTrimRight($MenuProgramas,1)
	until StringRight($MenuProgramas,1)='\'
	$MenuProgramas=StringTrimRight($MenuProgramas,1)
	Return $MenuProgramas
EndFunc
