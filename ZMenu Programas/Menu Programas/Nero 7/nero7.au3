if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Nero 7',160,80,0,110)

#include <File.au3>

If FileExists("Nero-7.11.10.0c_all_update.exe") And not FileExists (@ProgramFilesDir & "\Nero\Nero 7\Nero StartSmart\NeroStartSmart.exe") AND not FileExists (@ProgramFilesDir & " (x86)\Nero\Nero 7\Nero StartSmart\NeroStartSmart.exe") Then
MsgBox(0,'Nero 7 se reinicia','1 antes de extraer')
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Ahead\Installation\Families\Nero 7\Info','Serial7_1192857362','REG_SZ','4C81-E085-09M3-0000-KK33-CCXE-4K56')
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Ahead\Installation\Families\Nero 7\Info','Serial7_1192857362','REG_SZ','4C81-E085-09M3-0000-KK33-CCXE-4K56')

extraer()
MsgBox(0,'Nero 7 se reinicia','2 antes de modificarconf')


modificarconf()
MsgBox(0,'Nero 7 se reinicia','3 antes de instalar')



ShellExecuteWait(@TempDir&'\NERO1005887\SetupX.exe',' /quiet /norestart')
MsgBox(0,'Nero 7 se reinicia','4 despues de instalar antes de regsvr')

	RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','NeroFilterCheck')
	ShellExecuteWait('regsvr32',' /u /s \"%commonprogramfiles%\\Ahead\\Lib\\MediaLibraryNSE.dll')
MsgBox(0,'Nero 7 se reinicia','5 antes de ejecutar')
	If FileExists (@ProgramFilesDir & '\Nero\Nero 7\Nero StartSmart\NeroStartSmart.exe') Then ShellExecute(@ProgramFilesDir & '\Nero\Nero 7\Nero StartSmart\NeroStartSmart.exe')
	If FileExists (@ProgramFilesDir & ' (x86)\Nero\Nero 7\Nero StartSmart\NeroStartSmart.exe') Then ShellExecute(@ProgramFilesDir & ' (x86)\Nero\Nero 7\Nero StartSmart\NeroStartSmart.exe')
MsgBox(0,'Nero 7 se reinicia','6')
	ProcessWait('NeroStartSmart.exe')
	WinWait('Bienvenido a Nero','El objeto de este contrato')
	WinActivate('Bienvenido a Nero','El objeto de este contrato')
	WinWaitActive('Bienvenido a Nero','El objeto de este contrato')
MsgBox(0,'Nero 7 se reinicia','7')

	while WinExists('Bienvenido a Nero','El objeto de este contrato') and ControlCommand(WinGetHandle('Bienvenido a Nero','El objeto de este contrato'),'Acepto los términos de la condición de licencia','Button6',"IsChecked", "") = 0
		ControlCommand(WinGetHandle('Bienvenido a Nero','El objeto de este contrato'),'Acepto los términos de la condición de licencia','Button6',"Check", "")
	WEnd
MsgBox(0,'Nero 7 se reinicia','8')
	while WinExists('Bienvenido a Nero','El objeto de este contrato') and ControlCommand(WinGetHandle('Bienvenido a Nero','El objeto de este contrato'),'Acepto los términos de la condición de licencia','Button6',"IsChecked", "") = 1
		ControlCommand(WinGetHandle('Bienvenido a Nero','El objeto de este contrato'),'&Aceptar','Button3',"Check", "")
	WEnd
MsgBox(0,'Nero 7 se reinicia','9')

	WinWaitClose('Bienvenido a Nero','El objeto de este contrato')
MsgBox(0,'Nero 7 se reinicia','10')

	while ProcessExists('NeroStartSmart.exe')
		ProcessClose('NeroStartSmart.exe')
	WEnd
MsgBox(0,'Nero 7 se reinicia','11')

;	------------------		X86		-----------------------------------------------------------
	while FileExists(@ProgramFilesDir & "\Archivos comunes\Ahead\Lib\NeroCheck.exe")
		FileDelete(@ProgramFilesDir & "\Archivos comunes\Ahead\Lib\NeroCheck.exe")
	WEnd
	while FileExists(@ProgramFilesDir & "\Archivos comunes\Ahead\Lib\NeroPatentActivation.exe")
		FileDelete(@ProgramFilesDir & "\Archivos comunes\Ahead\Lib\NeroPatentActivation.exe")
	WEnd
;	------------------		X86		-----------------------------------------------------------

;	------------------		X64		-----------------------------------------------------------
	while FileExists(@ProgramFilesDir & " (x86)\Archivos comunes\Ahead\Lib\NeroCheck.exe")
		FileDelete(@ProgramFilesDir & " (x86)\Archivos comunes\Ahead\Lib\NeroCheck.exe")
	WEnd
	while FileExists(@ProgramFilesDir & " (x86)\Archivos comunes\Ahead\Lib\NeroPatentActivation.exe")
		FileDelete(@ProgramFilesDir & " (x86)\Archivos comunes\Ahead\Lib\NeroPatentActivation.exe")
	WEnd
;	------------------		X64		-----------------------------------------------------------

MsgBox(0,'Nero 7 se reinicia','12')


;	------------------		X86		-----------------------------------------------------------
	If @OSArch = 'X86' Then
		RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Ahead\Installation\Settings','AutomaticUpdate','REG_DWORD',0)
		RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','NvCplDaemon')
		RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','NvMediaCenter')
		RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NMIndexingService','Start','REG_DWORD',4)
		RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','BgMonitor_{79662E04-7C6C-4d9f-84C7-88D8A56B10AA}')
	EndIf
;	------------------		X86		-----------------------------------------------------------
;	------------------		X64		-----------------------------------------------------------
	If @OSArch = 'X64' Then
		RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Ahead\Installation\Settings','AutomaticUpdate','REG_DWORD',0)
		RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','NvCplDaemon')
		RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','NvMediaCenter')
		RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NMIndexingService','Start','REG_DWORD',4)
		RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','BgMonitor_{79662E04-7C6C-4d9f-84C7-88D8A56B10AA}')
	EndIf
;	------------------		X64		-----------------------------------------------------------
MsgBox(0,'Nero 7 se reinicia','13')


	ShellExecuteWait('Cmd.exe',' /c regsvr32 /u /s "'&@CommonFilesDir&'\Ahead\Lib\NeroSearch.dll" && regsvr32 /u /s "'&@CommonFilesDir&'\Ahead\Lib\NeroSearchBar.dll" && regsvr32 /u /s "'&@CommonFilesDir&'\Ahead\Lib\NeroSearchTray.dll"')
;~ 	WinActivate('Bienvenido a Nero','El objeto de este contrato')
;~ 	WinWaitActive('Bienvenido a Nero','El objeto de este contrato')
	ProcessClose('NMBgMonitor.exe')
	ProcessClose('NMIndexStoreSvr.exe')



MsgBox(0,'Nero 7 se reinicia','14')


	RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "BgMonitor_{79662E04-7C6C-4d9f-84C7-88D8A56B10AA}")
	RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run", "NpsSetSerialNr")

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Nero 7"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Nero 7"&@CRLF)
EndIf



Func modificarconf()
	$filedir=@TempDir&'\NERO1005887\Redist\Config\conf.txt'
	if not FileExists($filedir) Then
		While 1
			MsgBox(0,'','No encuentro conf.txt nero 7')
		WEnd
	EndIf

	$EXIT=0
	While $EXIT<>1
		$ARREGLO = FileReadToArray($filedir)
		$EXIT=1
		For $i = 0 To UBound($ARREGLO) - 1

			if $ARREGLO[$i]='INCEXCFTR (2FF8B816) (Actions) NeroHome INCLUDE' then
				_FileWriteToLine($filedir,$i+1,'INCEXCFTR (2FF8B816) (Actions) NeroHome EXCLUDE',True)
				$EXIT=0
			EndIf
			if $ARREGLO[$i]='INCEXCFTR (CB9D5429) (Features) NeroBackItUp INCLUDE' then
				_FileWriteToLine($filedir,$i+1,'INCEXCFTR (CB9D5429) (Features) NeroBackItUp EXCLUDE',True)
				$EXIT=0
			EndIf
			if $ARREGLO[$i]='INCEXCFTR (E38B9E06) (Features) NeroImageDrive INCLUDE' then
				_FileWriteToLine($filedir,$i+1,'INCEXCFTR (E38B9E06) (Features) NeroImageDrive EXCLUDE',True)
				$EXIT=0
			EndIf
			if $ARREGLO[$i]='INCEXCFTR (79061EB3) (Features) NeroMediaStreaming INCLUDE' then
				_FileWriteToLine($filedir,$i+1,'INCEXCFTR (79061EB3) (Features) NeroMediaStreaming EXCLUDE',True)
				$EXIT=0
			EndIf
			if $ARREGLO[$i]='INCEXCFTR (91F9B069) (Features) NeroMobile INCLUDE' then
				_FileWriteToLine($filedir,$i+1,'INCEXCFTR (91F9B069) (Features) NeroMobile EXCLUDE',True)
				$EXIT=0
			EndIf
			if $ARREGLO[$i]='INCEXCLNG ESP USER_LANG' then
				_FileWriteToLine($filedir,$i+1,'INCEXCLNG ESP ALWAYS',True)
				$EXIT=0
			EndIf
			if StringLeft($ARREGLO[$i],21)='MSIPROPERTY SERIALNUM' then
	;~ 			MsgBox(0,'','CONDICION 2')
				_FileWriteToLine($filedir,$i+1,'MSIPROPERTY SERIALNUM "4C81-E085-09M3-0000-KK33-CCXE-4K56"',True)
			Else
				If $i = UBound($ARREGLO) - 1 AND $ARREGLO[$i] <> 'MSIPROPERTY SERIALNUM "4C81-E085-09M3-0000-KK33-CCXE-4K56"' Then
	;~ 				MsgBox(0,'','COND 3')
		;~ 			_FileWriteToLine($filedir,$i+1,'MSIPROPERTY SERIALNUM "4C81-E085-09M3-0000-KK33-CCXE-4K56"',False)
					$filehandle=FileOpen($filedir,1)
					FileWriteLine($filedir,@CRLF)
					FileWriteLine($filedir,'MSIPROPERTY SERIALNUM "4C81-E085-09M3-0000-KK33-CCXE-4K56"')
					FileClose($filehandle)
					$EXIT=0
				EndIf
			EndIf
		Next
	WEnd
EndFunc


Func extraer()
	ShellExecute("Nero-7.11.10.0c_all_update.exe")

	WinWait('Instalación de la barra de herramientas Ask de Nero')
	While WinExists('Instalación de la barra de herramientas Ask de Nero')
		WinClose('Instalación de la barra de herramientas Ask de Nero')
	WEnd
	while FileExists(@TempDir&'\NERO1005887\Toolbar.exe')
		FileDelete(@TempDir&'\NERO1005887\Toolbar.exe')
	WEnd
EndFunc
