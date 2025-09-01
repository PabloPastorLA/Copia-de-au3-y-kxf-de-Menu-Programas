$a=RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000102\Profiles\@My profile','BuildRescan','REG_DWORD',0)
msgbox(0, "Error", @error)
MsgBox(0,'',$a)
$a=RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Profiles\@My profile','SampleEnable','REG_DWORD',0)
msgbox(0, "Error", @error)
MsgBox(0,'',$a)
$a=RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Profiles\@My profile','StatisticsEnabled','REG_DWORD',0)
msgbox(0, "Error", @error)
MsgBox(0,'',$a)


$a=RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\asd','asd','REG_DWORD',0)
msgbox(0, "Error", @error)
MsgBox(0,'',$a)