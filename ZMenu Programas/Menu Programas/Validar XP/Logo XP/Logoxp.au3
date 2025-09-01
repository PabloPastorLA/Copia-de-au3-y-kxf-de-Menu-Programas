;~ MsgBox(0,'',@WindowsDir&'\system')

if @OSVersion = "WIN_XP" Then
	FileCopy('oeminfo.ini',@WindowsDir&'\system',1)
	FileCopy('oemlogo.bmp',@WindowsDir&'\system',1)

EndIf