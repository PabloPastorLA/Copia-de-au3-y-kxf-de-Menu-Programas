#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

while ProcessExists('Estado Bateria.exe')
	Sleep(500)
WEnd
While ProcessExists('DontSleep.exe') or ProcessExists('DontSleep_x64.exe')
	ProcessClose('DontSleep.exe')
	ProcessClose('DontSleep_x64.exe')
WEnd
Exit