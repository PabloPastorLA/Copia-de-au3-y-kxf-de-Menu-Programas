#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile_x64=install-vistumbler.exe
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
If $cmdline[0] > 0 Then Install_Vistumbler($cmdlineraw)
Func Install_Vistumbler($path,$af="")
	If $cmdline[0]>1 And $af="" Then $af=$cmdline[2]
	$pid = Run($path)
	WinWait("Vistumbler v10 Installer - License Agreement")
	ControlClick("Vistumbler v10 Installer - License Agreement", "GNU GENERAL PUBLIC LICENSE", "Button1")
	WinWait("Vistumbler v10 Installer - Install Options")
	If $af= Not Default Then ControlSetText("Vistumbler v10 Installer - Install Options", "Browse", "Edit1", $af)
	ControlCommand("Vistumbler v10 Installer - Install Options", "Browse", "Button11", "Uncheck")
	ControlClick("Vistumbler v10 Installer - Install Options", "Browse", "Button12")
	WinWait("Done", "Install completed succesfully")
	WinClose("Done", "Install completed succesfully")
EndFunc   ;==>Install_Vistumbler
