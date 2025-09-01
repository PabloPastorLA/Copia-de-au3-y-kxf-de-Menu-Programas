conf()

func conf()
	WinWait('Select your language')
	do
		ControlClick('Select your language','','ThunderRT6CommandButton1')
	until not WinExists('Select your language')

	WinWait('aTube Catcher 3.8.9831')
	Do
		ControlClick('aTube Catcher 3.8.9831','','Button1')
	Until not WinExists('aTube Catcher 3.8.9831','Default settings loaded!')

	WinWait(' aTube Catcher')
	WinWait('aTube Catcher 3.8.9831 - Studio Suite - DsNET Corp. 2020')
	do
		WinClose(' aTube Catcher')
		WinClose('aTube Catcher 3.8.9831 - Studio Suite - DsNET Corp. 2020')
	until not WinExists(' aTube Catcher') and not WinExists('aTube Catcher 3.8.9831 - Studio Suite - DsNET Corp. 2020')

EndFunc
