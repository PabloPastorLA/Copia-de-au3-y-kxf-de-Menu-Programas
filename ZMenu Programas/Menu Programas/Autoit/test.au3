; --- Requerir admin al ejecutar

RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers','C:\Program Files (x86)\AutoIt3\AutoIt3.exe',"REG_SZ",'RUNASADMIN')
if @osarch =  "IA64" or @osarch = "X64" then
	RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers','C:\Program Files (x86)\AutoIt3\AutoIt3_x64.exe',"REG_SZ",'RUNASADMIN')
EndIf
RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers','C:\Program Files (x86)\AutoIt3\SciTE\SciTE.exe',"REG_SZ",'RUNASADMIN')

RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers','C:\Program Files\AutoIt3\AutoIt3.exe',"REG_SZ",'RUNASADMIN')
if @osarch =  "IA64" or @osarch = "X64" then
	RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers','C:\Program Files\AutoIt3\AutoIt3_x64.exe',"REG_SZ",'RUNASADMIN')
EndIf
RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers','C:\Program Files\AutoIt3\SciTE\SciTE.exe',"REG_SZ",'RUNASADMIN')

;-------------
