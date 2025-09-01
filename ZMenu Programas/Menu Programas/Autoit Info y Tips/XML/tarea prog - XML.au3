#include <File.au3>

CrearTareaProg()

func CrearTareaProg()

	$nombretareaprog='CMD'			;	nombre tarea prog
	$xml='ejemplo.xml'						;	ubicacion archivo xml sobre el cual se trabaja

	$comm=@WindowsDir&'\system32\cmd.exe'	;	que se ejecuta
	$arg='/k cmd /k'							;	argumentos
	$workdir=@WindowsDir&'\system'		;	directorio en donde se inicia


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

;ARGUMEMNTO
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