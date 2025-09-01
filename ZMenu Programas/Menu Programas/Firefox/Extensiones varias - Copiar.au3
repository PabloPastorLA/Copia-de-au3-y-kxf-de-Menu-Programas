;MsgBox(0,'','asdasd')
;ShellExecuteWait('xcopy',' "Extensiones varias\*" "c:\users\usuario\desktop"')
ShellExecuteWait('xcopy',' "Extensiones varias\*" "'&@DesktopDir&'" /Y')

