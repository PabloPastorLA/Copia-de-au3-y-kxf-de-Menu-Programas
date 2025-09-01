
If FileExists("instalar WMP.bat") and @OSVersion = "WIN_XP" Then
ShellExecuteWait("instalar WMP.bat","","")
While ProcessExists("wuauclt.exe")
ProcessClose("wuauclt.exe")
WEnd
ProcessWaitClose("wuauclt.exe")


;--------------------------------------------------------------------

;asi como esta funciona en una instalacion de cero
run(@ProgramFilesDir &"\Windows Media Player\wmplayer.exe")
WinWait("Reproductor de Windows Media 11","&Validar")
While WinExists("Reproductor de Windows Media 11","&Validar")
	ControlClick("Reproductor de Windows Media 11","&Validar","Button6")
WEnd
WinWait("Reproductor de Windows Media 11","TÉRMINOS DE LICENCIA ")
While WinExists("Reproductor de Windows Media 11","TÉRMINOS DE LICENCIA ")
	ControlClick("Reproductor de Windows Media 11","Ac&epto","Button5")
WEnd
WinWait("Reproductor de Windows Media 11","Elija la configuración principal del Reproductor ")
While WinExists("Reproductor de Windows Media 11","Elija la configuración principal del Reproductor ")
	ControlClick("Reproductor de Windows Media 11","&Configuración rápida (recomendado)","Button1")
	ControlClick("Reproductor de Windows Media 11","&Finalizar","Button9")
WEnd
ProcessWait("wmplayer.exe")
sleep(1000)
ProcessClose("wmplayer.exe")
ProcessWaitClose("wmplayer.exe")
;--------------------------------------------------------------------
RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WMPNetworkSvc","Start","REG_DWORD",4)

;--------------------------------------------------------------------


FileWrite(@DesktopDir & "\Bien Instalado.txt","Windows Media Player 11"&@CRLF)
else
FileWrite(@DesktopDir & "\Mal Instalado.txt","Windows Media Player 11"&@CRLF)
EndIf