if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Autocad 2014',160,80,0,110)

$programfilesdir=@ProgramFilesDir
if StringRight($programfilesdir,6) = ' (X86)' Then $programfilesdir=StringTrimRight($programfilesdir,6)

;abrir()
func abrir()
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Autocad 2014'&@CRLF&'F. abrir',160,80,0,110)

	ShellExecuteWait('cmd',' /c netsh advfirewall firewall add rule name="Autocad2014" dir=in action=block program="'&$programfilesdir&'\Autodesk\AutoCAD 2014\acad.exe" enable=yes','','',@SW_HIDE)
	ShellExecuteWait('cmd',' /c netsh advfirewall firewall add rule name="Autocad2014" dir=in action=block program="'&$programfilesdir&' (x86)\Autodesk\AutoCAD 2014\acad.exe" enable=yes','','',@SW_HIDE)
	ShellExecuteWait('cmd',' /c netsh advfirewall firewall add rule name="Autocad2014" dir=out action=block program="'&$programfilesdir&'\Autodesk\AutoCAD 2014\acad.exe" enable=yes','','',@SW_HIDE)
	ShellExecuteWait('cmd',' /c netsh advfirewall firewall add rule name="Autocad2014" dir=out action=block program="'&$programfilesdir&' (x86)\Autodesk\AutoCAD 2014\acad.exe" enable=yes','','',@SW_HIDE)
;Hasta aca bloquee acad.exe

	if FileExists ($programfilesdir & "\Autodesk\AutoCAD 2014\acad.exe") Then ShellExecute($programfilesdir & "\Autodesk\AutoCAD 2014\acad.exe")
	If FileExists ($programfilesdir & " (x86)\Autodesk\AutoCAD 2014\acad.exe") Then ShellExecute($programfilesdir & " (x86)\Autodesk\AutoCAD 2014\acad.exe")

;hasta aca ejecuté
MsgBox(0,'','1')
	while not WinExists('Autodesk AutoCAD 2014 - VERSION NO REGISTRADA - [Dibujo1.dwg]')
		if WinExists('Licencias de Autodesk') Then
			WinActivate('Licencias de Autodesk')
			WinWaitActive('Licencias de Autodesk')
			send ('{space}{space}')
		EndIf
		Sleep(1000)
	WEnd


MsgBox(0,'','2')

;666 69696969
;001F1

;acá está abierto y sin ventana de registro

	$exit=0
	Do
		if WinExists('Autodesk AutoCAD 2014 - VERSION NO REGISTRADA - [Dibujo1.dwg]') then $exit=$exit+1
		if WinExists('Programa de participación del usuario de Autodesk') then
			controlclick('Programa de participación del usuario de Autodesk','','Button2')
			if controlcommand('Programa de participación del usuario de Autodesk','','Button2','ischecked','')=1 then
				ControlClick('Programa de participación del usuario de Autodesk','','Button4')
				;$exit=10
			EndIf

		EndIf


		if WinGetState('Bienvenido')=15 then
			Do
				WinClose('Bienvenido')
			until WinGetState('Bienvenido')<>15
			$exit=100
		EndIf

		Sleep(100)
	until $exit>=100


;hasta acá cerre ventanas
	Do
		WinClose('Autodesk AutoCAD 2014 - VERSION NO REGISTRADA - [Dibujo1.dwg]')
	until not WinExists('Autodesk AutoCAD 2014 - VERSION NO REGISTRADA - [Dibujo1.dwg]')


	MsgBox(0,'','terminé')
EndFunc


If FileExists("AutoCAD_2014_Spanish_Win_32bit_dlm.sfx.exe") AND FileExists("AutoCAD_2014_Spanish_Win_64bit_dlm.sfx.exe") AND not FileExists ($programfilesdir & "\Autodesk\AutoCAD 2014\acad.exe")  AND not FileExists ($programfilesdir & " (x86)\Autodesk\AutoCAD 2014\acad.exe")  Then

;~ C:\Program Files\Autodesk\AutoCAD 2014\acad.exe

 	extraer()

 	instalar()

;abrir()


;~ if FileExists ($programfilesdir & "\Autodesk\AutoCAD 2014\acad.exe") Then ShellExecute($programfilesdir & "\Autodesk\AutoCAD 2014\acad.exe")
;~ If FileExists ($programfilesdir & " (x86)\Autodesk\AutoCAD 2014\acad.exe") Then ShellExecute($programfilesdir & " (x86)\Autodesk\AutoCAD 2014\acad.exe")






;~ 	MsgBox(0,'','sali')
;~ 	WinWait('Autodesk® AutoCAD® 2014','Ruta de +lación:')
;~ 	while WinExists('Autodesk® AutoCAD® 2014','Ruta de instalación:')
;~ 		ControlClick('Autodesk® AutoCAD® 2014','','Button3')
;~ 	WEnd


;~ 	Exit
;~ MsgBox(0,'','')

;~ 	ProcessWait('setup.exe')

;~ 	While ProcessExists('setup.exe')
;~ 		sleep(1000)
;~ 		if WinExists('AutoCAD 2010','App://Install') then
;~ 			ControlClick('AutoCAD 2010','','ListBox1')
			;MsgBox(0,'','1')
;~ 		EndIf
;~ 		if WinExists('AutoCAD 2010','Seleccione los productos que desea instalar') Then
;~ 			If ControlCommand('AutoCAD 2010','AutoCAD 2010','Button5',"IsChecked", "") = 0 Then ControlCommand('AutoCAD 2010','AutoCAD 2010','Button5',"Check", "")
;~ 			If ControlCommand('AutoCAD 2010','AutoCAD 2010','Button5',"IsChecked", "") = 1 and ControlCommand('AutoCAD 2010','&Siguiente','Button1',"IsEnabled", "") Then ControlClick('AutoCAD 2010','&Siguiente','Button1')
			;MsgBox(0,'','2')
;~ 		EndIf
;~ 		if WinExists('AutoCAD 2010','Acepte el Acuerdo de licencia') Then
;~ 			If ControlCommand('AutoCAD 2010','I Accep&t','Button1',"IsChecked", "") = 0 Then ControlCommand('AutoCAD 2010','I Accep&t','Button1',"Check", "")
;~ 			If ControlCommand('AutoCAD 2010','I Accep&t','Button1',"IsChecked", "") = 1 and ControlCommand('AutoCAD 2010','&Siguiente','Button4',"IsEnabled", "") Then ControlClick('AutoCAD 2010','&Siguiente','Button4')
			;MsgBox(0,'','3')
;~ 		EndIf
;~ 		if WinExists('AutoCAD 2010','Personalice los productos') Then
;~ 			If ControlGetText('AutoCAD 2010','','Edit1') <> '000' Then ControlSetText('AutoCAD 2010','','Edit1','000')
;~ 			If ControlGetText('AutoCAD 2010','','Edit2') <> '00000000' Then ControlSetText('AutoCAD 2010','','Edit2','00000000')
;~ 			If ControlGetText('AutoCAD 2010','','Edit3') <> '00000' Then ControlSetText('AutoCAD 2010','','Edit3','00000')

;~ 			If ControlGetText('AutoCAD 2010','','Edit4') <> 'Pablo' Then ControlSetText('AutoCAD 2010','','Edit4','Pablo')
;~ 			If ControlGetText('AutoCAD 2010','','Edit5') <> 'Pastor' Then ControlSetText('AutoCAD 2010','','Edit5','Pastor')
;~ 			If ControlGetText('AutoCAD 2010','','Edit6') <> 'Informatica L.A.' Then ControlSetText('AutoCAD 2010','','Edit6','Informatica L.A.')

;~ 			If ControlGetText('AutoCAD 2010','','Edit1') = '000' And ControlGetText('AutoCAD 2010','','Edit2') = '00000000' And ControlGetText('AutoCAD 2010','','Edit3') = '00000' And ControlGetText('AutoCAD 2010','','Edit4') = 'Pablo' And ControlGetText('AutoCAD 2010','','Edit5') = 'Pastor' And ControlGetText('AutoCAD 2010','','Edit6') = 'Informatica L.A.' and ControlCommand('AutoCAD 2010','&Siguiente','Button1',"IsEnabled", "") Then ControlClick('AutoCAD 2010','&Siguiente','Button1')
			;MsgBox(0,'','4')
;~ 		EndIf
;~ 		if WinExists('AutoCAD 2010','Revisar - Configurar - Instalar') and not WinExists ('AutoCAD 2010','No ha efectuado cambios en la configuración por defecto') Then
;~ 			If ControlCommand('AutoCAD 2010','I&nstalar','Button3',"IsEnabled", "") Then ControlClick('AutoCAD 2010','I&nstalar','Button3')
			;MsgBox(0,'','5')
;~ 		EndIf
;~ 		if WinExists ('AutoCAD 2010','No ha efectuado cambios en la configuración por defecto') Then
;~ 			If ControlCommand('AutoCAD 2010','&Sí','Button1',"IsEnabled", "") Then ControlClick('AutoCAD 2010','&Sí','Button1')
			;MsgBox(0,'','6')
;~ 		EndIf
;~ 		if WinExists ('AutoCAD 2010','Instalación finalizada') Then
;~ 			If ControlCommand('AutoCAD 2010','Ver el archivo Léame de &AutoCAD 2010.','Button3',"IsChecked", "") = 1 Then ControlCommand('AutoCAD 2010','Ver el archivo Léame de &AutoCAD 2010.','Button3',"UnCheck", "")
;~ 			If ControlCommand('AutoCAD 2010','Ver el archivo Léame de &AutoCAD 2010.','Button3',"IsChecked", "") = 0 and ControlCommand('AutoCAD 2010','&Finalizar','Button1',"IsEnabled", "") Then ControlClick('AutoCAD 2010','&Finalizar','Button1')
			;MsgBox(0,'','7')
;~ 		EndIf
;~ 	WEnd
;~ 	sleep(4000)

;~ 	If FileExists (@ProgramFilesDir & "\AutoCAD 2010\adlmint.dll") then
;~ 		FileCopy('adlmint.dll',@ProgramFilesDir & "\AutoCAD 2010\",1)
;~ 	Else
;~ 		FileWrite(@DesktopDir & "\Mal Instalado.txt","no instalado autocad o falla el crack del Autocad 2010"&@CRLF)
;~ 	EndIf

;~ 	If @OSArch='X86' Then
;~ 		If FileExists (@ProgramFilesDir & "\AutoCAD 2010\adlmint.dll") then
;~ 			FileCopy('adlmint.dll',@ProgramFilesDir & "\AutoCAD 2010\",1)
;~ 		Else
;~ 			FileWrite(@DesktopDir & "\Mal Instalado.txt","Crack del Autocad 2010"&@CRLF)
;~ 		EndIf
;~ 	Else; X64
;~ 		If FileExists (@ProgramFilesDir & "\AutoCAD 2010\adlmint.dll") then
;~ 			FileCopy('Crack x64\adlmint.dll',@ProgramFilesDir & "\AutoCAD 2010\",1)
;~ 		Else
;~ 			FileWrite(@DesktopDir & "\Mal Instalado.txt","Crack del Autocad 2010"&@CRLF)
;~ 		EndIf
;~ 	EndIf

;~ 	RegWrite('HKEY_CURRENT_USER\Software\Autodesk\MC3','NotificationRemindOn','REG_DWORD',0)

;~ 	acadinfooff()

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Autocad 2014"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Autocad 2014"&@CRLF)
EndIf
func instalar()
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Autocad 2014'&@CRLF&'F. Instalar',160,80,0,110)
	$exit=0
	Do
		Sleep(100)
		$exit=$exit+1
	until ProcessExists('setup.exe') or $exit >= 50

	if not ProcessExists('setup.exe') then
		if @OSArch='x86' then ShellExecute(@HomeDrive&'\Autodesk\AutoCAD_2014_Spanish_Win_32bit_dlm\Setup.exe')
		if @OSArch='x64' then ShellExecute(@HomeDrive&'\Autodesk\AutoCAD_2014_Spanish_Win_64bit_dlm\Setup.exe')
	EndIf

	while ProcessExists('setup.exe')
		if ControlCommand('Autodesk® AutoCAD® 2014','','ListBox5','isvisible','') Then ControlClick('Autodesk® AutoCAD® 2014','','ListBox5')
		if ControlCommand('Autodesk® AutoCAD® 2014','','Button5','ischecked','')=0 and WinExists('Autodesk® AutoCAD® 2014','CONTRATO DE LICENCIA') Then ControlClick('Autodesk® AutoCAD® 2014','','Button5')
		if ControlCommand('Autodesk® AutoCAD® 2014','','Button5','ischecked','')=1 Then ControlClick('Autodesk® AutoCAD® 2014','','Button2')
		if ControlCommand('Autodesk® AutoCAD® 2014','','Button6','ischecked','')=0 and WinExists('Autodesk® AutoCAD® 2014','Deseo probar este producto durante 30 días') Then ControlClick('Autodesk® AutoCAD® 2014','','Button6')
		if ControlCommand('Autodesk® AutoCAD® 2014','','Button6','ischecked','')=1 and WinExists('Autodesk® AutoCAD® 2014','Deseo probar') Then ControlClick('Autodesk® AutoCAD® 2014','','Button2')
		if WinExists('Autodesk® AutoCAD® 2014','Ruta de instalación:') then ControlClick('Autodesk® AutoCAD® 2014','','Button3')

		if WinExists('Archivo en uso','Se deben cerrar las siguientes aplicaciones') then ControlClick('Archivo en uso','','Button1')

		if WinExists('Autodesk® AutoCAD® 2014','Instalación finalizada') then ControlClick('Autodesk® AutoCAD® 2014','','Button1')
	WEnd
EndFunc


func extraer()
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Autocad 2014'&@CRLF&'F. Extraer',160,80,0,110)
	if @OSArch = 'x86' Then $ejec='AutoCAD_2014_Spanish_Win_32bit_dlm.sfx.exe'
	if @OSArch <> 'x86' Then $ejec='AutoCAD_2014_Spanish_Win_64bit_dlm.sfx.exe'

	ShellExecute($ejec)
;~ 	ProcessWait($ejec)
	WinWait('Archivo de extracción automática de Autodesk')
	$pos=WinGetPos('Archivo de extracción automática de Autodesk')
	$x=$pos[0]+$pos[2]/2
	$y=$pos[1]+$pos[3]-30
	BlockInput(1)
	mouseMove($x,$y,0)
	BlockInput(0)

;6579300	boton aceptar
;3816510

;4671818	sin boton aceptar
;5592920

	While ProcessExists($ejec)
		Sleep(100)
		if PixelGetColor($x,$y)=6579300 or PixelGetColor($x,$y)=3816510 then MouseClick('left',$x,$y)
;~ 		if PixelGetColor($x,$y)=4671818 or PixelGetColor($x,$y)=5592920 then mouseMove($pos[0],$pos[1],0)
	WEnd
EndFunc




func acadinfooff()
	MsgBox(0,'','')
	RegWrite('HKEY_CURRENT_USER\Software\Autodesk\AutoCAD\R18.0\ACAD-8001:40A\InfoCenter','InfoCenterOn','REG_DWORD',0)
	ShellExecuteWait('msiexec.exe',' /i "AcadInfoCenterOff.msi" /qb')
	if WinExists('AcadInfoCenterOff - Internet Explorer') then WinClose('AcadInfoCenterOff - Internet Explorer')
	if WinExists('http:// - AcadInfoCenterOff - Microsoft Internet Explorer') then WinClose('http:// - AcadInfoCenterOff - Microsoft Internet Explorer')
EndFunc


