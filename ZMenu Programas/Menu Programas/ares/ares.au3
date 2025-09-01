#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Ares',160,80,0,110)

If FileExists("setup.exe") AND not FileExists (@ProgramFilesDir & "\Ares\Ares.exe") AND not FileExists (@ProgramFilesDir & " (x86)\Ares\Ares.exe")  Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Ares"&@CRLF)

	ShellExecuteWait("setup.exe"," /S")

	ProcessWait('Ares.exe')
	While ProcessExists('Ares.exe')
		ProcessClose('Ares.exe')
	WEnd

	RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "ares")
	RegDelete("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "ares")
	RegWrite("HKEY_CURRENT_USER\Software\Ares", "General.AutoStartUp",'REG_DWORD',0)


	if FileExists (@ProgramFilesDir & "\Ares\Ares.exe") Then
		ShellExecuteWait('xcopy',' "skins" "' & @ProgramFilesDir & '\Ares\data\GUI" /I /C /K /Y /E')
		sleep(2000)
		ShellExecute(@ProgramFilesDir & "\Ares\Ares.exe")
	ElseIf FileExists (@ProgramFilesDir & " (x86)\Ares\Ares.exe") Then
		ShellExecuteWait('xcopy',' "skins" "' & @ProgramFilesDir & ' (x86)\Ares\data\GUI" /I /C /K /Y /E')
		sleep(2000)
		ShellExecute(@ProgramFilesDir & " (x86)\Ares\Ares.exe")
	Else
		MsgBox(0,'','Fallo copia de skins, no encontre la carpeta del ares')
	EndIf
	$salida=0
	While $salida<6 and not WinExists('Alerta de seguridad de Windows','Ares p2p for windows')
		sleep(1000)
		$salida=$salida+1
	WEnd

	if WinExists('Alerta de seguridad de Windows','Ares p2p for windows') Then
		While WinExists('Alerta de seguridad de Windows','Ares p2p for windows')
			WinActivate('Alerta de seguridad de Windows','Ares p2p for windows')
			ControlClick('Alerta de seguridad de Windows','&Permitir acceso','Button6')
			sleep(1000)
		WEnd
	EndIf

	While ProcessExists('ares.exe')
		ProcessClose('ares.exe')
	WEnd
	borrarvirus()
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Ares"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Ares"&@CRLF)
EndIf


func borrarvirus()
	$aFileList = _FileListToArray(@TempDir,'*',(2))
	for $i=1 to UBound($aFileList)-1 step 1
		if FileExists(@TempDir&'\'&$aFileList[$i]&'\btZmwEKmZ.dll') then FileDelete(@TempDir&'\'&$aFileList[$i]&'\btZmwEKmZ.dll')
		if FileExists(@TempDir&'\'&$aFileList[$i]&'\btZmwEKmZ.dll') then MsgBox(0,'Ares','Ares: Virus sin borrar')
	Next
EndFunc
