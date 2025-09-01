ProcessClose("Microsoft Genuine Advantage Diagnostic Tool.exe")

$serial1="RP4WP-GB23G-3DC4P-X446K-M2DMJ"

ShellExecute("ChangeVLKeySP1.vbs",$serial1)
ProcessWaitClose("wscript.exe")



;~ run("Microsoft Genuine Advantage Diagnostic Tool.exe")




run("MGADiag.exe")
WinWait("Microsoft Genuine Advantage Diagnostic Tool (1.9.0027.0)","Press CONTINUE to perform diagnostics.")
While WinExists ("Microsoft Genuine Advantage Diagnostic Tool (1.9.0027.0)","Press CONTINUE to perform diagnostics.")
	WinActivate ("Microsoft Genuine Advantage Diagnostic Tool (1.9.0027.0)","Press CONTINUE to perform diagnostics.")
	Send("{ALTDOWN}{c}{ALTUP}")
WEnd

ProcessWaitClose("MGADiag.exe")



