#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Des. Halted',160,80,0,110)



While FileExists(@WindowsDir&'\Halted')
	DirRemove(@WindowsDir&'\Halted',1)
WEnd

ShellExecuteWait('cmd.exe',' /C schtasks /delete /TN "GoogleSchedulerTaskMachine" /F')


While FileExists(@DesktopDir & "\HALTED.txt")
	FileDelete(@DesktopDir & "\HALTED.txt")
WEnd

