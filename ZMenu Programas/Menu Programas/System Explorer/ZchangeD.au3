if not ProcessExists('ZChangeDefaultBrowser.exe') Then
	ShellExecute('ZChangeDefaultBrowser.exe')
	WinWait('Change Default Browser')
EndIf

WinSetState('Change Default Browser','',@SW_SHOW)
WinActivate('Change Default Browser')
WinWaitActive('Change Default Browser')

$Linea=FileReadLine('ZChange')
If $Linea = 'IEXPLORER' Then ControlCommand('Change Default Browser','','TRadioButton4',"check", "")
If $Linea = 'FIREFOX' Then ControlCommand('Change Default Browser','','TRadioButton3',"check", "")
If $Linea = 'CHROME' Then ControlCommand('Change Default Browser','','TRadioButton2',"check", "")
If $Linea = 'OTRO' Then otro()

MsgBox(0,'','')
ControlClick('Change Default Browser','Set Default Browser','TButton4')
WinWait('Confirm')
While WinExists('Confirm')
	If ControlGetText('Confirm','OK','Button1') then ControlClick('Confirm','OK','Button1')
	IF ControlGetText('Confirm','OK','TButton2')='OK' Then ControlClick('Confirm','OK','TButton2')
WEnd

WinWait('Information')
While WinExists('Information')
	IF ControlGetText('Information','OK','TButton1')='OK' Then ControlClick('Information','OK','TButton1')
	If ControlGetText('Confirm','OK','Button1') then ControlClick('Confirm','OK','Button1')
	If ControlGetText('Information','OK','Button1')='OK' then ControlClick('Information','OK','Button1')
WEnd
While WinExists('Change Default Browser')
	WinClose('Change Default Browser')
WEnd

Func otro()
	While WinExists('Change Default Browser')
		WinClose('Change Default Browser')
	WEnd
	exit
EndFunc
