#include <File.au3>
#RequireAdmin
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Off 2016',160,80,0,110)









If not FileExists (@ProgramFilesDir & "\Microsoft Office\root\office16\WINWORD.EXE") Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Microsoft Office 2K16"&@CRLF)

	$vent=ventanas()

	If @OSArch='X86' then
		ShellExecuteWait("setup.exe"," /configure configuration.xml",'2016 - x32');,'',@SW_HIDE)
	EndIf

	If @OSArch='X64' then
		ShellExecuteWait("setup.exe"," /configure configuration.xml",'2016 - x64');,'',@SW_HIDE)
	EndIf

	ProcessWaitClose ('SETUP.EXE')
;	ventanas2()



;~ MsgBox(0,'','Primer prueba de abrir ventanascerrar')
;~ 	AbrirVentanasCerrar()
;~ MsgBox(0,'','segunda prueba de abrir ventanascerrar')
;~ 	AbrirVentanasCerrar()
;~ MsgBox(0,'','termine prueba de abrir ventanascerrar')



;MsgBox(0,'','ahora sigo con validar')

MsgBox(0,'','off vent ')

	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Off 2016 Validar',160,80,0,110)
	If @OSArch='X86' Then
		AbrirVentanasCerrar()
		ShellExecuteWait('AutoIt3.exe',"ActOff2k.au3")
		AbrirVentanasCerrar()
		ShellExecuteWait('AutoIt3.exe',"ActOff2k.au3")

	ElseIf @OSArch='X64' Then
		AbrirVentanasCerrar()
		ShellExecuteWait('AutoIt3_x64.exe',"ActOff2k.au3")
		AbrirVentanasCerrar()
		ShellExecuteWait('AutoIt3_x64.exe',"ActOff2k.au3")
	EndIf


	sacarservicios()

;~ 	FileWrite(@DesktopDir & "\Falta validar Office 2K13-2K16.txt",'')


;	TareaProgValOffice20132016()

;~ 	copiarValOffice20132016()
;~ 	If not ProcessExists('Menu.exe') then
;~ 		$rta=MsgBox(4,'Validar Office 2013-2016','Desea validar ahora? Es necesario estar conectado a internet.')
;~ 		if $rta=6 then $rta=MsgBox(4,'Validar Office 2013-2016','Esta seguro? Verifique internet antes de proseguir.')
;~ 		if $rta=6 then ShellExecuteWait("ActOff20132016 - Launcher.exe",'',@HomeDrive&'\ActOff20132016')
;~ 	EndIf


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Microsoft Office 2K16"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Microsoft Office 2K16"&@CRLF)
EndIf


func sacarservicios()

;	MsgBox(0,'Office 2016','Hasta aca instalé y valide todo. abrir word y verificar que funciones y este validado')
;	MsgBox(0,'Office 2016','voy a modificar servicios. darle aceptar y ver que cambien')
	If RegRead("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ose64", "Start")=3 Then RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ose64", "Start", "REG_DWORD", 4)
	If RegRead("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ose", "Start")=3 Then RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ose", "Start", "REG_DWORD", 4)
;ESTE SIEMPRE TIENE QUE CORRER, SINÓ FALLA	If RegRead("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClickToRunSvc", "Start")=2 Then RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClickToRunSvc", "Start", "REG_DWORD", 4)
;	MsgBox(0,'','ya modifique servicios. ver que cambiaron ahora.')
;	if @OSArch='X86' then 	MsgBox(0,'','ver servicios office. en x86 no los modifique')


EndFunc


Func ventanas()
	$ventoff = 0
	$ventprog = 0
	If WinExists('Microsoft Office 2016','Programas y tutoriales\Microsoft Office 2016') Then $ventoff = 1
	If WinExists('Programas y tutoriales') Then $ventprog = 2
	Return $ventoff + $ventprog
EndFunc

Func ventanas2()

	if $vent= 0 Then $ventoff=0
	if $vent= 0 Then $ventprog=0

	if $vent= 1 Then $ventoff=1
	if $vent= 1 Then $ventprog=0

	if $vent= 2 Then $ventoff=0
	if $vent= 2 Then $ventprog=1

	if $vent= 3 Then $ventoff=1
	if $vent= 3 Then $ventprog=1

	$C = ('C:\Programas y tutoriales')
	$D = ('D:\Programas y tutoriales')
	$E = ('E:\Programas y tutoriales')
	$F = ('F:\Programas y tutoriales')
	$G = ('G:\Programas y tutoriales')
	$H = ('H:\Programas y tutoriales')
	$I = ('I:\Programas y tutoriales')
	$J = ('J:\Programas y tutoriales')
	$K = ('K:\Programas y tutoriales')
	$L = ('L:\Programas y tutoriales')
	$M = ('M:\Programas y tutoriales')
	$N = ('N:\Programas y tutoriales')
	$O = ('O:\Programas y tutoriales')
	$P = ('P:\Programas y tutoriales')
	$Q = ('Q:\Programas y tutoriales')


	if DriveStatus ("C:") <> 'NOTREADY' and  FileExists($C) and $ventoff = 1 Then shellexecute($C & '\Microsoft Office 2016','','','',@SW_MINIMIZE)
	if DriveStatus ("D:") <> 'NOTREADY' and  FileExists($D) and $ventoff = 1 Then shellexecute($D & '\Microsoft Office 2016','','','',@SW_MINIMIZE)
	if DriveStatus ("E:") <> 'NOTREADY' and  FileExists($E) and $ventoff = 1 Then shellexecute($E & '\Microsoft Office 2016','','','',@SW_MINIMIZE)
	if DriveStatus ("F:") <> 'NOTREADY' and  FileExists($F) and $ventoff = 1 Then shellexecute($F & '\Microsoft Office 2016','','','',@SW_MINIMIZE)
	if DriveStatus ("G:") <> 'NOTREADY' and  FileExists($G) and $ventoff = 1 Then shellexecute($G & '\Microsoft Office 2016','','','',@SW_MINIMIZE)
	if DriveStatus ("H:") <> 'NOTREADY' and  FileExists($H) and $ventoff = 1 Then shellexecute($H & '\Microsoft Office 2016','','','',@SW_MINIMIZE)
	if DriveStatus ("I:") <> 'NOTREADY' and  FileExists($I) and $ventoff = 1 Then shellexecute($I & '\Microsoft Office 2016','','','',@SW_MINIMIZE)
	if DriveStatus ("J:") <> 'NOTREADY' and  FileExists($J) and $ventoff = 1 Then shellexecute($J & '\Microsoft Office 2016','','','',@SW_MINIMIZE)
	if DriveStatus ("K:") <> 'NOTREADY' and  FileExists($K) and $ventoff = 1 Then shellexecute($K & '\Microsoft Office 2016','','','',@SW_MINIMIZE)
	if DriveStatus ("L:") <> 'NOTREADY' and  FileExists($L) and $ventoff = 1 Then shellexecute($L & '\Microsoft Office 2016','','','',@SW_MINIMIZE)
	if DriveStatus ("M:") <> 'NOTREADY' and  FileExists($M) and $ventoff = 1 Then shellexecute($M & '\Microsoft Office 2016','','','',@SW_MINIMIZE)
	if DriveStatus ("N:") <> 'NOTREADY' and  FileExists($N) and $ventoff = 1 Then shellexecute($N & '\Microsoft Office 2016','','','',@SW_MINIMIZE)
	if DriveStatus ("O:") <> 'NOTREADY' and  FileExists($O) and $ventoff = 1 Then shellexecute($O & '\Microsoft Office 2016','','','',@SW_MINIMIZE)
	if DriveStatus ("P:") <> 'NOTREADY' and  FileExists($P) and $ventoff = 1 Then shellexecute($P & '\Microsoft Office 2016','','','',@SW_MINIMIZE)
	if DriveStatus ("Q:") <> 'NOTREADY' and  FileExists($Q) and $ventoff = 1 Then shellexecute($Q & '\Microsoft Office 2016','','','',@SW_MINIMIZE)

	if DriveStatus ("C:") <> 'NOTREADY' and  FileExists($C) and $ventprog = 1 Then shellexecute($C,'','','',@SW_MINIMIZE)
	if DriveStatus ("D:") <> 'NOTREADY' and  FileExists($D) and $ventprog = 1 Then shellexecute($D,'','','',@SW_MINIMIZE)
	if DriveStatus ("E:") <> 'NOTREADY' and  FileExists($E) and $ventprog = 1 Then shellexecute($E,'','','',@SW_MINIMIZE)
	if DriveStatus ("F:") <> 'NOTREADY' and  FileExists($F) and $ventprog = 1 Then shellexecute($F,'','','',@SW_MINIMIZE)
	if DriveStatus ("G:") <> 'NOTREADY' and  FileExists($G) and $ventprog = 1 Then shellexecute($G,'','','',@SW_MINIMIZE)
	if DriveStatus ("H:") <> 'NOTREADY' and  FileExists($H) and $ventprog = 1 Then shellexecute($H,'','','',@SW_MINIMIZE)
	if DriveStatus ("I:") <> 'NOTREADY' and  FileExists($I) and $ventprog = 1 Then shellexecute($I,'','','',@SW_MINIMIZE)
	if DriveStatus ("J:") <> 'NOTREADY' and  FileExists($J) and $ventprog = 1 Then shellexecute($J,'','','',@SW_MINIMIZE)
	if DriveStatus ("K:") <> 'NOTREADY' and  FileExists($K) and $ventprog = 1 Then shellexecute($K,'','','',@SW_MINIMIZE)
	if DriveStatus ("L:") <> 'NOTREADY' and  FileExists($L) and $ventprog = 1 Then shellexecute($L,'','','',@SW_MINIMIZE)
	if DriveStatus ("M:") <> 'NOTREADY' and  FileExists($M) and $ventprog = 1 Then shellexecute($M,'','','',@SW_MINIMIZE)
	if DriveStatus ("N:") <> 'NOTREADY' and  FileExists($N) and $ventprog = 1 Then shellexecute($N,'','','',@SW_MINIMIZE)
	if DriveStatus ("O:") <> 'NOTREADY' and  FileExists($O) and $ventprog = 1 Then shellexecute($O,'','','',@SW_MINIMIZE)
	if DriveStatus ("P:") <> 'NOTREADY' and  FileExists($P) and $ventprog = 1 Then shellexecute($P,'','','',@SW_MINIMIZE)
	if DriveStatus ("Q:") <> 'NOTREADY' and  FileExists($Q) and $ventprog = 1 Then shellexecute($Q,'','','',@SW_MINIMIZE)

EndFunc



Func AbrirVentanasCerrar()
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Off 2016 Ventanas',160,80,0,110)

	ShellExecute('test.docx')

	while not WinExists('test - Microsoft Word') and not WinExists('test - Word') and not WinExists('Word') and not WinExists('Microsoft Word')
		Sleep(300)
	WEnd

	$exit=0
;	while (WinExists('test - Word') or WinExists('Word') or WinExists('Microsoft Word')) and $exit < 20
	while $exit < 30
		SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Off 2016 '&$exit&' de 30',160,80,0,110)




		WinActivate('test - Microsoft Word')
		WinActivate('test - Word')
		WinActivate('Word')
		WinActivate('Microsoft Word')
		Send('{esc}')




		Sleep(1000)
		$exit=$exit+1
		if WinExists('Cuentas') or WinExists('Iniciar sesión') then
			$exit=10
			WinClose('Iniciar sesión')	;OFFICE 2013
			WinClose('Cuentas')			;OFFICE 2016
		EndIf
		if WinExists('Lo primero es lo primero.') Then
			$exit=10
			WinActivate('Lo primero es lo primero.')
			WinWaitActive('Lo primero es lo primero.')
			Send('{altdown}{u}{a}{altup}')
		EndIf
		if WinExists('Microsoft Office 2013','NUIDocumentWindow') then
			$exit=10
			WinClose('Microsoft Office 2013','NUIDocumentWindow')
		EndIf
		if WinExists('Asistente para la activación de Microsoft Office') Then
			$exit=10
			WinClose('Asistente para la activación de Microsoft Office')
		EndIf
	WEnd
;~ 	if WinExists('test - Word') then WinActivate('test - Word')
;~ 	if WinExists('test - Word') then WinWaitActive('test - Word')
;~ 	if WinExists('Word') then WinActivate('Word')
;~ 	if WinExists('Word') then WinWaitActive('Word')
;~ 	if WinExists('Microsoft Word') then WinActivate('Microsoft Word')
;~ 	if WinExists('Microsoft Word') then WinWaitActive('Microsoft Word')
;	Send('{ctrldown}{n}{ctrlup}')
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Off 2016 5 seg',160,80,0,110)
	Sleep(5000)

	while WinExists('test - Microsoft Word') or WinExists('test - Word'); or WinExists('Word') or WinExists('Microsoft Word') or WinExists('Documento1 - Word')
		WinClose('test - Microsoft Word')
		WinClose('test - Word')
	WEnd
EndFunc




func TareaProgValOffice20132016()
	DirCopy('ActOff20132016',@HomeDrive&'\ActOff20132016\',9)

	ShellExecuteWait('cmd.exe',' /C schtasks /end /TN "Activar Office 2013-2016 y borrar"','','',@SW_HIDE)
	ShellExecuteWait('cmd.exe',' /C schtasks /delete /TN "Activar Office 2013-2016 y borrar" /F','','',@SW_HIDE)

		;	CHEQUEAR USUARIO Y CAMBIAR XML SI ES DISTINTO 	-----------------------------------------

		$Lineaarch=FileReadLine(@HomeDrive&'\ActOff20132016\Offi20132016.xml',15)
		If $Lineaarch='      <UserId>USUARIO-PC\Usuario</UserId>' Then
			$arch=@HomeDrive&'\ActOff20132016\Offi20132016.xml'
			_FileWriteToLine($arch,15,'      <UserId>'&@ComputerName&'\'&@UserName&'</UserId>',True)
		EndIf
		;----------------------------------------------------------------------------------------------

	ShellExecuteWait('cmd.exe',' /C schtasks /create /XML '&@HomeDrive&'\ActOff20132016\Offi20132016.xml /TN "Activar Office 2013-2016 y borrar"','','',@SW_HIDE)
EndFunc


func copiarValOffice20132016()
	DirCopy('ActOff20132016',@HomeDrive&'\ActOff20132016\',9)
EndFunc