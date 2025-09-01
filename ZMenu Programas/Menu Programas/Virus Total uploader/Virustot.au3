if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. VirusTot',160,80,0,110)

If FileExists("vtuploader2.2.exe") AND not FileExists (@ProgramFilesDir & "\VirusTotalUploader2\VirusTotalUploader2.2.exe") AND not FileExists (@ProgramFilesDir & " (x86)\VirusTotalUploader2\VirusTotalUploader2.2.exe")  Then
	ShellExecuteWait("vtuploader2.2.exe"," /S")

	FileDelete(@DesktopDir & '\VirusTotal Uploader 2.2.lnk')
;~ 	FileWrite(@DesktopDir & "\Bien Instalado.txt","Ares"&@CRLF)
;~ else
;~ 	FileWrite(@DesktopDir & "\Mal Instalado.txt","Ares"&@CRLF)
EndIf


