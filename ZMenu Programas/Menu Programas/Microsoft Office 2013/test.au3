	If @OSArch='X86' Then
		ShellExecuteWait('AutoIt3.exe',"Kmslite.au3", "KMSLite")
	ElseIf @OSArch='X64' Then
		ShellExecuteWait('AutoIt3_x64.exe',"Kmslite.au3", "KMSLite")
	EndIf
