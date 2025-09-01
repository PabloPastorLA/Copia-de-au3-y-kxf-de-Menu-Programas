#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****


$ventana='C:\Windows\system32\cmd.exe - runas  /user:Usuario "calc"'
$pass='123'

ProcessWait('cmd.exe')
WinWait($ventana)
WinActivate($ventana)
WinWaitActive($ventana)

Send($pass&'{enter}')

