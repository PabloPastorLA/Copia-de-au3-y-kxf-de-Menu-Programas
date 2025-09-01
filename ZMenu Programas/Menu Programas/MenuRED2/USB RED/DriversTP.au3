	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst Driv TPLink',160,80,0,110)
if @OSVersion = "WIN_XP" or @OSVersion = "WIN_XPe" Then
Else
#RequireAdmin
EndIf

if @OSArch = "X86" Then
	ShellExecuteWait('dpinst.exe',' /q')
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Drivers TPLink"&@CRLF)
Else
	ShellExecuteWait('dpinst64.exe',' /q')
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Drivers TPLink"&@CRLF)
EndIf
