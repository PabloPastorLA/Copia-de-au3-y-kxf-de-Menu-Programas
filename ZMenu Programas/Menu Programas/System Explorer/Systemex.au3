if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
#include <File.au3>

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. System Ex',160,80,0,110)

If FileExists("SystemExplorerSetup.exe") AND not FileExists (@ProgramFilesDir & "\System Explorer\SystemExplorer.exe") AND not FileExists (@ProgramFilesDir & " (x86)\System Explorer\SystemExplorer.exe") Then

	if FileExists(@ProgramFilesDir & " (x86)\Google\Chrome\Application\chrome.exe") or FileExists(@ProgramFilesDir & ' (x86)\Mozilla Firefox\firefox.exe') Then
		if FileExists(@ProgramFilesDir & " (x86)\Google\Chrome\Application\chrome.exe") then FileMove(@ProgramFilesDir & " (x86)\Google\Chrome\Application\chrome.exe",@ProgramFilesDir & " (x86)\Google\Chrome\Application\chromea.exe",9)
		if FileExists(@ProgramFilesDir & " (x86)\Mozilla Firefox\firefox.exe") then FileMove(@ProgramFilesDir & " (x86)\Mozilla Firefox\firefox.exe",@ProgramFilesDir & " (x86)\Mozilla Firefox\firefoxa.exe",9)
	EndIf



	ShellExecuteWait("SystemExplorerSetup.exe",' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-')

	RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run','SystemExplorerAutoStart')

	if FileExists(@AppDataCommonDir & '\SystemExplorer\config.ini') Then
		for $i=0 to 300 step 1
			if FileReadLine(@AppDataCommonDir & '\SystemExplorer\config.ini',$i) = 'ShowTray=1' Then _FileWriteToLine(@AppDataCommonDir & '\SystemExplorer\config.ini',$i,'ShowTray=0',True)
			if FileReadLine(@AppDataCommonDir & '\SystemExplorer\config.ini',$i) = 'ShowInfoPanel=1' Then _FileWriteToLine(@AppDataCommonDir & '\SystemExplorer\config.ini',$i,'ShowInfoPanel=0',True)
			if FileReadLine(@AppDataCommonDir & '\SystemExplorer\config.ini',$i) = 'CheckNewVersion=1' Then _FileWriteToLine(@AppDataCommonDir & '\SystemExplorer\config.ini',$i,'CheckNewVersion=0',True)
			if StringLeft(FileReadLine(@AppDataCommonDir & '\SystemExplorer\config.ini',$i),6)='[user_' Then _FileWriteToLine(@AppDataCommonDir & '\SystemExplorer\config.ini',$i+1,'firstRun=0',False)
			if StringLeft(FileReadLine(@AppDataCommonDir & '\SystemExplorer\config.ini',$i),6)='[user_' Then _FileWriteToLine(@AppDataCommonDir & '\SystemExplorer\config.ini',$i+1,'initialSecurityCheck=1',False)
		Next
		Else
		MsgBox(0,'','No encontre config.ini en systemexplorer')
	EndIf


	if FileExists(@ProgramFilesDir & " (x86)\Google\Chrome\Application\chromea.exe") or FileExists(@ProgramFilesDir & ' (x86)\Mozilla Firefox\firefoxa.exe') Then
		if FileExists(@ProgramFilesDir & " (x86)\Google\Chrome\Application\chromea.exe") then FileMove(@ProgramFilesDir & " (x86)\Google\Chrome\Application\chromea.exe",@ProgramFilesDir & " (x86)\Google\Chrome\Application\chrome.exe",9)
		if FileExists(@ProgramFilesDir & " (x86)\Mozilla Firefox\firefoxa.exe") then FileMove(@ProgramFilesDir & " (x86)\Mozilla Firefox\firefoxa.exe",@ProgramFilesDir & " (x86)\Mozilla Firefox\firefox.exe",9)
	EndIf


;~ 	FileWrite(@DesktopDir & "\Bien Instalado.txt","Ares"&@CRLF)
;~ else
;~ 	FileWrite(@DesktopDir & "\Mal Instalado.txt","Ares"&@CRLF)
EndIf


