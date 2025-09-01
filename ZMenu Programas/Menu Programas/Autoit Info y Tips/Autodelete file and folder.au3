; Tested & no #include needed
 MsgBox(0, "", @ScriptFullPath,10)
 MsgBox(0, "", @ScriptDir,10)
 ;ShellExecute(@ComSpec, ' /c timeout 3 & del "' & @ScriptFullPath & '"')

 exit

@ScriptFullPath
@ScriptDir
@ScriptName
