;ShellExecute('cmd','/K rar.exe x "'&@ScriptDir&'\Repositorio ME.rar" "'&@HomeDrive&'\Programadores\ME"')
ShellExecuteWait('cmd','/K rar.exe x -y "'&@ScriptDir&'\Repositorio ME.rar" "'&@HomeDrive&'\Programadores\ME"')

;MsgBox(0,'','/K rar.exe x "'&@ScriptDir&'\Repositorio ME.rar" "'&@HomeDrive&'\Programadores\ME"')
