;#NoTrayIcon
if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <File.au3>

Do
	processclose('DontSleep_x64.exe')
	processclose('DontSleep.exe')
until not ProcessExists('DontSleep_x64.exe') and not ProcessExists('DontSleep.exe')

if @OSArch='X86' then ShellExecute(@ScriptDir&'\DontSleep.exe',' hide','','',@SW_HIDE)
if @OSArch<>'X86' then ShellExecute(@ScriptDir&'\DontSleep_x64.exe',' hide','','',@SW_HIDE)

Exit



Do
	WinSetState("Don't Sleep 4.03",'',@SW_HIDE)
until WinGetState("Don't Sleep 4.03")=5
;MsgBox(0,'','')
;$exit=0
Do
	WinSetState("Don't Sleep 4.03",'',@SW_HIDE)
	;$exit=$exit+1
	;Sleep(1)
	;MsgBox(0,'',WinGetState("Don't Sleep 4.03"))
until WinGetState("Don't Sleep 4.03")=5;$exit>=50


