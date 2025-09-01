SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Net F 3.5',160,80,0,110)

If FileExists("dotnetfx35.exe") AND not fileExists (@WindowsDir & "\Microsoft.NET\Framework\v3.5")  Then

;~ 	run('NET3-5.bat',@ScriptDir)
;~ 	if @error<>0 then MsgBox(0,'','')
;~ 	ShellExecuteWait('NET35.bat',"",@ScriptDir,'',@SW_HIDE)

;~ 	MsgBox(0,'','dotnetfx35.exe')
;~ 	if FileExists('dotnetfx35.exe') then MsgBox(0,'','')
 	ShellExecuteWait('dotnetfx35.exe',' /q /norestart',@ScriptDir)

	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\idsvc", "Start", "REG_DWORD", 4)

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Net Framework 3.5"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Net Framework 3.5"&@CRLF)
EndIf


