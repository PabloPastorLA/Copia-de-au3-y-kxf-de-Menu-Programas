ShellExecute('ZChangeDefaultBrowser.exe')
WinWait('Change Default Browser')
WinActivate('Change Default Browser')
WinWaitActive('Change Default Browser')
while FileExists('ZChange')
	FileDelete('ZChange')
WEnd
if ControlCommand('Change Default Browser','','TRadioButton4',"ischecked", "")=1 Then FileWrite('ZChange','IEXPLORER')
if ControlCommand('Change Default Browser','','TRadioButton3',"ischecked", "")=1 Then FileWrite('ZChange','FIREFOX')
if ControlCommand('Change Default Browser','','TRadioButton2',"ischecked", "")=1 Then FileWrite('ZChange','CHROME')
if ControlCommand('Change Default Browser','','TRadioButton1',"ischecked", "")=1 Then FileWrite('ZChange','OTRO')

if ControlCommand('Change Default Browser','','TRadioButton1',"ischecked", "")<>1 Then
	ControlCommand('Change Default Browser','','TRadioButton1',"check", "")
	ControlClick('Change Default Browser','','TButton4')
	WinWait('Confirm')
	While WinExists('Confirm')
		IF ControlGetText('Confirm','OK','Button1')='OK' Then ControlClick('Confirm','OK','Button1')
		IF ControlGetText('Confirm','OK','TButton2')='OK' Then ControlClick('Confirm','OK','TButton2')
	WEnd
	WinWait('Information')
	While WinExists('Information')
		IF ControlGetText('Information','OK','TButton1')='OK' Then ControlClick('Information','OK','TButton1')
		IF ControlGetText('Information','OK','Button1')='OK' Then ControlClick('Information','OK','Button1')
	WEnd
EndIf
while WinGetState('Change Default Browser')<>13
	WinSetState('Change Default Browser','',@SW_HIDE)
WEnd
