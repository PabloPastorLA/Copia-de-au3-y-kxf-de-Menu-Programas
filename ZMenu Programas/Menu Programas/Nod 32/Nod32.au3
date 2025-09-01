#include <File.au3>
if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. NOD32',160,80,0,110)







#include <Date.au3>
$fechahorareal = _Date_Time_GetLocalTime()
$tTime = _Date_Time_GetSystemTime()
$aTime = _Date_Time_SystemTimeToArray($tTime)
$fechahoradeseada = _Date_Time_EncodeSystemTime($aTime[0], $aTime[1]-5, $aTime[2], $aTime[3]-3, $aTime[4], $aTime[5],$aTime[6])
;------------------------------------------------------------------------------


$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


If FileExists("eav_nt32_esn.msi") AND FileExists("eav_nt64_esn.msi") AND not FileExists ($ProgramFilesDir & "\ESET\ESET NOD32 Antivirus\egui.exe") AND not FileExists ($ProgramFilesDir & " (x86)\ESET\ESET NOD32 Antivirus\egui.exe")  Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Nod32"&@CRLF)



	cerrarvent()

	atrafecha()

	unrar()

	purefix1()

	Instalar()

	copupd()



	purefix2()

	adelfecha()

	TareaProgNODUpgrade()

	exclusiones()

	fechainstalacion()

;NO SE USA	;~ Closecerrarvent()


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Nod32"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Nod32"&@CRLF)
EndIf



func TareaProgNODUpgrade()

	if FileExists(@ProgramFilesDir & '\ESET\') Then
		while not FileExists(@ProgramFilesDir & '\ESET\NOD Reset Upgrade.exe') or not FileExists(@ProgramFilesDir & '\ESET\NODReset.xml')
			FileCopy('NOD Reset Upgrade\NODReset.xml',@ProgramFilesDir & '\ESET\NODReset.xml',9)

			If @OSArch='x86' Then FileCopy('NOD Reset Upgrade\NOD Reset Upgrade.exe',@ProgramFilesDir & '\ESET\NOD Reset Upgrade.exe',9)
			If @OSArch<>'x86' Then FileCopy('NOD Reset Upgrade\NOD Reset Upgrade_x64.exe',@ProgramFilesDir & '\ESET\NOD Reset Upgrade.exe',9)

			Sleep(500)
		WEnd

;		CHEQUEAR USUARIO Y CAMBIAR XML SI ES DISTINTO 	-----------------------------------------
		$Lineaarch=FileReadLine(@ProgramFilesDir & '\ESET\NODReset.xml',15)
		If $Lineaarch='      <UserId>USUARIO-PC\Usuario</UserId>' Then
			$arch=@ProgramFilesDir & '\ESET\NODReset.xml'
			_FileWriteToLine($arch,15,'      <UserId>'&@ComputerName&'\'&@UserName&'</UserId>',True)
		EndIf
		;----------------------------------------------------------------------------------------------

		ShellExecuteWait('cmd.exe',' /c schtasks /delete /TN "NOD Reset Upgrade" /F')
	;	ShellExecuteWait('cmd.exe',' /C schtasks /create /TN "NOD Reset Upgrade" /RL HIGHEST /SC ONLOGON /TR "'&"'"&@ProgramFilesDir & '\ESET\NOD Reset Upgrade.exe'&"'")
		ShellExecuteWait('cmd.exe',' /c schtasks /create /XML "'&@ProgramFilesDir & '\ESET\NODReset.xml" /TN "NOD Reset Upgrade"','','',@SW_HIDE)

	elseif FileExists(@ProgramFilesDir & ' (x86)\ESET\') Then
		MsgBox(0,'','NOD32 si aparece esta ventana quiere decir que este elseif si se usa')
		while not FileExists(@ProgramFilesDir & ' (x86)\ESET\NOD Reset Upgrade.exe')

			If @OSArch='x86' Then FileCopy('NOD Reset Upgrade\NOD Reset Upgrade.exe',@ProgramFilesDir & ' (x86)\ESET\NOD Reset Upgrade.exe',9)
			If @OSArch<>'x86' Then FileCopy('NOD Reset Upgrade\NOD Reset Upgrade_x64.exe',@ProgramFilesDir & ' (x86)\ESET\NOD Reset Upgrade.exe',9)

			Sleep(500)
		WEnd
		ShellExecuteWait('cmd.exe',' /C schtasks /delete /TN "NOD Reset Upgrade" /F')
		ShellExecuteWait('cmd.exe',' /C schtasks /create /TN "NOD Reset Upgrade" /RL HIGHEST /SC ONLOGON /TR "'&"'"&@ProgramFilesDir & ' (x86)\ESET\NOD Reset Upgrade.exe'&"'")
;	elseif FileExists($progr & '\ESET\ESET NOD32 Antivirus\x86\ekrn.exe') Then
;		while not FileExists($progr & '\ESET\ESET NOD32 Antivirus\x86\NOD Reset Upgrade.exe')
;			FileCopy('NOD Reset Upgrade\NOD Reset Upgrade.exe',$progr & '\ESET\ESET NOD32 Antivirus\x86\NOD Reset Upgrade.exe',9)
;			Sleep(500)
;		WEnd
;		ShellExecuteWait('cmd.exe',' /C schtasks /delete /TN "NOD Reset Upgrade" /F')
;		ShellExecuteWait('cmd.exe',' /C schtasks /create /TN "NOD Reset Upgrade" /RL HIGHEST /SC ONLOGON /TR "'&"'"&$progr & '\ESET\ESET NOD32 Antivirus\x86\NOD Reset Upgrade.exe'&"'")
	Else
		While 1
			MsgBox(0,'','NOD32 donde copiar NOD Reset Upgrade.exe')
		WEnd
	EndIf
	If @OSArch='x86' Then ShellExecuteWait('NOD Reset Upgrade\NOD Reset Upgrade.exe')
	If @OSArch<>'x86' Then ShellExecuteWait('NOD Reset Upgrade\NOD Reset Upgrade_x64.exe')
EndFunc


func fechainstalacion()
	$progfiles=@HomeDrive &'\Program Files'

	If FileExists (@ProgramFilesDir &'\ESET\ESET NOD32 Antivirus\egui.exe') Then
		FileWrite(@ProgramFilesDir &'\ESET\ESET NOD32 Antivirus\FechaInstalacion.txt','Se instaló el: '&_NowDate ( )&'. Puede estar mal la fecha debido a que pudo estar mal al momento de instalar.')
	Elseif FileExists (@ProgramFilesDir &' (x86)\ESET\ESET NOD32 Antivirus\egui.exe') Then
		FileWrite(@ProgramFilesDir &' (x86)\ESET\ESET NOD32 Antivirus\FechaInstalacion.txt','Se instaló el: '&_NowDate ( )&'. Puede estar mal la fecha debido a que pudo estar mal al momento de instalar.')
	 	Elseif FileExists ($progfiles &'\ESET\ESET NOD32 Antivirus\egui.exe') Then
	 		FileWrite($progfiles &'\ESET\ESET NOD32 Antivirus\FechaInstalacion.txt','Se instaló el: '&_NowDate ( )&'. Puede estar mal la fecha debido a que pudo estar mal al momento de instalar.')
	Else
		While 1
			MsgBox(0,'','nod32 falta egui.exe para fecha instalacion')
		WEnd
	EndIf
EndFunc


func cerrarvent()

	ShellExecute('cerrarvent.exe')

EndFunc

func Closecerrarvent()

	ProcessClose('cerrarvent.exe')

EndFunc

func copupd()
	if @OSArch="X86" Then
		ShellExecuteWait('xcopy',' update\*32.dat "' & @ProgramFilesDir & '\ESET\ESET NOD32 Antivirus" /I /C /K /Y')
	Else
		ShellExecuteWait('xcopy',' update\*.dat "' & @ProgramFilesDir & '\ESET\ESET NOD32 Antivirus" /I /C /K /Y')
	EndIf
EndFunc



func atrafecha()
	_Date_Time_SetLocalTime(DllStructGetPtr($fechahoradeseada))
EndFunc

func adelfecha()
	_Date_Time_SetLocalTime(DllStructGetPtr($fechahorareal))
EndFunc

func Instalar()

	RegWrite('HKEY_CURRENT_USER\Software\ESET\ESET Security\CurrentVersion\Client','ShowSplash','REG_DWORD',0)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000101\Profiles\@My profile','DiskFloppyOnExecuteAH','REG_DWORD',0)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000101\Profiles\@My profile','OnOpen_AdvanceHeuristic','REG_DWORD',0)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Profiles\@My profile','WUWarningLevel','REG_DWORD',0)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000102\Profiles\@My profile','BuildRescan','REG_DWORD',0)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Profiles\@My profile','SampleEnable','REG_DWORD',0)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Profiles\@My profile','StatisticsEnabled','REG_DWORD',0)
	;if @OSArch <> 'X86' Then
		RegWrite('HKEY_CURRENT_USER\Software\Wow6432Node\ESET\ESET Security\CurrentVersion\Client','ShowSplash','REG_DWORD',0)
		RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\ESET\ESET Security\CurrentVersion\Plugins\01000101\Profiles\@My profile','DiskFloppyOnExecuteAH','REG_DWORD',0)
		RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\ESET\ESET Security\CurrentVersion\Plugins\01000101\Profiles\@My profile','OnOpen_AdvanceHeuristic','REG_DWORD',0)
		RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\ESET\ESET Security\CurrentVersion\Plugins\01000600\Profiles\@My profile','WUWarningLevel','REG_DWORD',0)
		RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\ESET\ESET Security\CurrentVersion\Plugins\01000102\Profiles\@My profile','BuildRescan','REG_DWORD',0)
		RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\ESET\ESET Security\CurrentVersion\Plugins\01000600\Profiles\@My profile','SampleEnable','REG_DWORD',0)
		RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\ESET\ESET Security\CurrentVersion\Plugins\01000600\Profiles\@My profile','StatisticsEnabled','REG_DWORD',0)
	;EndIf



	if @OSArch="X86" Then
		ShellExecuteWait('msiexec.exe',' /i "eav_nt32_esn.msi" /qn REBOOT="ReallySuppress"')
	Else
		ShellExecuteWait('msiexec.exe',' /i "eav_nt64_esn.msi" /qn REBOOT="ReallySuppress"')
	EndIf

	RegWrite('HKEY_CURRENT_USER\Software\ESET\ESET Security\CurrentVersion\Client','ShowSplash','REG_DWORD',0)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000101\Profiles\@My profile','DiskFloppyOnExecuteAH','REG_DWORD',0)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000101\Profiles\@My profile','OnOpen_AdvanceHeuristic','REG_DWORD',0)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Profiles\@My profile','WUWarningLevel','REG_DWORD',0)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000102\Profiles\@My profile','BuildRescan','REG_DWORD',0)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Profiles\@My profile','SampleEnable','REG_DWORD',0)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Profiles\@My profile','StatisticsEnabled','REG_DWORD',0)
	;if @OSArch <> 'X86' Then
		RegWrite('HKEY_CURRENT_USER\Software\Wow6432Node\ESET\ESET Security\CurrentVersion\Client','ShowSplash','REG_DWORD',0)
		RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\ESET\ESET Security\CurrentVersion\Plugins\01000101\Profiles\@My profile','DiskFloppyOnExecuteAH','REG_DWORD',0)
		RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\ESET\ESET Security\CurrentVersion\Plugins\01000101\Profiles\@My profile','OnOpen_AdvanceHeuristic','REG_DWORD',0)
		RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\ESET\ESET Security\CurrentVersion\Plugins\01000600\Profiles\@My profile','WUWarningLevel','REG_DWORD',0)
		RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\ESET\ESET Security\CurrentVersion\Plugins\01000102\Profiles\@My profile','BuildRescan','REG_DWORD',0)
		RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\ESET\ESET Security\CurrentVersion\Plugins\01000600\Profiles\@My profile','SampleEnable','REG_DWORD',0)
		RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\ESET\ESET Security\CurrentVersion\Plugins\01000600\Profiles\@My profile','StatisticsEnabled','REG_DWORD',0)
	;EndIf
EndFunc

func unrar()
	ShellExecuteWait('UnRAR.exe','e -p123 -y Purefix.rar')
	while not FileExists ('ESET PureFix v2.03.exe')
		MsgBox(0,'Antivirus activo','Desactive el antivirus y presiones OK para poder extraer Purefix')
		sleep(500)
		unrar()
	WEnd
EndFunc

func purefix1()
	Run('ESET PureFix v2.03.exe')


	while not (WinExists ('Framework Initialization Error') Or WinExists ('ESET PureFix V2.03 - PurplebeanZ'))
		sleep(300)
	WEnd
	If WinExists ('ESET PureFix V2.03 - PurplebeanZ') Then
		WinActivate('ESET PureFix V2.03 - PurplebeanZ')
		ControlClick('ESET PureFix V2.03','http://www.nsanedown.com/','Enable')
	EndIf

	If WinExists ('.NET Framework Initialization Error') Then
		MsgBox(0,'Falta .NET','Falta .NET Framework. La instalacion se cancela :(')
		Exit
	EndIf
EndFunc

func purefix2()

	WinActivate('ESET PureFix V2.03 - PurplebeanZ')

	ControlClick('ESET PureFix V2.03','http://www.nsanedown.com/','Close')

	If ControlGetText('ESET PureFix V2.03','http://www.nsanedown.com/','WindowsForms10.BUTTON.app.0.378734a1')='Cancel' then
		FileWrite(@DesktopDir & "\PUREFIX correr en SAFEMODE","Nod32"&@CRLF)
		ProcessClose('ESET PureFix v2.03.exe')
	EndIf
	ProcessWaitClose('ESET PureFix v2.03.exe')
	do
		FileDelete('ESET PureFix v2.03.exe')
	until not FileExists('ESET PureFix v2.03.exe')
EndFunc


Func exclusiones()
	$progfiles=@HomeDrive &'\Program Files'
	If FileExists ($ProgramFilesDir &'\ESET\ESET NOD32 Antivirus\egui.exe') Then
		ShellExecute($ProgramFilesDir &'\ESET\ESET NOD32 Antivirus\egui.exe')
	Elseif FileExists ($ProgramFilesDir &' (x86)\ESET\ESET NOD32 Antivirus\egui.exe') Then
		ShellExecute($ProgramFilesDir &' (x86)\ESET\ESET NOD32 Antivirus\egui.exe')
	Elseif FileExists ($progfiles &'\ESET\ESET NOD32 Antivirus\egui.exe') Then
		ShellExecute($progfiles &'\ESET\ESET NOD32 Antivirus\egui.exe')
	Else
		While 1
			MsgBox(0,'Inst NOD32','falta egui.exe para exclusiones')
		WEnd
	EndIf


	While not WinExists ('ESET NOD32 Antivirus','Predeterminado')
		WinWait('ESET NOD32 Antivirus')
		WinActivate('ESET NOD32 Antivirus')
		Send('{F5}')
	WEnd

$exit=0
while $exit<20
	Sleep(100)
	if WinExists('ESET NOD32 Antivirus','Protección Antivirus y antiespía') then
		$exit=20
		WinActivate('ESET NOD32 Antivirus','Protección Antivirus y antiespía')
		WinWaitActive('ESET NOD32 Antivirus','Protección Antivirus y antiespía')
		Send('{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}')
	Else
		$exit=20;$exit+1
	EndIf
WEnd

	$sentido=0
	while not WinExists('ESET NOD32 Antivirus','Exclusiones')
		WinActivate('ESET NOD32 Antivirus')
		Sleep(500)
		if not WinActive('ESET NOD32 Antivirus','') then WinActivate('ESET NOD32 Antivirus','')

		if WinExists('ESET NOD32 Antivirus','Integración con el cliente de correo electrónico') then $sentido=1
		if WinExists('ESET NOD32 Antivirus','Protección Antivirus y antiespía') then $sentido=0
		if $sentido=0 then Send('{down}')
		if $sentido=1 then Send('{up}')
	WEnd

	if FileExists(@HomeDrive & "\ActOff2010Reinicio") Then
		$agregar=@HomeDrive & "\ActOff2010Reinicio"
		agregar($agregar)
	EndIf

	if FileExists($ProgramFilesDir&'\ESET\NOD Reset Upgrade.exe') Then
		$agregar=$ProgramFilesDir&'\ESET\NOD Reset Upgrade.exe'
		agregar($agregar)
	EndIf
	if FileExists($ProgramFilesDir&' (x86)\ESET\NOD Reset Upgrade.exe') Then
		$agregar=$ProgramFilesDir&' (x86)\ESET\NOD Reset Upgrade.exe'
		agregar($agregar)
	EndIf

	if FileExists(@HomeDrive & "\ActOff20132016") Then
		$agregar=@HomeDrive & "\ActOff20132016"
		agregar($agregar)
	EndIf

	if FileExists(@WindowsDir & "\Halted") Then
		$agregar=@WindowsDir & "\Halted"
		agregar($agregar)
	EndIf

	if FileExists(@WindowsDir & "\AutoKMS") Then
		$agregar=@WindowsDir & "\AutoKMS"
		agregar($agregar)
	EndIf

	if FileExists(@WindowsDir & "\KMSAutoS") Then
		$agregar=@WindowsDir & "\KMSAutoS"
		agregar($agregar)
	EndIf

	if FileExists(@WindowsDir & "\KMSEmulator.exe") Then
		$agregar=@WindowsDir & "\KMSEmulator.exe"
		agregar($agregar)
	EndIf
;~ 	$agregar=@WindowsDir&"\autokms"
;~ 	agregar($agregar)
;~ 	ControlClick('Agregar exclusión','Acep&tar','Button2')

	WinWaitClose('Agregar exclusión')
	For $p=0 to 200 Step 1
		If ControlGetText('ESET NOD32 Antivirus','Acep&tar','Button'&$p) = 'Acep&tar' then ControlClick('ESET NOD32 Antivirus','Acep&tar','Button'&$p)
	Next
	WinWaitClose('ESET NOD32 Antivirus','Exclusiones')

	while WinGetState('ESET NOD32 Antivirus')<> 5 And WinGetState('ESET NOD32 Antivirus')<> 13
		WinsetState('ESET NOD32 Antivirus','',@SW_HIDE )
	WEnd
EndFunc

Func agregar($agregar)
	while not ControlCommand('ESET NOD32 Antivirus','&Agregar...','Button2',"IsVisible", "") or not ControlCommand('ESET NOD32 Antivirus','&Agregar...','Button2',"IsEnabled", "")
	WEnd

	While not WinExists('Agregar exclusión')
		ControlClick('ESET NOD32 Antivirus','&Agregar...','Button2')
		$i=0
		While $i<3000 and not WinExists('Agregar exclusión')
			$i=$i+50
			Sleep(50)
		WEnd
	WEnd

	WinWait('Agregar exclusión')
	While ControlGetText('Agregar exclusión','','Edit1')<> $agregar
		ControlSetText('Agregar exclusión','','Edit1','')
		ControlSetText('Agregar exclusión','','Edit1',$agregar)
		Sleep(1000)
	WEnd
	While WinExists('Agregar exclusión')
		ControlClick('Agregar exclusión','Acep&tar','Button2')
	WEnd

EndFunc