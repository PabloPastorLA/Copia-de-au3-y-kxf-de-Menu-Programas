#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Netf W8-10',160,80,0,110)

$dir1='W8x32'
$dir2='W8x64'
$dir3='W10x32'
$dir4='W10x64'
$dir5='sxsW10x32LTSC2019'
$dir6='sxsW10x64LTSC2019'
$dir7='sxsW10x32LTSC2021'
$dir8='sxsW10x64LTSC2021'

$ok=1
For $i=1 to 8 step 1
	if not FileExists (Eval('dir' & $i)) then $ok=0
Next



$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)




If $ok and not FileExists ($ProgramFilesDir&'\MenuInstalado\N35W810') Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Net F. 3.5 W8.1 W10"&@CRLF)
	borrar()

	if @OSVersion='WIN_10' then
		if RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion','ProductName') = 'Windows 10 Enterprise LTSC 2019' then
			W10LTSC2019()
		ElseIf RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion','ProductName') = 'Windows 10 Enterprise LTSC 2021 Evaluation' or RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion','ProductName') = 'Windows 10 Enterprise LTSC 2021' Then
			W10LTSC2021()
		else
			W10CLASICO()
		EndIf

	ElseIf @OSVersion='WIN_81' Then
		W81()
	Else
		MsgBox(0,'','NET3.5 W8-10 Error GENERAL (puede ser 8 en lugar de 8.1)'&@CRLF&'Cerrando.')
		Exit
	EndIf



	DirCreate($ProgramFilesDir&'\MenuInstalado')
	FileWrite($ProgramFilesDir&'\MenuInstalado\N35W810','')

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Net F. 3.5 W8.1 W10"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Net framework 3.5 w8.1 w10"&@CRLF)
EndIf

func W10LTSC2019()
	if @OSArch='x86' Then
		ShellExecuteWait('cmd.exe',' /C DISM /Online /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:.\sxsW10x32LTSC2019 >> loginst.txt','','');,@SW_HIDE)
		verificar()
	ElseIf @OSArch='x64' Then
		ShellExecuteWait('cmd.exe',' /C DISM /Online /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:.\sxsW10x64LTSC2019 >> loginst.txt','','');,@SW_HIDE)
		verificar()
	Else
		MsgBox(0,'','NET3.5 W8-10 Error en arquitectura W10'&@CRLF&'Cerrando.')
		exit
	EndIf
EndFunc

func W10LTSC2021()

	if @OSArch='x86' Then
		ShellExecuteWait('cmd.exe',' /C DISM /Online /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:.\sxsW10x32LTSC2021 >> loginst.txt','','');,@SW_HIDE)
		verificar()
	ElseIf @OSArch='x64' Then
		ShellExecuteWait('cmd.exe',' /C DISM /Online /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:.\sxsW10x64LTSC2021 >> loginst.txt','','');,@SW_HIDE)
		verificar()
	Else
		MsgBox(0,'','NET3.5 W8-10 Error en arquitectura W10'&@CRLF&'Cerrando.')
		Exit
	EndIf
EndFunc

func W10CLASICO()
	MsgBox(0,'','netframewoirk 3.5 w8 w10 faltta codigo de productname. cerrando')
	Exit
	if @OSArch='x86' Then
		ShellExecuteWait('cmd.exe',' /C DISM /Online /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:.\W10x32 >> loginst.txt','','');,@SW_HIDE)
		verificar()
	ElseIf @OSArch='x64' Then
		ShellExecuteWait('cmd.exe',' /C DISM /Online /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:.\W10x64 >> loginst.txt','','');,@SW_HIDE)
		verificar()
	Else
		MsgBox(0,'','NET3.5 W8-10 Error en arquitectura W10'&@CRLF&'Cerrando.')
		Exit
	EndIf
EndFunc

Func W81()
	if @OSArch='x86' Then
		ShellExecuteWait('cmd.exe',' /C DISM /Online /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:.\W8x32 >> loginst.txt','','');,@SW_HIDE)
		verificar()
	ElseIf @OSArch='x64' Then
		ShellExecuteWait('cmd.exe',' /C DISM /Online /Enable-Feature /FeatureName:NetFx3 /All /LimitAccess /Source:.\W8x64 >> loginst.txt','','');,@SW_HIDE)
		verificar()
	Else
		MsgBox(0,'','NET3.5 W8-10 Error en arquitectura W8'&@CRLF&'Cerrando.')
		Exit
	EndIf
EndFunc


func borrar()
	While FileExists('loginst.txt')
	Sleep(500)
	FileDelete('loginst.txt')
	WEnd
EndFunc

func verificar()
	$file=FileOpen('loginst.txt')
	$OK=1
	for $i=0 to _FileCountLines('loginst.txt') step 1
		if FileReadLine($file,$i) = 'The operation completed successfully.' Then $OK=0;MsgBox(0,'','')
		if FileReadLine($file,$i) = 'La operaci¢n se complet¢ correctamente.' Then $OK=0;MsgBox(0,'','')
	Next
	FileClose($file)

	While $OK
		MsgBox(0,'','Falla al instalar Net 3.5 W8-W10, revisar archivo loginst.txt'&@CRLF&'Cerrando.')
		Exit
	WEnd
	if $OK=0 then borrar()	;		<=======	ULTIMA MODIF. SI FALLA PROBAR SACAR ESTE
EndFunc
