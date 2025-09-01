#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile_x64=install-tixati.exe
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
If $cmdline[0] > 0 Then Install_Tixati($cmdlineraw)
Func Install_Tixati($path)
	ProcessClose("tixati.exe")
	ProcessWaitClose("tixati.exe", 5)
	$hrun = Run($path)
	WinWait("Tixati", "Click the 'Continue' button to proceed.")
	ControlClick("Tixati", "Click the 'Continue' button to proceed.", "Button1")
	WinWait("Tixati", "YES, continue installation")
	ControlClick("Tixati", "YES, continue installation", "Button1")
	WinWait("Tixati", "Tixati will be installed in this location:")
	ControlCommand("Tixati", "Tixati will be installed in this location:", "Button5", "Uncheck")
	ControlCommand("Tixati", "Tixati will be installed in this location:", "Button6", "Uncheck")
	ControlCommand("Tixati", "Tixati will be installed in this location:", "Button7", "Uncheck")
	ControlClick("Tixati", "Tixati will be installed in this location:", "Button1")
	WinWait("Tixati", "Installation is complete!")
	ControlClick("Tixati", "Installation is complete!", "Button2")
EndFunc   ;==>Install_Tixati
