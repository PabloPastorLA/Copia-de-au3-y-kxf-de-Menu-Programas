if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf

#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'ACT. Win Def',160,80,0,110)

cerrar()

if not FileExists("DefenderControl.exe") then ShellExecuteWait('cmd','/c RAR.exe x -p123 -y "DefenderControl pass 123.rar" ',@ScriptDir,'',@SW_HIDE)
ShellExecuteWait("DefenderControl.exe"," /E")
FileDelete("DefenderControl.exe")




func cerrar()
	do
		ProcessClose('DefenderControl.exe')
	until not ProcessExists('DefenderControl.exe')
EndFunc

