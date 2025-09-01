#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
#include <GuiTab.au3>



SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Megadownloader Plus',160,80,0,110)



$programfilesdir=@ProgramFilesDir
If StringRight(@ProgramFilesDir,6) = ' (x86)' then $programfilesdir = StringTrimRight(@ProgramFilesDir,6)




If not FileExists ($programfilesdir & "\MegaDownloader\MegaDownloader.exe") AND not FileExists (@ProgramFilesDir & " (x86)\MegaDownloader\MegaDownloader.exe") Then

	ShellExecuteWait("MegaDownloader_v1.8.exe",' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-')

	if FileExists($programfilesdir & '\MegaDownloader\MegaDownloader.exe') Then ShellExecuteWait('cmd',' /C netsh advfirewall firewall add rule name="MegaDownloader" dir=in action=allow program="'&$programfilesdir&'\MegaDownloader\MegaDownloader.exe" enable=yes','','',@SW_HIDE)
	if FileExists($programfilesdir & ' (x86)\MegaDownloader\MegaDownloader.exe') Then ShellExecuteWait('cmd',' /C netsh advfirewall firewall add rule name="MegaDownloader" dir=in action=allow program="'&$programfilesdir&' (x86)\MegaDownloader\MegaDownloader.exe" enable=yes','','',@SW_HIDE)

	FileDelete(@LocalAppDataDir & '\MegaDownloader\Config\Configuration.xml')
	FileCopy('Configuration.xml',@LocalAppDataDir & '\MegaDownloader\Config\Configuration.xml',9)



	;------		HASTA ACA INSTALE MEGADOWNLOADER, DESDE ACA COPIO PSIPHON

	if FileExists ($programfilesdir & "\MegaDownloader\MegaDownloader.exe") Then
		FileCopy ('psiphon3.exe',$programfilesdir & "\MegaDownloader",8)
		FileCopy ('MegaDownloader PLUS.exe',$programfilesdir & "\MegaDownloader",8)
		FileCopy ('MegaDownloader PLUS.ico',$programfilesdir & "\MegaDownloader",8)
		FileCopy ('MegaDownloader PLUS.kxf',$programfilesdir & "\MegaDownloader",8)
		FileCopy ('MegaDownloader PLUS.au3',$programfilesdir & "\MegaDownloader",8)
;		FileCreateShortcut($programfilesdir & "\MegaDownloader\psiphon3.exe",@AppDataCommonDir&'\Microsoft\Windows\Start Menu\Programs\MegaDownloader\PsiPhon',$programfilesdir & "\MegaDownloader\")
;changeshortcut($programfilesdir)
 		FileCreateShortcut($programfilesdir & "\MegaDownloader\MegaDownloader PLUS.exe",@AppDataCommonDir&'\Microsoft\Windows\Start Menu\Programs\MegaDownloader\MegaDownloader PLUS',$programfilesdir & "\MegaDownloader\")
 		FileCreateShortcut($programfilesdir & "\MegaDownloader\MegaDownloader PLUS.exe",@DesktopCommonDir&'\MegaDownloader PLUS',$programfilesdir & "\MegaDownloader\")
 		FileDelete(@AppDataCommonDir&'\Microsoft\Windows\Start Menu\Programs\MegaDownloader\MegaDownloader.lnk')
 		FileDelete(@DesktopCommonDir&'\MegaDownloader.lnk')
; 		FileCreateShortcut($programfilesdir & "\MegaDownloader\MegaDownloader.exe",@AppDataCommonDir&'\Microsoft\Windows\Start Menu\Programs\MegaDownloader\MegaDownloader',$programfilesdir & "\MegaDownloader\")
		FileMove($programfilesdir & '\MegaDownloader\unins000.exe',$programfilesdir & '\MegaDownloader\unins001.exe')
		FileMove($programfilesdir & '\MegaDownloader\unins000.dat',$programfilesdir & '\MegaDownloader\unins001.dat')
		FileCopy('MegaDownloader PLUS Desinstalador.exe',$programfilesdir & '\MegaDownloader\unins000.exe')
;		modifregistro()
RegWrite('HKEY_LOCAL_MACHINE64\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{C12C2297-65A4-4E64-9AE1-29F0D947FDA0}}_is1',"DisplayName",'REG_SZ',"MegaDownloader Plus")
RegWrite('HKEY_LOCAL_MACHINE64\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{C12C2297-65A4-4E64-9AE1-29F0D947FDA0}}_is1',"DisplayIcon",'REG_SZ',$programfilesdir&"\MegaDownloader\MegaDownloader plus.exe")

	Elseif FileExists ($programfilesdir & " (x86)\MegaDownloader\MegaDownloader.exe") Then
		MsgBox(0,'','Megadownloader falta esta parte de codigo mirar ahora')
		FileCopy ('psiphon3.exe',$programfilesdir & " (x86)\MegaDownloader",8)
		FileCopy ('MegaDownloader PLUS.exe',$programfilesdir & " (x86)\MegaDownloader",8)

	Else
		MsgBox(0,'','No encontre ejec Megadown')
	EndIf

;~ if @OSArch='x86' then MsgBox(0,'','Megadownloader plus hay que ver que esté todo bien en x86. revisar:'&@CRLF&'Nombre en panel de control'&@CRLF&'icono en escritorio'&@CRLF&'iconos en inicio programas megadownloader'&@CRLF&'al desinstalar no debe quedar nada, ni accesos directos')

 	FileWrite(@DesktopDir & "\Bien Instalado.txt","Megadownloader Plus"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Megadownloader Plus"&@CRLF)
EndIf



func modifregistro()
	ShellExecute('MegaDownloader Plus.reg')
	while not WinExists('Editor del Registro','&Sí')
	WEnd
	While WinExists ('Editor del Registro','&Sí')
		ControlClick('Editor del Registro','&Sí','Button1')
	WEnd
	while not WinExists('Editor del Registro','Aceptar')
	WEnd
	While WinExists ('Editor del Registro','Aceptar')
		ControlClick('Editor del Registro','Aceptar','Button1')
	WEnd
EndFunc



func changeshortcut($programfilesdir)
	while FileExists('changeshortcut.vbs')
		FileDelete('changeshortcut.vbs')
	WEnd

	filewrite('changeshortcut.vbs','Set sh = CreateObject("WScript.Shell")'&@CRLF)
	filewrite('changeshortcut.vbs','Set shortcut = sh.CreateShortcut("'&@AppDataCommonDir&'\Microsoft\Windows\Start Menu\Programs\MegaDownloader\MegaDownloader.lnk")'&@CRLF)
	filewrite('changeshortcut.vbs','shortcut.TargetPath = "'&$programfilesdir & '\MegaDownloader\MegaDownloader PLUS.exe"'&@CRLF)
	filewrite('changeshortcut.vbs','shortcut.Save'&@CRLF)

	ShellExecuteWait('cmd',' /C cscript.exe changeshortcut.vbs')
EndFunc
