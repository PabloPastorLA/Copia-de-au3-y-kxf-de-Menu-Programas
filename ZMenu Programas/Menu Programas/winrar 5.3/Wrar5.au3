if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. WinRAR 5',160,80,0,110)

if @OSArch = "X86" Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Winrar 5"&@CRLF)
	If FileExists("wrar531es.exe") AND not FileExists (@ProgramFilesDir & "\WinRAR\WinRAR.exe") AND not FileExists (@ProgramFilesDir & " (x86)\WinRAR\WinRAR.exe") Then
		ShellExecuteWait("wrar531es.exe"," /S")
		registrar()
	else
		FileWrite(@DesktopDir & "\Mal Instalado.txt","WinRAR"&@CRLF)
		Exit
	EndIf

Else
	If FileExists("winrar-x64-531es.exe") AND not FileExists (@ProgramFilesDir & "\WinRAR\WinRAR.exe") AND not FileExists (@ProgramFilesDir & " (x86)\WinRAR\WinRAR.exe") Then
		FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Winrar 5"&@CRLF)
		ShellExecuteWait("winrar-x64-531es.exe"," /S")
		registrar()
	Else
		FileWrite(@DesktopDir & "\Mal Instalado.txt","WinRAR"&@CRLF)
		Exit
	EndIf
EndIf

Func registrar()
;~ 	If FileExists (@ProgramFilesDir & "\WinRAR\WinRAR.exe") Then
;~

;~ If FileExists("winrar-x64-531es.exe") AND not FileExists (@ProgramFilesDir & "\WinRAR\WinRAR.exe") AND not FileExists (@ProgramFilesDir & " (x86)\WinRAR\WinRAR.exe") Then


	RegWrite("HKEY_CURRENT_USER\Software\WinRAR\Setup\MenuItems","ExtrTo","REG_DWORD",0)
	RegWrite("HKEY_CURRENT_USER\Software\WinRAR\Setup\MenuItems","ExtrHere","REG_DWORD",1)
	RegWrite("HKEY_CURRENT_USER\Software\WinRAR\Setup\MenuItems","Extr","REG_DWORD",1)
	RegWrite("HKEY_CURRENT_USER\Software\WinRAR\Setup\MenuItems","ExtrSep","REG_DWORD",1)

	RegWrite("HKEY_CURRENT_USER\Software\WinRAR\Setup\MenuItems","OpenSFX","REG_DWORD",1)
	RegWrite("HKEY_CURRENT_USER\Software\WinRAR\Setup\MenuItems","AddTo","REG_DWORD",1)
	RegWrite("HKEY_CURRENT_USER\Software\WinRAR\Setup\MenuItems","AddArc","REG_DWORD",0)
	RegWrite("HKEY_CURRENT_USER\Software\WinRAR\Setup\MenuItems","EmailArc","REG_DWORD",0)
	RegWrite("HKEY_CURRENT_USER\Software\WinRAR\Setup\MenuItems","EmailOpt","REG_DWORD",0)
	RegWrite("HKEY_CURRENT_USER\Software\WinRAR\Setup\MenuItems","Test","REG_DWORD",1)
	RegWrite("HKEY_CURRENT_USER\Software\WinRAR\Setup\MenuItems","Convert","REG_DWORD",0)

	RegWrite("HKEY_CURRENT_USER\Software\WinRAR\Setup\MenuItems","SFXLocal","REG_DWORD",1)
	RegWrite("HKEY_CURRENT_USER\Software\WinRAR\Setup\MenuItems","SFXNetwork","REG_DWORD",1)
	RegWrite("HKEY_CURRENT_USER\Software\WinRAR\Setup\MenuItems","SFXOther","REG_DWORD",1)

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Winrar 5"&@CRLF)
EndFunc

