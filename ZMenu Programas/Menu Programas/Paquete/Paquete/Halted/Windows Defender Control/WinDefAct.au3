if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'ACT. Win Def',160,80,0,110)

cerrar()

ShellExecuteWait("DefenderControl.exe"," /E")






func cerrar()
	do
		ProcessClose('DefenderControl.exe')
	until not ProcessExists('DefenderControl.exe')
EndFunc

