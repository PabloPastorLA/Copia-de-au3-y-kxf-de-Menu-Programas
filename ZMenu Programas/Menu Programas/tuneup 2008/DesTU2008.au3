

If FileExists(@ProgramFilesDir & "\TuneUp Utilities 2008\Integrator.exe")  Then
ShellExecuteWait("C:\WINDOWS\system32\MsiExec.exe"," /quiet /qn /x{5888428E-699C-4E71-BF71-94EE06B497DA}")


;~ WinWaitActive("TuneUp Utilities 2008 Instalar")
;~ ControlClick("TuneUp Utilities 2008 Instalar", "&Siguiente >", "Button1")

;~ WinWaitActive("TuneUp Utilities 2008 Instalar","TÉRMINOS Y CONDICINES")
;~ ControlClick("TuneUp Utilities 2008 Instalar", "Acepto e&l contrato de licencia", "Button3")
;~ ControlClick("TuneUp Utilities 2008 Instalar", "&Siguiente >", "Button4")

;~ WinWaitActive("TuneUp Utilities 2008 Instalar","Introduzca la información")
;~ ControlClick("TuneUp Utilities 2008 Instalar", "&Siguiente >", "Button4")
;~ WinWaitActive("TuneUp Utilities 2008 Instalar","Para instalarlos en otra carpeta")
;~ ControlClick("TuneUp Utilities 2008 Instalar", "&Siguiente >", "Button1")

;~ WinWaitActive("TuneUp Utilities 2008 Instalar","Ajustes de la aplicación")
;~ ControlClick("TuneUp Utilities 2008 Instalar", "&Siguiente >", "Button1")

;~ WinWaitActive("TuneUp Utilities 2008 Instalar","instalado satisfactoriamente")
;~ send("{ALTDOWN}{f}{ALTUP}")
;~ ControlClick("TuneUp Utilities 2008 Instalar", "&Finalizar >", "Button1")
;~ RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TuneUp.Defrag", "Start", "REG_DWORD", 4)


;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0", "UserName", "REG_SZ", 'Informatica L.A.')
;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0", "Company", "REG_SZ", 'Informatica L.A.')
;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0", "RegCode", "REG_SZ", 'RFEAH-CDXKX-UMFBW-GSCES-YFWCM-WUHWB')


;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0", "LaunchedUpdateWizard", "REG_DWORD", 0)

;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\System Optimizer", "QuickChk_Skip_DD", "REG_DWORD", 1)

;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0", "RemindAgainAfter", "REG_BINARY", 0x4118859c)
;~ RegWrite("HKEY_USERS\S-1-5-21-484763869-813497703-1417001333-500\Software\TuneUp\Utilities\7.0", "RemindAgainAfter", "REG_BINARY", 0x4118859c)


;~ HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\System Optimizer
;~ "QuickChk_Skip_DD"=dword:00000001

;~ run(@ProgramFilesDir & "\TuneUp Utilities 2008\Integrator.exe")

;~ WinWaitActive("Comprobar actualizaciones")
;~ ControlClick("Comprobar actualizaciones", "&No, recordar más adelante:", "TRadioButton2")
;~ ControlClick("Comprobar actualizaciones", "", "TComboBox1")
;~ send("{down}{down}{down}{down}{enter}")
;~ ControlClick("Comprobar actualizaciones", "Aceptar", "TButton1")

;~ WinWaitActive("TuneUp Utilities 2008")
;~ ControlClick("TuneUp Utilities 2008", "Introducir la clave del producto", "TButton1")

;~ WinWaitActive("Introducir el código")
;~ Send("PabloPastorLA")
;~ Send("{tab}")
;~ Send("0280154654999")
;~ Send("{tab}")
;~ Send("RFEAHCDXKXUMFBWGSCESYFWCMWUHWB")
;~ ControlClick("Introducir el código", "Aceptar", "TButton2")

;~ WinWaitActive("Muchas gracias")
;~ ControlClick("Muchas gracias.", "Aceptar", "Button1")

;~ WinWaitActive("Necesita reiniciar el programa")
;~ ControlClick("Necesita reiniciar el programa", "Aceptar", "Button1")

;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\System Optimizer", "QuickChk_Skip_DD", "REG_DWORD", 1)

;~ run(@ProgramFilesDir & "\TuneUp Utilities 2008\Integrator.exe")
;~ WinWaitActive("TuneUp Utilities 2008: Interfaz de inicio")
;~ ProcessClose ( "Integrator.exe" )

;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "DisableCounter", "REG_DWORD", 3)
;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_MemOptimizer", "REG_DWORD", 0)
;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_diskexplorer", "REG_DWORD", 0)

;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_DriveDefrag", "REG_DWORD", 0)
;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_StartUpManager", "REG_DWORD", 0)
;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_DiskCleaner", "REG_DWORD", 0)

;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_IconEngineer", "REG_DWORD", 0)
;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_ProcessManager", "REG_DWORD", 0)
;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_RegistryCleaner", "REG_DWORD", 0)

;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_RegistryDefrag", "REG_DWORD", 0)
;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_RegistryEditor", "REG_DWORD", 0)
;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_RescueCenter", "REG_DWORD", 0)

;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_Shredder", "REG_DWORD", 0)
;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_SystemControl", "REG_DWORD", 0)
;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_SystemInformation", "REG_DWORD", 0)

;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_SystemOptimizer", "REG_DWORD", 0)
;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_Undelete", "REG_DWORD", 0)
;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_UninstallManager", "REG_DWORD", 0)

;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_UpdateWizard", "REG_DWORD", 0)
;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_WinStyler", "REG_DWORD", 0)
;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_DiskDoctor", "REG_DWORD", 0)

;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_RepairWizard", "REG_DWORD", 0)
;~ RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_OneClick", "REG_DWORD", 0)




FileWrite(@DesktopDir & "\Bien Instalado.txt","Des TuneUP 2K8"&@CRLF)
else
FileWrite(@DesktopDir & "\Mal Instalado.txt","Des TuneUP 2K8"&@CRLF)
EndIf









#cs run(@ProgramFilesDir & "\TuneUp Utilities 2008\Integrator.exe")
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


