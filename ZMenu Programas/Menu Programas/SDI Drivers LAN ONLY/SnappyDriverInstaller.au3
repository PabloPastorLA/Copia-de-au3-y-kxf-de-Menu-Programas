#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Snappy Drivers',160,80,0,110)

If (FileExists("SDI_R1904.exe") AND @OSArch='x86') or (FileExists("SDI_x64_R1904.exe") AND @OSArch<>'x86') Then

	if @OSArch='x86' then ShellExecute('SDI_R1904.exe',' -autoinstall -norestorepnt -autoclose')
	if @OSArch<>'x86' then ShellExecute('SDI_x64_R1904.exe',' -autoinstall -norestorepnt -autoclose')
;~ 	if @OSArch='x86' then ShellExecuteWait('SDI_R1904.exe',' -autoinstall -norestorepnt')


	While not ProcessExists('SDI_R1904.exe') and not ProcessExists('SDI_x64_R1904.exe')
		Sleep('1000')
	WEnd
	While ProcessExists('SDI_R1904.exe') or ProcessExists('SDI_x64_R1904.exe')
		if WinExists('Alerta de seguridad de Windows','Firewall de Windows') then ControlClick('Alerta de seguridad de Windows','&Permitir acceso','Button6')
		Sleep('300')
	WEnd

	$exit=100
While $exit>0
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Snappy Drivers'& @crlf & 'Terminando en '&$exit,160,80,0,110)
	$exit=$exit-1
	Sleep(100)
	if WinExists('Alerta de seguridad de Windows','Firewall de Windows') then ControlClick('Alerta de seguridad de Windows','&Permitir acceso','Button6')
	if WinExists('Microsoft Windows','Continuar sin analizar') then
		ControlClick('Microsoft Windows','Continuar sin analizar','Button2')
		WinWait('Reproducción automática','Ver más opciones de Reproducción automática')
		WinClose('Reproducción automática','Ver más opciones de Reproducción automática')
	EndIf
	if WinExists('Reproducción automática','Ver más opciones de Reproducción automática') Then WinClose('Reproducción automática','Ver más opciones de Reproducción automática')
	if WinExists('Establecer ubicación de red','Este equipo está conectado a una red') Then WinClose('Establecer ubicación de red','Este equipo está conectado a una red')
WEnd


;~ 	RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "ares")
;~ 	RegDelete("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "ares")
;~ 	RegWrite("HKEY_CURRENT_USER\Software\Ares", "General.AutoStartUp",'REG_DWORD',0)



	FileWrite(@DesktopDir & "\Bien Instalado.txt","Inst. Snappy Drivers"&@CRLF)
Else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Inst. Snappy Drivers"&@CRLF)
EndIf

