; check inicio final


;~ If FileExists (@ProgramFilesDir & "\ESET\ESET NOD32 Antivirus\callmsi.exe") Then
;~ 		ShellExecutewait(@ProgramFilesDir & '\ESET\ESET NOD32 Antivirus\callmsi.exe', ' /x {1D48FBBF-E8C3-4EB2-9A66-47468E8562C2} /qn')
;~ EndIf


ShellExecutewait(@ProgramFilesDir & '\ESET\ESET NOD32 Antivirus\callmsi.exe', '  /i {1D48FBBF-E8C3-4EB2-9A66-47468E8562C2} /qn')




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
;WinWaitActive("Instalaci�n de Unlocker 1.9.2")
;send(" {!s} ")
;WinWaitActive("Instalaci�n de Unlocker 1.9.2","A. Unlocker End User License Agreement")
;WinActivate("Instalaci�n de Unlocker 1.9.2","A. Unlocker End User License Agreement")
;send("{ALTDOWN}{c}{ALTUP}")
;WinWaitActive("Instalaci�n de Unlocker 1.9.2", "Delta Toolbar")
;ControlClick("Instalaci�n de Unlocker 1.9.2", "Advanced", "Button9")
;ControlClick("Instalaci�n de Unlocker 1.9.2", "Install Delta toolbar", "Button5")
;ControlClick("Instalaci�n de Unlocker 1.9.2", "&Siguiente >", "Button2")
;WinWaitActive("Instalaci�n de Unlocker 1.9.2", "Elegir lugar de instalaci�n")
;ControlClick("Instalaci�n de Unlocker 1.9.2", "&Siguiente >", "Button2")

;WinWaitActive("Instalaci�n de Unlocker 1.9.2", "Selecci�n de componentes")
;ControlClick("Instalaci�n de Unlocker 1.9.2", "&Instalar", "Button2")

;WinWaitActive("Instalaci�n de Unlocker 1.9.2", "Unlocker 1.9.2 ha sido instalad")
;ControlClick("Instalaci�n de Unlocker 1.9.2", "&Terminar", "Button2")
;WinWaitClose("Instalaci�n de Unlocker 1.9.2")
;ALT � [!a]
;WinWaitActive("Iniciar sesi�n - Google Chrome","Iniciar sesi�n")
;send("{tab}{tab}{tab}{tab}{tab}{space}")
;Sleep(5000)


