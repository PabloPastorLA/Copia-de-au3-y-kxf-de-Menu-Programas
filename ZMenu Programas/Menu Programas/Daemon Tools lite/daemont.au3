
If FileExists("DTLite501-0406.exe") AND FileExists("daemont.bat") AND not FileExists (@ProgramFilesDir & "\DAEMON Tools Lite\DTLite.exe")  Then
	ShellExecute("daemont.bat")
	ProcessWait ('DTLite501-0406.exe')
	paso()
	If WinExists ('Seguridad de Windows','Sólo debería instalar software de controlador') Then
		while WinExists ('Seguridad de Windows','Sólo debería instalar software de controlador')
			ControlClick ('Seguridad de Windows','&Instalar','Button1')
		WEnd
	EndIf
	paso()
	If WinExists ('Advertencia de seguridad de gadgets de escritorio','¿Desea instalar este gadget?') Then
		while WinExists ('Advertencia de seguridad de gadgets de escritorio','¿Desea instalar este gadget?')
			ControlClick ('Advertencia de seguridad de gadgets de escritorio','&No instalar','Button2')
		WEnd
	EndIf
	paso()
	ProcessWaitClose('DTLite501-0406.exe')

	RegWrite('HKEY_CURRENT_USER\Software\Disc Soft\DAEMON Tools Lite\View',"Language",'REG_DWORD',0x00000c0a)
	RegWrite('HKEY_CURRENT_USER\Software\Disc Soft\DAEMON Tools Lite\Config',"UseTrayAgent",'REG_DWORD',1)
	RegWrite('HKEY_CURRENT_USER\Software\Disc Soft\DAEMON Tools Lite\Config',"CheckForUpdate",'REG_DWORD',0)


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Daemon Tools"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Daemon Tools"&@CRLF)
EndIf



func paso()
	while ProcessExists ('DTLite501-0406.exe') and not WinExists ('Seguridad de Windows','Sólo debería instalar software de controlador') and not WinExists ('Advertencia de seguridad de gadgets de escritorio','¿Desea instalar este gadget?')
;~ 		MsgBox(0,'','b')
		Sleep(500)
	WEnd
EndFunc


#cs

If FileExists("TU2008TrialES.exe") AND not FileExists (@ProgramFilesDir & "\TuneUp Utilities 2008\Integrator.exe")  Then
run("TU2008TrialES.exe")
WinWait("TuneUp Utilities 2008 Instalar")
WinActivate("TuneUp Utilities 2008 Instalar")
WinWaitActive("TuneUp Utilities 2008 Instalar")
ControlClick("TuneUp Utilities 2008 Instalar", "&Siguiente >", "Button1")

WinWait("TuneUp Utilities 2008 Instalar","TÉRMINOS Y CONDICINES")
WinActivate("TuneUp Utilities 2008 Instalar","TÉRMINOS Y CONDICINES")
WinWaitActive("TuneUp Utilities 2008 Instalar","TÉRMINOS Y CONDICINES")
ControlClick("TuneUp Utilities 2008 Instalar", "Acepto e&l contrato de licencia", "Button3")
ControlClick("TuneUp Utilities 2008 Instalar", "&Siguiente >", "Button4")

WinWait("TuneUp Utilities 2008 Instalar","Introduzca la información")
WinActivate("TuneUp Utilities 2008 Instalar","Introduzca la información")
WinWaitActive("TuneUp Utilities 2008 Instalar","Introduzca la información")
ControlClick("TuneUp Utilities 2008 Instalar", "&Siguiente >", "Button4")
WinWait("TuneUp Utilities 2008 Instalar","Para instalarlos en otra carpeta")
WinActivate("TuneUp Utilities 2008 Instalar","Para instalarlos en otra carpeta")
WinWaitActive("TuneUp Utilities 2008 Instalar","Para instalarlos en otra carpeta")
ControlClick("TuneUp Utilities 2008 Instalar", "&Siguiente >", "Button1")

WinWait("TuneUp Utilities 2008 Instalar","Ajustes de la aplicación")
WinActivate("TuneUp Utilities 2008 Instalar","Ajustes de la aplicación")
WinWaitActive("TuneUp Utilities 2008 Instalar","Ajustes de la aplicación")
ControlClick("TuneUp Utilities 2008 Instalar", "&Siguiente >", "Button1")

WinWait("TuneUp Utilities 2008 Instalar","instalado satisfactoriamente")
WinActivate("TuneUp Utilities 2008 Instalar","instalado satisfactoriamente")
WinWaitActive("TuneUp Utilities 2008 Instalar","instalado satisfactoriamente")
send("{ALTDOWN}{f}{ALTUP}")
ControlClick("TuneUp Utilities 2008 Instalar", "&Finalizar >", "Button1")
RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TuneUp.Defrag", "Start", "REG_DWORD", 4)

Else
EndIf





run(@ProgramFilesDir & "\TuneUp Utilities 2008\Integrator.exe")

WinWait("Comprobar actualizaciones")
WinActivate("Comprobar actualizaciones")
WinWaitActive("Comprobar actualizaciones")
ControlClick("Comprobar actualizaciones", "&No, recordar más adelante:", "TRadioButton2")
ControlClick("Comprobar actualizaciones", "", "TComboBox1")
send("{down}{down}{down}{down}{enter}")
ControlClick("Comprobar actualizaciones", "Aceptar", "TButton1")

WinWait("TuneUp Utilities 2008")
WinActivate("TuneUp Utilities 2008")
WinWaitActive("TuneUp Utilities 2008")
ControlClick("TuneUp Utilities 2008", "Introducir la clave del producto", "TButton1")

WinWait("Introducir el código")
WinActivate("Introducir el código")
WinWaitActive("Introducir el código")
Send("PabloPastorLA")
Send("{tab}")
Send("0280154654999")
Send("{tab}")
Send("RFEAHCDXKXUMFBWGSCESYFWCMWUHWB")
ControlClick("Introducir el código", "Aceptar", "TButton2")

WinWait("Muchas gracias.")
WinActivate("Muchas gracias.")
WinWaitActive("Muchas gracias.")
ControlClick("Muchas gracias.", "Aceptar", "Button1")

WinWait("Necesita reiniciar el programa")
WinActivate("Necesita reiniciar el programa")
WinWaitActive("Necesita reiniciar el programa")
ControlClick("Necesita reiniciar el programa", "Aceptar", "Button1")

RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\System Optimizer", "QuickChk_Skip_DD", "REG_DWORD", 1)

run(@ProgramFilesDir & "\TuneUp Utilities 2008\Integrator.exe")
WinWait("TuneUp Utilities 2008: Interfaz de inicio")
WinActivate("TuneUp Utilities 2008: Interfaz de inicio")
WinWaitActive("TuneUp Utilities 2008: Interfaz de inicio")
ProcessClose ( "Integrator.exe" )

RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "DisableCounter", "REG_DWORD", 3)
RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_MemOptimizer", "REG_DWORD", 0)
RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_diskexplorer", "REG_DWORD", 0)

RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_DriveDefrag", "REG_DWORD", 0)
RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_StartUpManager", "REG_DWORD", 0)
RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_DiskCleaner", "REG_DWORD", 0)

RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_IconEngineer", "REG_DWORD", 0)
RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_ProcessManager", "REG_DWORD", 0)
RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_RegistryCleaner", "REG_DWORD", 0)

RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_RegistryDefrag", "REG_DWORD", 0)
RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_RegistryEditor", "REG_DWORD", 0)
RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_RescueCenter", "REG_DWORD", 0)

RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_Shredder", "REG_DWORD", 0)
RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_SystemControl", "REG_DWORD", 0)
RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_SystemInformation", "REG_DWORD", 0)

RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_SystemOptimizer", "REG_DWORD", 0)
RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_Undelete", "REG_DWORD", 0)
RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_UninstallManager", "REG_DWORD", 0)

RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_UpdateWizard", "REG_DWORD", 0)
RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_WinStyler", "REG_DWORD", 0)
RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_DiskDoctor", "REG_DWORD", 0)

RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_RepairWizard", "REG_DWORD", 0)
RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_OneClick", "REG_DWORD", 0)



#ce


#cs
run(@ProgramFilesDir & "\TuneUp Utilities 2008\Integrator.exe")
WinWait("TuneUp Utilities 2008: Interfaz de inicio")
WinActivate("TuneUp Utilities 2008: Interfaz de inicio")
WinWaitActive("TuneUp Utilities 2008: Interfaz de inicio")
ControlClick("Necesita reiniciar el programa", "Aceptar", "Button1")
#ce


;ProcessClose ( "UnlockerAssistant.exe" )
;If $title = "Mozilla Firefox Setup " And $TextLine[8] = "C:\Program Files\Mozilla Firefox\" Or                  ;32bit
;   $title = "Mozilla Firefox Setup " And $TextLine[8] = "C:\Program Files(x86)\Mozilla Firefox\" Then      ;64bit
;Something I do when it's correct
;ElseIf $title = "Mozilla Firefox Setup " And $TextLine[8] = $ProgramFiles & "FireFox\" Then
;Something I do when it's not correct
;Else
;It didn't find what it's supposed to
;EndIf


;run("Unlocker1-9-2.exe")
;WinWaitActive("Installer Language")
;send("{enter}")
;WinWaitActive("Instalación de Unlocker 1.9.2")
;send(" {!s} ")
;WinWaitActive("Instalación de Unlocker 1.9.2","A. Unlocker End User License Agreement")
;WinActivate("Instalación de Unlocker 1.9.2","A. Unlocker End User License Agreement")
;send("{ALTDOWN}{c}{ALTUP}")
;WinWaitActive("Instalación de Unlocker 1.9.2", "Delta Toolbar")
;ControlClick("Instalación de Unlocker 1.9.2", "Advanced", "Button9")
;ControlClick("Instalación de Unlocker 1.9.2", "Install Delta toolbar", "Button5")
;ControlClick("Instalación de Unlocker 1.9.2", "&Siguiente >", "Button2")
;WinWaitActive("Instalación de Unlocker 1.9.2", "Elegir lugar de instalación")
;ControlClick("Instalación de Unlocker 1.9.2", "&Siguiente >", "Button2")

;WinWaitActive("Instalación de Unlocker 1.9.2", "Selección de componentes")
;ControlClick("Instalación de Unlocker 1.9.2", "&Instalar", "Button2")

;WinWaitActive("Instalación de Unlocker 1.9.2", "Unlocker 1.9.2 ha sido instalad")
;ControlClick("Instalación de Unlocker 1.9.2", "&Terminar", "Button2")
;WinWaitClose("Instalación de Unlocker 1.9.2")
;ALT – [!a]
;WinWaitActive("Iniciar sesión - Google Chrome","Iniciar sesión")
;send("{tab}{tab}{tab}{tab}{tab}{space}")
;Sleep(5000)


