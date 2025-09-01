;~ ShellExecuteWait('cmd.exe',' /K schtasks /create /TN Upgrade_NOD32 /SC ONLOGON /TR "C:\Program Files\ESET\ESET NOD32 Antivirus\x86\NOD Reset Upgrade.exe"')
;~ ShellExecuteWait('cmd.exe'," /K schtasks /create /TN "NOD Reset Upgrade" /RL HIGHEST /SC ONLOGON /TR "'C:\Program Files\ESET\ESET NOD32 Antivirus\x86\NOD Reset Upgrade.exe'")
ShellExecuteWait('cmd.exe',' /K schtasks /create /TN "NOD Reset Upgrade" /RL HIGHEST /SC ONLOGON /TR "'&"'"&'C:\Program Files\ESET\ESET NOD32 Antivirus\x86\NOD Reset Upgrade.exe'&"'")

;~ MsgBox(0,'','schtasks /create /TN "NOD Reset Upgrade" /RL HIGHEST /SC ONLOGON /TR "'&"'"&'C:\Program Files\ESET\ESET NOD32 Antivirus\x86\NOD Reset Upgrade.exe'&"'")





;~ schtasks /create /TN "NOD Reset Upgrade" /RL HIGHEST /SC ONLOGON /TR "'C:\Program Files\ESET\ESET NOD32 Antivirus\x86\NOD Reset Upgrade.exe'
