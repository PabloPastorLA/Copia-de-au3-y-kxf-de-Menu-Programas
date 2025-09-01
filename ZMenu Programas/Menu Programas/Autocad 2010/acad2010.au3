if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Autocad 2010',160,80,0,110)

If FileExists("AutoCAD_2010_Spanish_MLD_WIN_32bit.exe") AND FileExists("AutoCAD_2010_Spanish_MLD_WIN_64bit.exe") AND not FileExists (@ProgramFilesDir & "\AutoCAD 2010\acad.exe")  AND not FileExists (@ProgramFilesDir & " (x86)\AutoCAD 2010\acad.exe")  Then
	if @OSArch = 'x86' Then $ejec='AutoCAD_2010_Spanish_MLD_WIN_32bit.exe'
	if @OSArch <> 'x86' Then $ejec='AutoCAD_2010_Spanish_MLD_WIN_64bit.exe'

	ShellExecute($ejec)
	ProcessWait($ejec)



	While ProcessExists($ejec)
		sleep(1000)
		if WinExists('AutoCAD 2010','Install') and ControlCommand('AutoCAD 2010','Install','Button2',"IsEnabled", "") Then
			ControlClick('AutoCAD 2010','Install','Button2')
		EndIf
	WEnd


	ProcessWait('setup.exe')

	While ProcessExists('setup.exe')
		sleep(1000)
		if WinExists('AutoCAD 2010','App://Install') then
			ControlClick('AutoCAD 2010','','ListBox1')
;~ 			MsgBox(0,'','1')
		EndIf
		if WinExists('AutoCAD 2010','Seleccione los productos que desea instalar') Then
			If ControlCommand('AutoCAD 2010','AutoCAD 2010','Button5',"IsChecked", "") = 0 Then ControlCommand('AutoCAD 2010','AutoCAD 2010','Button5',"Check", "")
			If ControlCommand('AutoCAD 2010','AutoCAD 2010','Button5',"IsChecked", "") = 1 and ControlCommand('AutoCAD 2010','&Siguiente','Button1',"IsEnabled", "") Then ControlClick('AutoCAD 2010','&Siguiente','Button1')
;~ 			MsgBox(0,'','2')
		EndIf
		if WinExists('AutoCAD 2010','Acepte el Acuerdo de licencia') Then
			If ControlCommand('AutoCAD 2010','I Accep&t','Button1',"IsChecked", "") = 0 Then ControlCommand('AutoCAD 2010','I Accep&t','Button1',"Check", "")
			If ControlCommand('AutoCAD 2010','I Accep&t','Button1',"IsChecked", "") = 1 and ControlCommand('AutoCAD 2010','&Siguiente','Button4',"IsEnabled", "") Then ControlClick('AutoCAD 2010','&Siguiente','Button4')
;~ 			MsgBox(0,'','3')
		EndIf
		if WinExists('AutoCAD 2010','Personalice los productos') Then
			If ControlGetText('AutoCAD 2010','','Edit1') <> '000' Then ControlSetText('AutoCAD 2010','','Edit1','000')
			If ControlGetText('AutoCAD 2010','','Edit2') <> '00000000' Then ControlSetText('AutoCAD 2010','','Edit2','00000000')
			If ControlGetText('AutoCAD 2010','','Edit3') <> '00000' Then ControlSetText('AutoCAD 2010','','Edit3','00000')

			If ControlGetText('AutoCAD 2010','','Edit4') <> 'Pablo' Then ControlSetText('AutoCAD 2010','','Edit4','Pablo')
			If ControlGetText('AutoCAD 2010','','Edit5') <> 'Pastor' Then ControlSetText('AutoCAD 2010','','Edit5','Pastor')
			If ControlGetText('AutoCAD 2010','','Edit6') <> 'Informatica L.A.' Then ControlSetText('AutoCAD 2010','','Edit6','Informatica L.A.')

			If ControlGetText('AutoCAD 2010','','Edit1') = '000' And ControlGetText('AutoCAD 2010','','Edit2') = '00000000' And ControlGetText('AutoCAD 2010','','Edit3') = '00000' And ControlGetText('AutoCAD 2010','','Edit4') = 'Pablo' And ControlGetText('AutoCAD 2010','','Edit5') = 'Pastor' And ControlGetText('AutoCAD 2010','','Edit6') = 'Informatica L.A.' and ControlCommand('AutoCAD 2010','&Siguiente','Button1',"IsEnabled", "") Then ControlClick('AutoCAD 2010','&Siguiente','Button1')
;~ 			MsgBox(0,'','4')
		EndIf
		if WinExists('AutoCAD 2010','Revisar - Configurar - Instalar') and not WinExists ('AutoCAD 2010','No ha efectuado cambios en la configuración por defecto') Then
			If ControlCommand('AutoCAD 2010','I&nstalar','Button3',"IsEnabled", "") Then ControlClick('AutoCAD 2010','I&nstalar','Button3')
;~ 			MsgBox(0,'','5')
		EndIf
		if WinExists ('AutoCAD 2010','No ha efectuado cambios en la configuración por defecto') Then
			If ControlCommand('AutoCAD 2010','&Sí','Button1',"IsEnabled", "") Then ControlClick('AutoCAD 2010','&Sí','Button1')
;~ 			MsgBox(0,'','6')
		EndIf
		if WinExists ('AutoCAD 2010','Instalación finalizada') Then
			If ControlCommand('AutoCAD 2010','Ver el archivo Léame de &AutoCAD 2010.','Button3',"IsChecked", "") = 1 Then ControlCommand('AutoCAD 2010','Ver el archivo Léame de &AutoCAD 2010.','Button3',"UnCheck", "")
			If ControlCommand('AutoCAD 2010','Ver el archivo Léame de &AutoCAD 2010.','Button3',"IsChecked", "") = 0 and ControlCommand('AutoCAD 2010','&Finalizar','Button1',"IsEnabled", "") Then ControlClick('AutoCAD 2010','&Finalizar','Button1')
;~ 			MsgBox(0,'','7')
		EndIf
	WEnd
	sleep(4000)

	If FileExists (@ProgramFilesDir & "\AutoCAD 2010\adlmint.dll") then
		FileCopy('adlmint.dll',@ProgramFilesDir & "\AutoCAD 2010\",1)
	Else
		FileWrite(@DesktopDir & "\Mal Instalado.txt","no instalado autocad o falla el crack del Autocad 2010"&@CRLF)
	EndIf

	If @OSArch='X86' Then
		If FileExists (@ProgramFilesDir & "\AutoCAD 2010\adlmint.dll") then
			FileCopy('adlmint.dll',@ProgramFilesDir & "\AutoCAD 2010\",1)
		Else
			FileWrite(@DesktopDir & "\Mal Instalado.txt","Crack del Autocad 2010"&@CRLF)
		EndIf
	Else; X64
		If FileExists (@ProgramFilesDir & "\AutoCAD 2010\adlmint.dll") then
			FileCopy('Crack x64\adlmint.dll',@ProgramFilesDir & "\AutoCAD 2010\",1)
		Else
			FileWrite(@DesktopDir & "\Mal Instalado.txt","Crack del Autocad 2010"&@CRLF)
		EndIf
	EndIf

	RegWrite('HKEY_CURRENT_USER\Software\Autodesk\MC3','NotificationRemindOn','REG_DWORD',0)

	acadinfooff()

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Autocad 2010"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Autocad 2010"&@CRLF)
EndIf

func acadinfooff()
	ShellExecute('acad2010sacarventana.exe')
	RegWrite('HKEY_CURRENT_USER\Software\Autodesk\AutoCAD\R18.0\ACAD-8001:40A\InfoCenter','InfoCenterOn','REG_DWORD',0)
	ShellExecuteWait('msiexec.exe',' /i "AcadInfoCenterOff.msi" /qb')

	if WinExists('AcadInfoCenterOff - Internet Explorer') then WinClose('AcadInfoCenterOff - Internet Explorer')
	if WinExists('http:// - AcadInfoCenterOff - Microsoft Internet Explorer') then WinClose('http:// - AcadInfoCenterOff - Microsoft Internet Explorer')
	if WinExists('http:/// - AcadInfoCenterOff - Windows Internet Explorer') then WinClose('http:/// - AcadInfoCenterOff - Windows Internet Explorer')
EndFunc

