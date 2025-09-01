if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Virtualbox',160,80,0,110)


global $ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)

;~ extpack()

If FileExists("VirtualBox-5.1.12-112440-Win.exe") AND not FileExists ($ProgramFilesDir & "\Oracle\VirtualBox\VirtualBox.exe") AND not FileExists ($ProgramFilesDir & " (x86)\Oracle\VirtualBox\VirtualBox.exe")  Then
	ShellExecuteWait("VirtualBox-5.1.12-112440-Win.exe"," --silent")

extpack()


;~ 	While ProcessExists('ares.exe')
;~ 		ProcessClose('ares.exe')
;~ 	WEnd

;~ 	FileWrite(@DesktopDir & "\Bien Instalado.txt","Ares"&@CRLF)
;~ else
;~ 	FileWrite(@DesktopDir & "\Mal Instalado.txt","Ares"&@CRLF)
EndIf


func extpack()
	if FileExists ($ProgramFilesDir & "\Oracle\VirtualBox\VirtualBox.exe") Then
		$file=($ProgramFilesDir & "\Oracle\VirtualBox\VBoxManage.exe")
	ElseIf FileExists ($ProgramFilesDir & " (x86)\Oracle\VirtualBox\VirtualBox.exe") Then
		$file=($ProgramFilesDir & " (x86)\Oracle\VirtualBox\VBoxManage.exe")
	Else
		MsgBox(0,'Virtualbox','No encontre ejecutable Virtualbox. Cerrando')
		Exit
	EndIf
;~ 	MsgBox(0,'',$file)
	ShellExecuteWait('cmd',' /c "'&$file&'" extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-5.1.14-112924.vbox-extpack')
;	ShellExecuteWait('cmd',' /K '&$file&' extpack install --replace "Oracle_VM_VirtualBox_Extension_Pack-5.1.14-112924.vbox-extpack"')

EndFunc
