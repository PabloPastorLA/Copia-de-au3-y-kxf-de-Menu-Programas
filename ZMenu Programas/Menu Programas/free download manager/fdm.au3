
If FileExists("fdminst.exe") AND not FileExists (@ProgramFilesDir & "\Free Download Manager\fdm.exe") AND not FileExists (@ProgramFilesDir & " (x86)\Free Download Manager\fdm.exe") Then
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. FDM',160,80,0,110)

	ShellExecuteWait('fdminst.exe',' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-')


	if FileExists (@ProgramFilesDir & '\Software Informer\unins000.exe') Then
		ShellExecuteWait(@ProgramFilesDir & '\Software Informer\unins000.exe',' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-')
	ElseIf FileExists (@ProgramFilesDir & ' (x86)\Software Informer\unins000.exe') Then
		ShellExecuteWait(@ProgramFilesDir & ' (x86)\Software Informer\unins000.exe',' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-')
	EndIf


	WinWait('Uninstall','Would you like to keep your settings')
	Winactivate('Uninstall','Would you like to keep your settings')
	Winwaitactive('Uninstall','Would you like to keep your settings')
	ControlClick('Uninstall','&No','Button2')
	WinWaitClose('Uninstall','Would you like to keep your settings')
; des tips
RegWrite('HKEY_CURRENT_USER\Software\FreeDownloadManager.ORG\Free Download Manager\Settings\SmallTips','Show','REG_DWORD',0)
RegWrite('HKEY_CURRENT_USER\Software\FreeDownloadManager.ORG\Free Download Manager\Settings\View','ShowFW','REG_DWORD',0)
RegWrite('HKEY_CURRENT_USER\Software\FreeDownloadManager.ORG\Free Download Manager\Settings\View','ShowFIW','REG_DWORD',0)
RegWrite('HKEY_CURRENT_USER\Software\FreeDownloadManager.ORG\Free Download Manager\Settings\View','TUMChanged','REG_DWORD',0)
RegWrite('HKEY_CURRENT_USER\Software\FreeDownloadManager.ORG\Free Download Manager\Settings\Update','AutoUpdateType','REG_DWORD',2)
RegWrite('HKEY_CURRENT_USER\Software\FreeDownloadManager.ORG\Free Download Manager\Settings\Network','UseZipPreview','REG_DWORD',2)
RegWrite('HKEY_CURRENT_USER\Software\FreeDownloadManager.ORG\Free Download Manager\Settings\View','DldDlg_Use','REG_DWORD',0)
RegWrite('HKEY_CURRENT_USER\Software\FreeDownloadManager.ORG\Free Download Manager\Settings\View','DldDlg_DontAskOnHide','REG_DWORD',1)
RegWrite('HKEY_USERS\S-1-5-21-2025429265-507921405-1177238915-1003\Software\FreeDownloadManager.ORG\Free Download Manager\Settings\New Download','AutoStart','REG_DWORD',1)
RegWrite('HKEY_USERS\S-1-5-21-2025429265-507921405-1177238915-1003\Software\FreeDownloadManager.ORG\Free Download Manager\Settings\New Download','UseZIPPreview','REG_DWORD',0)

RegDelete('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run','Software Informer')
RegWrite('HKEY_CURRENT_USER\Software\FreeDownloadManager.ORG\Free Download Manager\Settings\Network','Agent','REG_SZ','Mozilla/4.0 (compatible; MSIE 5.0; Windows 98)')


if FileExists (@ProgramFilesDir & " (x86)\Free Download Manager\fdm.exe") Then
	ShellExecute (@ProgramFilesDir & " (x86)\Free Download Manager\fdm.exe")
ElseIf FileExists (@ProgramFilesDir & "\Free Download Manager\fdm.exe") Then
	ShellExecute (@ProgramFilesDir & "\Free Download Manager\fdm.exe")
Else
	MsgBox(0,'','No encuentro ejecutable fdm')
EndIf
ProcessWait('fdm.exe')
$e=0
while not WinExists ('Asistente de optimización del uso de red') And $e < 5
	sleep(1000)
$e = $e + 1
WEnd

if WinExists('Asistente de optimización del uso de red') Then
	while WinExists ('Asistente de optimización del uso de red')
		ControlClick('Asistente de optimización del uso de red','Terminar','Button1')
	WEnd
	WinWaitClose ('Asistente de optimización del uso de red')
EndIf
ProcessClose('fdm.exe')
ProcessWaitClose('fdm.exe')

if FileExists (@ProgramFilesDir & " (x86)\Free Download Manager\fdm.exe") Then
	ShellExecute (@ProgramFilesDir & " (x86)\Free Download Manager\fdm.exe")
Elseif FileExists (@ProgramFilesDir & "\Free Download Manager\fdm.exe") Then
	ShellExecute (@ProgramFilesDir & "\Free Download Manager\fdm.exe")
Else

	MsgBox(0,'','No encuentro ejecutable fdm')
EndIf

;FileWrite(@DesktopDir & "\Bien Instalado.txt","Free Download Manager"&@CRLF)
else
;FileWrite(@DesktopDir & "\Mal Instalado.txt","Free Download Manager"&@CRLF)
EndIf