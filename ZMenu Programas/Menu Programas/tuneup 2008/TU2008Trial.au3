SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. TU 2008',160,80,0,110)

If FileExists("Tu2008.bat") AND not FileExists (@ProgramFilesDir & "\TuneUp Utilities 2008\Integrator.exe")  Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Tune Up 2008"&@CRLF)

	ShellExecuteWait("Tu2008.bat")

	Sleep(1000)
	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TuneUp.Defrag", "Start", "REG_DWORD", 4)


	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0", "UserName", "REG_SZ", 'Informatica L.A.')
	RegWrite("HKEY_LOCAL_MACHINE\Software\TuneUp\Utilities\7.0", "UserName", "REG_SZ", 'Informatica L.A.')

	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0", "Company", "REG_SZ", 'Informatica L.A.')
	RegWrite("HKEY_LOCAL_MACHINE\Software\TuneUp\Utilities\7.0", "Company", "REG_SZ", 'Informatica L.A.')

	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0", "RegCode", "REG_SZ", 'RFEAH-CDXKX-UMFBW-GSCES-YFWCM-WUHWB')
	RegWrite("HKEY_LOCAL_MACHINE\Software\TuneUp\Utilities\7.0", "RegCode", "REG_SZ", 'RFEAH-CDXKX-UMFBW-GSCES-YFWCM-WUHWB')

	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0", "RemindAgainAfter", "REG_BINARY", 0x4118859c00000000)
	RegWrite("HKEY_LOCAL_MACHINE\Software\TuneUp\Utilities\7.0", "RemindAgainAfter", "REG_BINARY", 0x4118859c00000000)
	RegWrite("HKEY_USERS\S-1-5-21-484763869-813497703-1417001333-500\Software\TuneUp\Utilities\7.0", "RemindAgainAfter", "REG_BINARY", 0x4118859c00000000)

	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0", "LaunchedUpdateWizard", "REG_DWORD", 0)
	RegWrite("HKEY_LOCAL_MACHINE\Software\TuneUp\Utilities\7.0", "LaunchedUpdateWizard", "REG_DWORD", 0)

	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\System Optimizer", "QuickChk_Skip_DD", "REG_DWORD", 1)
	RegWrite("HKEY_LOCAL_MACHINE\Software\TuneUp\Utilities\7.0\System Optimizer", "QuickChk_Skip_DD", "REG_DWORD", 1)






	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "DisableCounter", "REG_DWORD", 3)
	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_MemOptimizer", "REG_DWORD", 0)
	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_diskexplorer", "REG_DWORD", 0)

	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_DriveDefrag", "REG_DWORD", 0)
	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_StartUpManager", "REG_DWORD", 0)
	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_DiskCleaner", "REG_DWORD", 0)

	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_IconEngineer", "REG_DWORD", 0)
	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_ProcessManager", "REG_DWORD", 0)
	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_RegistryCleaner", "REG_DWORD", 0)

	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_RegistryDefrag", "REG_DWORD", 0)
	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_RegistryEditor", "REG_DWORD", 0)
	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_RescueCenter", "REG_DWORD", 0)

	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_Shredder", "REG_DWORD", 0)
	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_SystemControl", "REG_DWORD", 0)
	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_SystemInformation", "REG_DWORD", 0)

	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_SystemOptimizer", "REG_DWORD", 0)
	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_Undelete", "REG_DWORD", 0)
	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_UninstallManager", "REG_DWORD", 0)

	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_UpdateWizard", "REG_DWORD", 0)
	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_WinStyler", "REG_DWORD", 0)
	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_DiskDoctor", "REG_DWORD", 0)

	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_RepairWizard", "REG_DWORD", 0)
	RegWrite("HKEY_CURRENT_USER\Software\TuneUp\Utilities\7.0\WelcomeScreen", "ws_OneClick", "REG_DWORD", 0)


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Tune Up 2008"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Tune Up 2008"&@CRLF)
EndIf




