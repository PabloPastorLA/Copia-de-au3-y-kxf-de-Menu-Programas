TareaProgNODUpgrade()

;~ Closecerrarvent()

func TareaProgNODUpgrade()

	if FileExists(@ProgramFilesDir & '\ESET\') Then
		while not FileExists(@ProgramFilesDir & '\ESET\NOD Reset Upgrade.exe')
			FileCopy('NOD Reset Upgrade\NOD Reset Upgrade.exe',@ProgramFilesDir & '\ESET\NOD Reset Upgrade.exe',9)
			Sleep(500)
		WEnd
		ShellExecuteWait('cmd.exe',' /C schtasks /delete /TN "NOD Reset Upgrade" /F')
		ShellExecuteWait('cmd.exe',' /C schtasks /create /TN "NOD Reset Upgrade" /RL HIGHEST /SC ONLOGON /TR "'&"'"&@ProgramFilesDir & '\ESET\NOD Reset Upgrade.exe'&"'")

	elseif FileExists(@ProgramFilesDir & ' (x86)\ESET\') Then
		while not FileExists(@ProgramFilesDir & ' (x86)\ESET\NOD Reset Upgrade.exe')
			FileCopy('NOD Reset Upgrade\NOD Reset Upgrade.exe',@ProgramFilesDir & ' (x86)\ESET\NOD Reset Upgrade.exe',9)
			Sleep(500)
		WEnd
		ShellExecuteWait('cmd.exe',' /C schtasks /delete /TN "NOD Reset Upgrade" /F')
		ShellExecuteWait('cmd.exe',' /C schtasks /create /TN "NOD Reset Upgrade" /RL HIGHEST /SC ONLOGON /TR "'&"'"&@ProgramFilesDir & ' (x86)\ESET\NOD Reset Upgrade.exe'&"'")
;	elseif FileExists($progr & '\ESET\ESET NOD32 Antivirus\x86\ekrn.exe') Then
;		while not FileExists($progr & '\ESET\ESET NOD32 Antivirus\x86\NOD Reset Upgrade.exe')
;			FileCopy('NOD Reset Upgrade\NOD Reset Upgrade.exe',$progr & '\ESET\ESET NOD32 Antivirus\x86\NOD Reset Upgrade.exe',9)
;			Sleep(500)
;		WEnd
;		ShellExecuteWait('cmd.exe',' /C schtasks /delete /TN "NOD Reset Upgrade" /F')
;		ShellExecuteWait('cmd.exe',' /C schtasks /create /TN "NOD Reset Upgrade" /RL HIGHEST /SC ONLOGON /TR "'&"'"&$progr & '\ESET\ESET NOD32 Antivirus\x86\NOD Reset Upgrade.exe'&"'")
	Else
		While 1
			MsgBox(0,'','NOD32 donde copiar NOD Reset Upgrade.exe')
		WEnd
	EndIf
	ShellExecuteWait('NOD Reset Upgrade\NOD Reset Upgrade.exe')
EndFunc