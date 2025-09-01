processwait('yct.exe')
Sleep(13000)
if WinExists('Select your language') then
;~ 	MsgBox(0,'','lang',2)
	if ControlGetText('Select your language','','ThunderRT6CommandButton1') = 'Ok' then MsgBox(0,'','boton',2)


EndIf


Do
	ProcessClose('yct.exe')
until not ProcessExists('yct.exe')











