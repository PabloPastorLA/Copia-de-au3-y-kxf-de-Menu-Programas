#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. HxD Hex',160,80,0,110)

;If FileExists("setup.exe") AND not FileExists (@ProgramFilesDir & "\HxD\HxD.exe") AND not FileExists (@ProgramFilesDir & " (x86)\HxD\HxD.exe")  Then
	ShellExecuteWait("setup.exe",' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-')


;SOLO LECTURA	   ;RegWrite('HKEY_CURRENT_USER\Software\Classes\*\shell\HxD\command','','REG_SZ','"C:\Program Files (x86)\HxD\HxD.exe" /readonly "%1"')
					RegWrite('HKEY_CURRENT_USER\Software\Classes\*\shell\HxD\command','','REG_SZ','"C:\Program Files (x86)\HxD\HxD.exe" "%1"')



;EndIf


