#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile_x64=install-MX5.exe
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
If $cmdline[0] > 0 Then Install_MX5($cmdlineraw)
Func Install_MX5($path, $af = "")
	If $cmdline[0] > 1 And $af = "" Then $af = $cmdline[2]
	$pid = Run($path)
	WinWait("[CLASS:MxInstallWndCls]")
	WinActivate("[CLASS:MxInstallWndCls]")
	Local $winpos = WinGetPos("[CLASS:MxInstallWndCls]")
	If $cmdline[0] > 1 Or $af = Not "" Then
		MouseClick("left", $winpos[0] + 680,$winpos[1]+460,1)
		Sleep(400)
		WinActivate("[CLASS:MX5 Installer]")
		MouseClick("left", $winpos[0] + 350, $winpos[1]+510,1)
		Send("{backspace 50}")
		Send($af)
		WinActivate("[CLASS:MX5 Installer]")
		MouseClick("left", $winpos[0] + 260, $winpos[1] + 350)
	Else
		MouseClick("left", $winpos[0] + 350, $winpos[1] + 350)
		EndIf
EndFunc   ;==>Install_MX5
