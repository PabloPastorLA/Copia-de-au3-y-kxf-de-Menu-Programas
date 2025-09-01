#include <File.au3>
If @OSVersion <> 'WIN_XP' Then
	#RequireAdmin
EndIf

;MsgBox(0,'','reiniciarcompleto desactivado')
;Exit
Sleep(2000)
ReiniciarCompleto()


Func ReiniciarCompleto()
	;TareaProgContinuar()
	Reiniciar()
EndFunc   ;==>ReiniciarCompleto



Func Reiniciar()
	While ProcessExists('DontSleep.exe') or ProcessExists('DontSleep_x64.exe') Or ProcessExists('ventrun.exe')
		ProcessClose('DontSleep.exe')
		ProcessClose('DontSleep_x64.exe')
		ProcessClose('ventrun.exe')
	WEnd

	FileWrite(@DesktopDir & "\Bien Instalado.txt", '----------------------------------------------------------------' & @CRLF & "MENU: Reinicio Sistema." & @CRLF & '----------------------------------------------------------------' & @CRLF)

	ShellExecuteWait('shutdown', ' /r -t 0')

EndFunc   ;==>ReiniciaryCerrar
