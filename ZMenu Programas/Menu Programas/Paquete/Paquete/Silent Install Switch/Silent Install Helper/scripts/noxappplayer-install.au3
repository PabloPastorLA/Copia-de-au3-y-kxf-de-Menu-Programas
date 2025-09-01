#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile_x64=install-noxappplayer.exe
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
If $cmdline[0] > 0 Then Install_noxappplayer($cmdlineraw)
Func Install_noxappplayer($path, $af = "")
	If $cmdline[0] > 1 And $af = "" Then $af = $cmdline[2]
	$pid = Run($path)
	WinWait("[CLASS:ATL:0048CA60]")
	WinActivate("[CLASS:ATL:0048CA60]")
	Local $winpos = WinGetPos("[CLASS:ATL:0048CA60]")
		If $cmdline[0] > 1 Or $af = Not "" Then
		MouseClick("left", $winpos[0] + 580,$winpos[1]+365,1)
		Sleep(400)
		WinActivate("[CLASS:ATL:0048CA60]")
		MouseClick("left", $winpos[0] + 350, $winpos[1]+440,1)
		Send("{delete 30}")
		Send($af)
	WinActivate("[CLASS:ATL:0048CA60]")
MouseClick("left", $winpos[0] + 310, $winpos[1] + 250)
	Else
		MouseClick("left", $winpos[0] + 310, $winpos[1] + 250)
	EndIf
			Sleep(14000)
EndFunc   ;==>Install_noxappplayer
