#RequireAdmin
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'DesInst. Teracopy',160,80,0,110)

		$rest=0


	if FileExists (@ProgramFilesDir & "\Teracopy\unins000.exe") then
		ShellExecute(@ProgramFilesDir & "\Teracopy\unins000.exe"," /S")
		WinWait('TeraCopy Uninstall')
		Do
			if WinExists('TeraCopy Uninstall','Are you sure you want') then controlclick('TeraCopy Uninstall','','Button1')
			if WinExists('TeraCopy Uninstall','TeraCopy was successfully') then controlclick('TeraCopy Uninstall','','Button1')
			if WinExists('TeraCopy Uninstall','Would you like to restart now?') then
				controlclick('TeraCopy Uninstall','','Button2')
				$rest=1
			EndIf
			Sleep(300)
		Until not WinExists('TeraCopy Uninstall')
	EndIf

	if FileExists (@ProgramFilesDir & "\Teracopy") then DirRemove(@ProgramFilesDir & "\Teracopy",1)
	RegDelete('HKLM\Software\Code Sector\TeraCopy')
	RegDelete('HKCU\Software\Code Sector\TeraCopy')
	DirRemove(@AppDataDir&'\TeraCopy\license',1)

if $rest=1 then MsgBox(0,'Desinstalar Teracopy','Teracopy necesita reiniciar para poder reinstalarse')



