ShellExecuteWait('msiexec.exe',' /x {AC052048-9828-45E3-872B-04CE30A3B58B} /qn')
FileDelete(@DesktopDir&'\Gamepad.lnk')
MsgBox(0,'Desinstal. completa','Listo!',1)