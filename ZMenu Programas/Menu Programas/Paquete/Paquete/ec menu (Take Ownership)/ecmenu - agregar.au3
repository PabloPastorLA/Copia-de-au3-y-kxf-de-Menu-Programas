#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****




;#AutoIt3Wrapper_UseX64=y




#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. ECMenu',160,80,0,110)


Global $ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)

;If FileExists("EcMenu.exe") AND FileExists("EcMenu_x64.exe") then;AND not FileExists ($ProgramFilesDir & "\ECMenu\EcMenu.exe") AND not FileExists ($ProgramFilesDir & " (x86)\ECMenu\EcMenu_x64.exe")  Then
;	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	ECMenu"&@CRLF)

	if @OSArch='x86' then
		FileCopy("EcMenu.exe",$ProgramFilesDir & "\Easy Context Menu\EcMenu.exe",9)
		DirCopy('Files',$ProgramFilesDir & "\Easy Context Menu\Files\",1)
		FileCopy("TomarControl.exe",$ProgramFilesDir & "\Easy Context Menu\TomarControl.exe",9)
		FileCopy("TomarControlCorrerLista.exe",$ProgramFilesDir & "\Easy Context Menu\TomarControlCorrerLista.exe",9)
		FileCopy("SUCCESS.WAV",$ProgramFilesDir & "\Easy Context Menu\SUCCESS.WAV",9)

	ElseIf @OSArch<>'x86' then
		FileCopy("EcMenu_x64.exe",$ProgramFilesDir & "\Easy Context Menu\EcMenu.exe",9)
		DirCopy('Files',$ProgramFilesDir & "\Easy Context Menu\Files\",1)
		FileCopy("TomarControl.exe",$ProgramFilesDir & "\Easy Context Menu\TomarControl.exe",9)
		FileCopy("TomarControlCorrerLista.exe",$ProgramFilesDir & "\Easy Context Menu\TomarControlCorrerLista.exe",9)
		FileCopy("SUCCESS.WAV",$ProgramFilesDir & "\Easy Context Menu\SUCCESS.WAV",9)

	Else
		MsgBox(0,'','error ecmenu cerrando')
		Exit
	EndIf


	RegWrite('HKEY_CLASSES_ROOT\*\shell\Z001AAL','MUIVerb','REG_SZ','Tomar Control')
	RegWrite('HKEY_CLASSES_ROOT\*\shell\Z001AAL','Icon','REG_EXPAND_SZ','%ProgramFiles%\Easy Context Menu\EcMenu.exe,31')
	RegWrite('HKEY_CLASSES_ROOT\*\shell\Z001AAL\command','','REG_EXPAND_SZ','"%ProgramFiles%\Easy Context Menu\TomarControl.exe" /Admin /takeown "%1"')

	RegWrite('HKEY_CLASSES_ROOT\Directory\shell\Z002AAL','MUIVerb','REG_SZ','Tomar Control')
	RegWrite('HKEY_CLASSES_ROOT\Directory\shell\Z002AAL','Icon','REG_EXPAND_SZ','%ProgramFiles%\Easy Context Menu\EcMenu.exe,31')
	RegWrite('HKEY_CLASSES_ROOT\Directory\shell\Z002AAL\command','','REG_EXPAND_SZ','"%ProgramFiles%\Easy Context Menu\TomarControl.exe" /Admin /takeown "%1"')

	RegWrite('HKEY_CLASSES_ROOT\Drive\shell\Z002AAL','MUIVerb','REG_SZ','Tomar Control')
	RegWrite('HKEY_CLASSES_ROOT\Drive\shell\Z002AAL','Icon','REG_EXPAND_SZ','%ProgramFiles%\Easy Context Menu\EcMenu.exe,31')
	RegWrite('HKEY_CLASSES_ROOT\Drive\shell\Z002AAL\command','','REG_EXPAND_SZ','"%ProgramFiles%\Easy Context Menu\TomarControl.exe" /Admin /takeown "%1"')

	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\*\shell\Z001AAL','MUIVerb','REG_SZ','Tomar Control')
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\*\shell\Z001AAL','Icon','REG_EXPAND_SZ','%ProgramFiles%\Easy Context Menu\EcMenu.exe,31')
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\*\shell\Z001AAL\command','','REG_EXPAND_SZ','"%ProgramFiles%\Easy Context Menu\TomarControl.exe" /Admin /takeown "%1"')

	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\shell\Z002AAL','MUIVerb','REG_SZ','Tomar Control')
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\shell\Z002AAL','Icon','REG_EXPAND_SZ','%ProgramFiles%\Easy Context Menu\EcMenu.exe,31')
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\shell\Z002AAL\command','','REG_EXPAND_SZ','"%ProgramFiles%\Easy Context Menu\TomarControl.exe" /Admin /takeown "%1"')


;	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	ECMenu"&@CRLF)
;else
;	FileWrite(@DesktopDir & "\Mal Instalado.txt","ECMenu"&@CRLF)
;EndIf
