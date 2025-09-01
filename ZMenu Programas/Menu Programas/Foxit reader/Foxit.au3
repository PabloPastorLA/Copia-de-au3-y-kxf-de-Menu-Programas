if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Foxit',160,80,0,110)

If FileExists("FoxitReader708.1216_prom_L10N_Setup.exe") AND not FileExists (@ProgramFilesDir & "\Foxit Software\Foxit Reader\FoxitReader.exe")  AND not FileExists (@ProgramFilesDir & " (x86)\Foxit Software\Foxit Reader\FoxitReader.exe")  Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Foxit Reader"&@CRLF)

	RegWrite("HKEY_CURRENT_USER\Software\Foxit Software\Foxit Reader 7.0\plugins\Updater", "UpdateMode", "REG_SZ", 0)
	RegWrite("HKEY_CURRENT_USER\Software\Foxit Software\Foxit Reader 7.0\Preferences\Registration", "bShowRegisterDlg", "REG_SZ", 0)


	ShellExecuteWait("FoxitReader708.1216_prom_L10N_Setup.exe",' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-')
	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FoxitCloudUpdateService", "Start", "REG_DWORD", 4)


	while ProcessExists('FoxitReaderUpdater.exe') or FileExists(@AppDataDir & '\Foxit Software\Addon\Foxit Reader\FoxitReaderUpdater.exe')
		ProcessClose('FoxitReaderUpdater.exe')
		FileDelete(@AppDataDir & '\Foxit Software\Addon\Foxit Reader\FoxitReaderUpdater.exe')
	WEnd

	$defnav1=''
	$defnav2=''
	;MsgBox(0,'','ahi va')

	cambiar_navegador()




	if FileExists (@ProgramFilesDir & "\Foxit Software\Foxit Reader\Foxit Cloud\unins000.exe") Then
		ShellExecute (@ProgramFilesDir & "\Foxit Software\Foxit Reader\Foxit Cloud\unins000.exe")
		seguir()
	Elseif FileExists (@ProgramFilesDir & " (x86)\Foxit Software\Foxit Reader\Foxit Cloud\unins000.exe") Then
		ShellExecute (@ProgramFilesDir & " (x86)\Foxit Software\Foxit Reader\Foxit Cloud\unins000.exe")
		seguir()
	Else
		FileWrite(@DesktopDir & "\Mal Instalado.txt","Foxit Reader - Foxit Cloud no desinstalado"&@CRLF)
	EndIf


	volver_navegador()
	if @OSVersion='WIN_10' then Send('{esc}')

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Foxit Reader"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Foxit Reader"&@CRLF)
EndIf


func seguir()
	WinWait('Desinstalar - Foxit Cloud')
	ControlClick('Desinstalar - Foxit Cloud','','Button1')
	WinWait('Desinstalar - Foxit Cloud','La desinstalación de Foxit Cloud ha sido completada.')
	While WinExists ('Desinstalar - Foxit Cloud','La desinstalación de Foxit Cloud ha sido completada.')
		ControlClick('Desinstalar - Foxit Cloud','','Button1')
		Sleep(1000)
	WEnd

	WinWaitClose('Desinstalar - Foxit Cloud','La desinstalación de Foxit Cloud ha sido completada.')

Sleep(500)
Do
	ProcessClose('iexplore.exe')
until not ProcessExists('iexplore.exe')


EndFunc


func cambiar_navegador()
	;	-	Navegador default	-	-------------------------------------------------------------------------------------------------------
	RegWrite('HKEY_CLASSES_ROOT\MIO\shell\open\command','','REG_SZ','');																---
	$defnav1=RegRead('HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice','Progid');		---
	$defnav2=RegRead('HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice','Progid');		---
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice','Progid','REG_SZ','MIO');---
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice','Progid','REG_SZ','MIO');--
	;	-	Navegador default	-	-------------------------------------------------------------------------------------------------------
EndFunc

func volver_navegador()
	;	-	Navegador default	-	----------------------------------------------------------------------------------------------------------
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice','Progid','REG_SZ',$defnav1);---
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice','Progid','REG_SZ',$defnav2);--
	;	-	Navegador default	-	----------------------------------------------------------------------------------------------------------
EndFunc