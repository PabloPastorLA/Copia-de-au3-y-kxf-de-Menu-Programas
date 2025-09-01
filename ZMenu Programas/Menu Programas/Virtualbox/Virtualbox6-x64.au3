if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Virtualbox',160,80,0,110)


global $ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)

;~ extpack()

If FileExists("VirtualBox-6.1.12-139181-Win.exe") AND not FileExists ($ProgramFilesDir & "\Oracle\VirtualBox\VirtualBox.exe") AND not FileExists ($ProgramFilesDir & " (x86)\Oracle\VirtualBox\VirtualBox.exe")  Then
	ShellExecuteWait("VirtualBox-6.1.12-139181-Win.exe"," --silent")

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

	ShellExecuteWait('cmd',' /c "'&$file&'" extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-6.1.12.vbox-extpack --accept-license=56be48f923303c8cababb0bb4c478284b688ed23f16d775d729b89a2e8e5f9eb')
;~ 	ShellExecuteWait('cmd',' /k "'&$file&'" extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-6.1.12.vbox-extpack --accept-license=56be48f923303c8cababb0bb4c478284b688ed23f16d775d729b89a2e8e5f9eb')

EndFunc

;~ para saber la licencia cambiar /c por /k en cmd

;~ --accept-license=56be48f923303c8cababb0bb4c478284b688ed23f16d775d729b89a2e8e5f9eb
