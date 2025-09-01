
if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. TU 2010',160,80,0,110)
If FileExists('777812.msi') AND FileExists('777816.msi') AND not FileExists (@ProgramFilesDir & "\TuneUp Utilities 2010\Integrator.exe") AND not FileExists (@ProgramFilesDir & " (x86)\TuneUp Utilities 2010\Integrator.exe") Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Tune Up 2010"&@CRLF)

	RunWait('msiexec.exe /i "777812.msi" /qn')
	RunWait('msiexec.exe /i "777816.msi" /qn')
	RunWait('REGEDIT /S "tuneup.reg"')
	if @OSArch <> 'x86' then RunWait('REGEDIT /S "tuneupx64.reg"')


	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TuneUp.Defrag", "Start", "REG_DWORD", 4)
	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TuneUp.UtilitiesSvc", "Start", "REG_DWORD", 4)


	ShellExecuteWait('cmd.exe',' /C schtasks /end /TN "TuneUpUtilities_Task_BkGndMaintenance"','','',@SW_HIDE)
	ShellExecuteWait('cmd.exe',' /C schtasks /delete /TN "TuneUpUtilities_Task_BkGndMaintenance" /F','','',@SW_HIDE)




	FileMove(@DesktopCommonDir&'\TuneUp Mantenimiento con 1 clic.lnk',@DesktopCommonDir&'\Mantenimiento con 1 clic.lnk')

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Tune Up 2010"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Tune Up 2010"&@CRLF)
EndIf