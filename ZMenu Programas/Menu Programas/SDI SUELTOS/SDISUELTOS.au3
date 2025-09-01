#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf


$x86='SDI_R2000.exe'
$x64='SDI_x64_R2000.exe'
$texto='SDI SUELTOS'

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. '&$texto,160,80,0,110)

If (FileExists($x86) AND @OSArch='x86') or (FileExists($x64) AND @OSArch<>'x86') Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	"&$texto&@CRLF)

	if @OSArch='x86' then ShellExecute($x86,' -autoinstall -norestorepnt -autoclose')
	if @OSArch<>'x86' then ShellExecute($x64,' -autoinstall -norestorepnt -autoclose')


	While not ProcessExists($x86) and not ProcessExists($x64)
		Sleep('1000')
	WEnd

;ventanas 	que aparecen mientras está corriendo el programa
	While ProcessExists($x86) or ProcessExists($x64)
		if WinExists('Alerta de seguridad de Windows','Firewall de Windows') then ControlClick('Alerta de seguridad de Windows','&Permitir acceso','Button6')
		if WinExists('Microsoft Windows','Reiniciar &más tarde') then ControlClick('Microsoft Windows','','Button2')
		if WinExists('Seguridad de Windows','&Instalar') and ControlGetText('Seguridad de Windows','','Button1')='&Instalar' then ControlClick('Seguridad de Windows','','Button1')

		Sleep('300')
	WEnd


;ventanas que aparecen luego de cerrarse el programa
	$exit=100
	While $exit>0
		SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. '&$texto& @crlf & 'Terminando en '&$exit,160,80,0,110)
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


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	"&$texto&@CRLF)

Else
	FileWrite(@DesktopDir & "\Mal Instalado.txt",$texto&@CRLF)
EndIf

