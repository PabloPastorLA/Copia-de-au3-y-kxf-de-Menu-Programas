SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Skype',160,80,0,110)

If FileExists ('SkypeSetup.msi') and not FileExists (@ProgramFilesDir & "\Skype\Phone\Skype.exe") and not FileExists (@ProgramFilesDir & " (x86)\Skype\Phone\Skype.exe") Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Skype"&@CRLF)
	RegWrite('HKEY_LOCAL_MACHINE\Software\Policies\Skype\Phone','DisableVersionCheck','REG_DWORD',1)
;~ 	ShellExecuteWait("skype.bat")
	ShellExecuteWait("msiexec",' /i "SkypeSetup.msi" TRANSFORMS=TABLA.MST /QN ')


;~ msiexec /i SkypeSetup.msi TRANSFORMS=TABLA.MST /QN


	RegWrite('HKEY_LOCAL_MACHINE\Software\Policies\Skype\Phone','DisableVersionCheck','REG_DWORD',1)


	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SkypeUpdate", "Start", "REG_DWORD", 4)
	RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "Skype")

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Skype"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Skype"&@CRLF)
EndIf

