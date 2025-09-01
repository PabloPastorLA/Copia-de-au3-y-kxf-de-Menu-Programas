ShellExecute('chrome',' "asd"')
Do
Until WinExists('asd - Google Chrome') or WinExists('Sin título - Google Chrome')
do
	WinActivate('asd - Google Chrome')
	WinActivate('Sin título - Google Chrome')
	Send('{altdown}{d}{altup}{ctrldown}{c}{ctrlup}')
	SplashTextOn('esperando 5 seg','',100,100,0,30)
;~ 	Sleep(200)
	SplashOff()
until ClipGet()='http://asd/'
ClipPut('chrome://extensions/')
Send('{ctrldown}{v}{ctrlup}{enter}')