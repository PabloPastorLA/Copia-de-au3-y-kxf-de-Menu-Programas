agregarextension('universal_bypass-13.15.2.1-an+fx.xpi')



func agregarextension($ext)
	$pos=WinGetPos("Mozilla Firefox")
	MsgBox(0,'',$pos[2])

	Do
		ProcessClose('Firefox.exe')
	until not ProcessExists('Firefox.exe')
	ShellExecute('Firefox','"'&$ext&'"')
	WinWait('Mozilla Firefox')
	WinWaitActive('Mozilla Firefox')
	WinWaitActive('')
	WinWaitActive("[STYLE:0x9a000000]", "", 7)
	Sleep(5000)
	$pos=WinGetPos("[ACTIVE]")
	MsgBox(0,'',$pos[2])
	;send('{altdown}{a}{altup}')
EndFunc

