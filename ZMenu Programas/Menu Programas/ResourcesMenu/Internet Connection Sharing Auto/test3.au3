Do
	Sleep(5000)
	$ret = DllCall("kernel32.dll","long","GetTickCount")
	If IsArray($ret) Then
		$uptime = Round(($ret[0] / 1000),1); convert miliseconds to seconds
 		consolewrite(@CRLF&$uptime)
	EndIf
Until $uptime>=180

		MsgBox(0,"Uptime", $uptime,3)


;~ If IsArray($ret) Then
;~     $uptime = Round(($ret[0] / 3600000),1); convert miliseconds to hours
;~     $uptime = Round(($ret[0] / 1000),1); convert miliseconds to hours
;~     MsgBox(0,"Uptime", $uptime,3)
;~ EndIf