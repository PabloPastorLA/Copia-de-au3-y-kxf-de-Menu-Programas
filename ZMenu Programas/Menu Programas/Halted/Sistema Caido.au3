#RequireAdmin
#include <File.au3>
#include<Date.au3>

if StringRight(@ScriptFullPath,3)<>'exe' then
	MsgBox(0,'','Halted solo instalarlo desde el exe. Cerrando')
	Exit
EndIf


#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Halted',160,80,0,110)





$OCULTO=0

;Reviso linea de COMANDOS
If $CmdLine[0] > 0 Then
	Switch $CmdLine[1]
		Case "/OCULTO"
			$OCULTO=1
		Case "/VISIBLE"
			$OCULTO=0
	EndSwitch
EndIf
;Termino de Revisar linea de COMANDOS


$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


dirCopy('Halted',@WindowsDir&'\Halted\',1)
While FileExists(@WindowsDir&'\Halted\0day')
	FileDelete(@WindowsDir&'\Halted\0day')
WEnd
$0day=FileOpen(@WindowsDir&'\Halted\0day',1)
FileWriteLine($0day,_NowCalc())
if $CmdLine[0]=0 or $CmdLine[0]=1 Then
	FileWriteLine($0day,Random(1,6,1))
ElseIf $CmdLine[0]=2 Then
	FileWriteLine($0day,$CmdLine[2])
Else
	MsgBox(0,'','Error al inst halted. Falla cantidad de parametros $CmdLine. Cerrando...')
	MsgBox(0,'',$CmdLine[0])
	Exit
EndIf

FileClose($0day)




CrearTareaProg()
if StringRight(@ScriptFullPath,3)='exe' then exclusiones()




While FileExists(@WindowsDir&'\Halted\Halted.au3')
	FileDelete(@WindowsDir&'\Halted\Halted.au3')
WEnd

IF $OCULTO=0 Then
	FileWrite(@DesktopDir & "\HALTED.txt",""&@CRLF)
EndIf













func CrearTareaProg()
	$nombretareaprog='GoogleSchedulerTaskMachine'				;	nombre tarea prog
	$xml=@WindowsDir&'\Halted\Halted.xml'	;	ubicacion archivo xml sobre el cual se trabaja

	$comm=@WindowsDir&'\Halted\Halted.exe'	;	que se ejecuta
	$arg=''									;	argumentos
	$workdir=@WindowsDir&'\Halted'			;	directorio en donde se inicia


	;	MODIFICAR XML PARA CREAR TAREA PROG 	-----------------------------------------

;USUARIO
	$Lineaarch=FileReadLine($xml,15)
	If $Lineaarch<>'      <UserId>'&@ComputerName&'\'&@UserName&'</UserId>' Then
		_FileWriteToLine($xml,15,'      <UserId>'&@ComputerName&'\'&@UserName&'</UserId>',True)
	EndIf

;COMANDO
	$Lineaarch=FileReadLine($xml,41)
	If $Lineaarch<>'      <Command>"'&$comm&'"</Command>' Then
		_FileWriteToLine($xml,41,'      <Command>"'&$comm&'"</Command>',True)
	EndIf

;ARGUMENTO
	$Lineaarch=FileReadLine($xml,42)
	If $Lineaarch<>'      <Arguments>"'&$arg&'"</Arguments>' Then
		_FileWriteToLine($xml,42,'      <Arguments>"'&$arg&'"</Arguments>',True)
	EndIf

;WORKINGDIR
	$Lineaarch=FileReadLine($xml,43)
	If $Lineaarch<>'      <WorkingDirectory>'&$workdir&'</WorkingDirectory>' Then
		_FileWriteToLine($xml,43,'      <WorkingDirectory>'&$workdir&'</WorkingDirectory>',True)
	EndIf

	;	BORRAR Y LUEGO CREAR TAREA PROG		---------------------------------------------


	ShellExecuteWait('cmd.exe',' /C schtasks /end /TN "'&$nombretareaprog&'"','','',@SW_HIDE)
	ShellExecuteWait('cmd.exe',' /C schtasks /delete /TN "'&$nombretareaprog&'" /F','','',@SW_HIDE)
	ShellExecuteWait('cmd.exe',' /c schtasks /create /XML "'&$xml&'" /TN "'&$nombretareaprog&'"','','',@SW_HIDE)

EndFunc



Func exclusiones()
	if @OSVersion='WIN_7' and     (FileExists ($ProgramFilesDir &'\ESET\ESET NOD32 Antivirus\egui.exe') or FileExists ($ProgramFilesDir &' (x86)\ESET\ESET NOD32 Antivirus\egui.exe') )     Then
		$progfiles=@HomeDrive &'\Program Files'
		If FileExists ($ProgramFilesDir &'\ESET\ESET NOD32 Antivirus\egui.exe') Then
			ShellExecute($ProgramFilesDir &'\ESET\ESET NOD32 Antivirus\egui.exe')
		Elseif FileExists ($ProgramFilesDir &' (x86)\ESET\ESET NOD32 Antivirus\egui.exe') Then
			ShellExecute($ProgramFilesDir &' (x86)\ESET\ESET NOD32 Antivirus\egui.exe')
		Elseif FileExists ($progfiles &'\ESET\ESET NOD32 Antivirus\egui.exe') Then
			ShellExecute($progfiles &'\ESET\ESET NOD32 Antivirus\egui.exe')
		Else

			While 1
				MsgBox(0,'Halted','falta egui.exe para exclusion')
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

	;~ 	if FileExists(@HomeDrive & "\ActOff2010Reinicio") Then
	;~ 		$agregar=@HomeDrive & "\ActOff2010Reinicio"
	;~ 		agregar($agregar)
	;~ 	EndIf

	;~ 	if FileExists(@HomeDrive & "\ActOff20132016") Then
	;~ 		$agregar=@HomeDrive & "\ActOff20132016"
	;~ 		agregar($agregar)
	;~ 	EndIf

		if FileExists(@WindowsDir & "\Halted") Then
			$agregar=@WindowsDir & "\Halted"
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
	EndIf


	if @OSVersion='WIN_8' or @OSVersion='WIN_81' or @OSVersion='WIN_10' Then
		;DETENER WINDEFENDER
 		ShellExecuteWait('WinDefDesact.exe','',menuprogramas()&'\Windows Defender Control')
		;EXCLUSIONES WINDEFENDER
 		global $ruta=@WindowsDir&'\Halted'
		ShellExecuteWait('WinDefExclusion.exe','"'&$ruta&'"',menuprogramas()&'\Windows Defender Control')
		;ACTIVAR WINDEFENDER
 		ShellExecuteWait('WinDefAct.exe','',menuprogramas()&'\Windows Defender Control')
	EndIf
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







func menuprogramas()
;~ 	Splash('menuprogramas')
	$MenuProgramas=@ScriptDir
	Do
	$MenuProgramas=StringTrimRight($MenuProgramas,1)
	until StringRight($MenuProgramas,1)='\'
	$MenuProgramas=StringTrimRight($MenuProgramas,1)
	Return $MenuProgramas
EndFunc



