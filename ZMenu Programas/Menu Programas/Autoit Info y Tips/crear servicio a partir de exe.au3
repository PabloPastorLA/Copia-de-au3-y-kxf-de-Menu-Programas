#RequireAdmin
ShellExecuteWait('cmd.exe',' /C sc.exe create "NOD Reset Upgrade" binPath= ""C:\Program Files\ESET\ESET NOD32 Antivirus\x86\NOD Reset Upgrade.exe""')


;~ sc.exe delete "NOD Reset Upgrade"
;~ sc.exe create "NOD Reset Upgrade" binPath= ""C:\Program Files\ESET\ESET NOD32 Antivirus\x86\NOD Reset Upgrade.exe""