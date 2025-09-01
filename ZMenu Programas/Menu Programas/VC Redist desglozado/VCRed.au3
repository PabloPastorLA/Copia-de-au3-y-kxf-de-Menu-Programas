if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf

$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. VC Redist',160,80,0,110)
;~ if FileExists("VC_RedistInstaller.exe") then MsgBox(0,'','asd1')

If FileExists("VC_RedistInstaller.exe") and FileExists('vcredist_x86') then;AND not FileExists (@ProgramFilesDir & "\Ares\Ares.exe")  Then
	$1=FileCopy("VC_RedistInstaller.exe",@WindowsDir,9)
	While not FileExists (@WindowsDir & "\VC_RedistInstaller.exe")
		Sleep(300)
	WEnd
	ShellExecute(@WindowsDir & "\VC_RedistInstaller.exe",' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-')

	ProcessWait('VC_RedistInstaller.exe')
	While ProcessExists ("VC_RedistInstaller.exe")
		if WinExists('Microsoft Visua','A later version of Microsoft Visual') Then
			ControlClick('Microsoft Visua','OK','Button1')
		EndIf
		sleep(500)
	WEnd
	while FileExists (@WindowsDir & "\VC_RedistInstaller.exe")
		FileDelete (@WindowsDir & "\VC_RedistInstaller.exe")
	WEnd




;~ dirc
	$1=dirCopy("vcredist_x86",@WindowsDir & '\vcredist_x86',1)
;~ 	MsgBox(0,'',$1)
	While not FileExists (@WindowsDir & "\vcredist_x86")
		Sleep(300)
	WEnd
;~ 	ShellExecute(@WindowsDir & "\vcredist\",' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-')
;~ 	ShellExecute(@WindowsDir & "\vcredist\",' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-')
	ShellExecuteWait('msiexec.exe',' /i "'&@WindowsDir & '\vcredist_x86\vc_red.msi" /qb')
;~ MsgBox(0,'','1')
;~ ProcessWait('vcredist_x86.exe')
;~ MsgBox(0,'','2')
;~ 	While ProcessExists ("vcredist_x86.exe")
;~ 		if WinExists('Microsoft Visua','A later version of Microsoft Visual') Then
;~ 			ControlClick('Microsoft Visua','OK','Button1')
;~ 		EndIf
;~ 		sleep(500)
;~ 		MsgBox(0,'','3')
;~ 	WEnd

;~ 		MsgBox(0,'','4')


	while FileExists (@WindowsDir & '\vcredist_x86')
		DirRemove (@WindowsDir & '\vcredist_x86',1)
	WEnd

;~ 		MsgBox(0,'','5')


	FileWrite(@DesktopDir & "\Bien Instalado.txt","VC Redistributable"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","VC Redistributable"&@CRLF)
EndIf

