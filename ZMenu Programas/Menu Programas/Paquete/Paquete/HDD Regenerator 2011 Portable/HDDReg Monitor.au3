#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****


Do
;MsgBox(0,'',WinGetState('HDD Regenerator 2011',''))
;	SplashTextOn('asd',WinGetState('HDD Regenerator 2011',''),200,200)
	if (WinGetState('HDD Regenerator 2011','')=21 or WinGetState('HDD Regenerator 2011','')=5 )     And WinExists('HDD Regenerator 2011') then ProcessClose('HDD Regenerator.exe')
	Sleep(100)
until not ProcessExists ('HDD Regenerator.exe')

RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run\','HDD Regenerator')
RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\','HDD Regenerator')








