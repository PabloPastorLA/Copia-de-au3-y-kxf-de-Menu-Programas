#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile_x64=install-vistumbler.exe
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
If $cmdline[0] > 0 Then Install_Twitch($cmdlineraw)
Func Install_Twitch($path, $af = "")
	If $cmdline[0] > 1 And $af = "" Then $af = $cmdline[2]
	$pid = Run($path)
	WinWait("[CLASS:Twitch Setup]")
	Local $winpos = WinGetPos("[CLASS:Twitch Setup]")
	If $cmdline[0] > 1 Or $af = Not "" Then
		MouseClick("left", $winpos[0] + 340, $winpos[1] + 285)
		Sleep(400)
		WinActivate("[CLASS:Twitch Setup]")
		MouseClick("left", $winpos[0] + 320, $winpos[1] + 270)
		WinWait("Choose install path")
		If Not FileExists($af) Then DirCreate($af)
		If Not @error Then ControlSetText("Choose install path", "ShellView", "Edit1", $af)
		ControlClick("Choose install path", "ShellView", "Button1")
		WinActivate("[CLASS:Twitch Setup]")
		MouseClick("left", $winpos[0] + 230, $winpos[1] + 340)
	Else
		MouseClick("left", $winpos[0] + 180, $winpos[1] + 270)
	EndIf
EndFunc   ;==>Install_Twitch
