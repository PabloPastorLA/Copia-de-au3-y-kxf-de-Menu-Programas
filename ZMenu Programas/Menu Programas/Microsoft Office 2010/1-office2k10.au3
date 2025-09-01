#include <File.au3>
if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Off 2010',160,80,0,110)


If not FileExists (@ProgramFilesDir & "\Microsoft Office\Office14\WINWORD.EXE") Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Microsoft Office 2K10"&@CRLF)

	;ShellExecuteWait('AutoIt3.exe',"Fuentes.au3", "")
if @OSVersion='WIN_7' Then ShellExecuteWait('xcopy',' "Fuentes office\Fonts" "'& @WindowsDir & '\Fonts" /Y /R /H /C')

	regwrite('HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Common\General','ShownFirstRunOptin','REG_DWORD','1')
	regwrite('HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Common\Internet','UseOnlineContent','REG_DWORD','1')

	If @OSArch='X86' then
;~ 		ShellExecuteWait('Instalar x86.BAT')
;~ 		ShellExecuteWait("Office2010x86\SETUP.exe",' /adminfile auto.MSP')
		RunWait("Office2010x86\SETUP.exe /adminfile auto.MSP")
	EndIf
	If @OSArch='X64' then
;~ 		ShellExecuteWait('Instalar x64.BAT')
;~ 		ShellExecuteWait("Office2010x64\SETUP.exe",' /adminfile auto.MSP')
		RunWait("Office2010x64\SETUP.exe /adminfile auto.MSP")
	EndIf

	ProcessWaitClose ('SETUP.EXE')



	RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run","BCSSync")
	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Microsoft SharePoint Workspace Audit Service","Start","REG_DWORD",4)
	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\osppsvc","Start","REG_DWORD",4)
	RegDelete("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run","ctfmon.exe")
	RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\osppsvc','Start','REG_DWORD',4)
	RegWrite('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\osppsvc','Start','REG_DWORD',4)

	regwrite('HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Common\General','ShownFirstRunOptin','REG_DWORD','1')
	regwrite('HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Common\Internet','UseOnlineContent','REG_DWORD','1')
;~ MsgBox(0,'','INSTALE AHORA CORRO ACTIVADOR')


;~ 	ShellExecuteWait('activar.bat')
;~ 	ShellExecuteWait("w7lxe.exe",' /office2010','','',@SW_MINIMIZE )


	$I=0
	While Not WinExists('Alerta de seguridad de Windows') AND $I<6
	   $I=$I+1
	   Sleep(1000)
	WEnd
	IF WinExists('Alerta de seguridad de Windows') Then
	   While WinExists('Alerta de seguridad de Windows')
		  ControlClick('Alerta de seguridad de Windows','&Permitir acceso','Button6')
		  Sleep(2000)
	   WEnd
	EndIf


;~ ;	hasta aca instale, a partir de aca abro y configuro


;~ ;-------------------------------------------
	$ventprog = 0
	If WinExists('Microsoft Office 2010','Programas y tutoriales\Microsoft Office 2010') Then
		$ventprog = 1
		While WinExists('Microsoft Office 2010','Programas y tutoriales\Microsoft Office 2010')
			WinClose('Microsoft Office 2010','Programas y tutoriales\Microsoft Office 2010')
		WEnd
	EndIf
;~ ;-------------------------------------------------

;~ MsgBox(0,'','ejecuto, ahi vamos')
	regwrite('HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Common\General','ShownFirstRunOptin','REG_DWORD','1')
	regwrite('HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Common\Internet','UseOnlineContent','REG_DWORD','1')

	if FileExists(@ProgramFilesDir & "\Microsoft Office\Office14\WINWORD.EXE") Then
;~ 		Run(@ProgramFilesDir & "\Microsoft Office\Office14\WINWORD.EXE")
	Else
		while 1
			MsgBox(0,'','No encuentro ejecutable winword.exe')
		WEnd
	EndIf







;----------			VENTANAS DE ERROR



					 ;ventanas:
					 ;1	WinExists('Microsoft Word','No se puede registrar este documento')
					 ;2	WinExists('Microsoft Word','Memoria o espacio en disco insuficiente')
					 ;3	WinExists("[TITLE:Microsoft Office 2010; CLASS:NUIDialog", "")
					 ;	laa de arriba es la del mouse
;~ 					 $exit=0
;~ 					 while ProcessExists('winword.exe') and $exit<7
;~ 						 sleep(1000)
;~ 						 $exit = $exit + 1

;~ 						 if $exit = 3 or $exit = 9 or $exit = 14 then MsgBox (0,'','Depurando, estoy en el while, cuando complete todas las ventanas en el codigo borro esto')
;~ 						 if WinExists('Microsoft Word','No se puede registrar este documento') then
;~ 							 MsgBox (0,'','error 1, completar codigo')
;~ 							 ControlClick('Microsoft Word','Memoria o espacio en disco insuficiente','Button1')
;~ 							 $exit=0
;~ 						 EndIf
;~ 						 if WinExists('Microsoft Word','Memoria o espacio en disco insuficiente') then
;~ 							 ;MsgBox (0,'','error 2, completar codigo')
;~ 							 ControlClick('Microsoft Word','Memoria o espacio en disco insuficiente','Button1')
;~ 							 $exit=0
;~ 						  EndIf
;~ 						 if WinExists("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]") then
;~ 					 ;~ 		MsgBox (0,'','error 3, completar codigo')
;~ 							 $exit=0
;~ 							 WinActivate("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 WinWaitActive("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 $positionArray = WinGetPos ("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 WinActivate("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 WinWaitActive("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 MouseMove($positionArray[0] + 75 , $positionArray[1] + 280,0)
;~ 							 WinActivate("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 WinWaitActive("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 MouseClick('left')

;~ 							 WinActivate("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 WinWaitActive("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 $positionArray = WinGetPos ("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 WinActivate("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 WinWaitActive("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 MouseMove($positionArray[0] + 700 , $positionArray[1] + 390,0)
;~ 							 WinActivate("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 WinWaitActive("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]")
;~ 							 MouseClick('left')

;~ 							  $ventanita=0
;~ 							  while WinExists("[TITLE:Microsoft Office 2010; CLASS:NUIDialog]") And $ventanita<6
;~ 								 Sleep (1000)
;~ 								 $ventanita=$ventanita+1
;~ 							  WEnd

;~ 						  EndIf
;ventana 4
;~ 						 if WinExists('Alerta de seguridad de Windows','Firewall de Windows bloqueó') then
;~ 							 MsgBox (0,'','error 4, completar codigo')
;~ 							 $exit=0
;~ 						  EndIf
;ventana 5
;~ 						 if WinExists('Asistente para la activación de Microsoft Office') then
;~ 							 MsgBox (0,'','error 5, completar codigo')
;~ 						   WinActivate('Asistente para la activación de Microsoft Office')
;~ 						   WinWaitActive('Asistente para la activación de Microsoft Office')
;~ 						   Send('{altdown}{c}{altup}')
;~ 							 $exit=0
;~ 						  EndIf


;~ 						 SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Off 2010',160,80,0,110)
;~ 						 SplashTextOn('Espera','Autoit corriendo ' & @crlf & '$EXIT<7 '& $exit,160,80,0,110)

;~ 					 wend
;~ 					 MsgBox(0,'','sali del while, aca sigue el codigo como iba antes')




;--------------------------------------------------------------------------




;~ 	While WinExists('Documento1 - Microsoft Word')
;~ 		WinClose('Documento1 - Microsoft Word')
;~ 	 WEnd
;~ 	 While WinExists('Documento1 - Microsoft Word (Error de activación de productos)')
;~ 		WinClose('Documento1 - Microsoft Word (Error de activación de productos)')
;~ 	WEnd




;~ 	if FileExists(@ProgramFilesDir & "\Microsoft Office\Office14\EXCEL.EXE") Then
;~ 		ShellExecute(@ProgramFilesDir & "\Microsoft Office\Office14\EXCEL.EXE")
;~ 	Else
;~ 		while 1
;~ 			MsgBox(0,'','No encuentro ejecutable excel.exe')
;~ 		WEnd
;~ 	EndIf
;~ 		WinWait('Microsoft Excel - Libro1')
;~ 		sleep(2000)
;~ 		$salir=0
;~ 		While ProcessExists ('excel.exe') And $salir<7
;~ 		   $salir = $salir + 1
;~ 		   sleep(1000)
;~ 		   	SplashTextOn('Espera','Autoit corriendo ' & @crlf & '$salir<7 '& $salir,160,80,0,110)
;~ 			if WinExists('Microsoft Excel','Recursos insuficientes para presentar todo.') Then
;~ 			   ControlClick('Microsoft Excel','Recursos insuficientes para presentar todo.','Button1')
;~ 			   $salir=0
;~ 			EndIf
;~ 			if WinExists('Asistente para la activación de Microsoft Office') then
;~ 				  WinActivate('Asistente para la activación de Microsoft Office')
;~ 				  WinWaitActive('Asistente para la activación de Microsoft Office')
;~ 				  Send('{altdown}{c}{altup}')
;~ 				  $salir=0
;~ 			EndIf

;~ 		 WEnd

;~ 		While WinExists ('Microsoft Excel - Libro1')
;~ 			WinClose('Microsoft Excel - Libro1')
;~ 		WEnd
;~ 		While WinExists ('Microsoft Excel (Error de activación de productos) - Libro1')
;~ 			WinClose('Microsoft Excel (Error de activación de productos) - Libro1')
;~ 		WEnd




;--------------------------------------------
;~ 	If $ventprog = 1 Then abrircarpetaoffice2k10()


;ShellExecuteWait('AutoIt3.exe',"ActOff2k.au3", "")


;--------------------------------------------
;TareaProgValOffice2010()


;MsgBox(0,'','office 2k10, termine de instalar. probar abrir, esperar a que aparezca el cartel de memoria ahora, antes de que reinicie')

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Microsoft Office 2K10"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Microsoft Office 2K10"&@CRLF)
EndIf



Func abrircarpetaoffice2k10()


$C = ('C:\Programas y tutoriales\Microsoft Office 2010')
		$D = ('D:\Programas y tutoriales\Microsoft Office 2010')
		$E = ('E:\Programas y tutoriales\Microsoft Office 2010')
		$F = ('F:\Programas y tutoriales\Microsoft Office 2010')
		$G = ('G:\Programas y tutoriales\Microsoft Office 2010')
		$H = ('H:\Programas y tutoriales\Microsoft Office 2010')
		$I = ('I:\Programas y tutoriales\Microsoft Office 2010')
		$J = ('J:\Programas y tutoriales\Microsoft Office 2010')
		$K = ('K:\Programas y tutoriales\Microsoft Office 2010')
		$L = ('L:\Programas y tutoriales\Microsoft Office 2010')
		$M = ('M:\Programas y tutoriales\Microsoft Office 2010')
		$N = ('N:\Programas y tutoriales\Microsoft Office 2010')
		$O = ('O:\Programas y tutoriales\Microsoft Office 2010')
		$P = ('P:\Programas y tutoriales\Microsoft Office 2010')
		$Q = ('Q:\Programas y tutoriales\Microsoft Office 2010')


		if DriveStatus ("C:") <> 'NOTREADY' and  FileExists($C) Then
			shellexecute($C)
		EndIf
		if DriveStatus ("D:") <> 'NOTREADY' and  FileExists($D) Then
			shellexecute($D)
		EndIf
		if DriveStatus ("E:") <> 'NOTREADY' and  FileExists($E) Then
			shellexecute($E)
		EndIf
		if DriveStatus ("F:") <> 'NOTREADY' and  FileExists($F) Then
			shellexecute($F)
		EndIf
		if DriveStatus ("G:") <> 'NOTREADY' and  FileExists($G) Then
			shellexecute($G)
		EndIf
		if DriveStatus ("H:") <> 'NOTREADY' and  FileExists($H) Then
			shellexecute($H)
		EndIf
		if DriveStatus ("I:") <> 'NOTREADY' and  FileExists($I) Then
			shellexecute($I)
		EndIf
		if DriveStatus ("J:") <> 'NOTREADY' and  FileExists($J) Then
			shellexecute($J)
		EndIf
		if DriveStatus ("K:") <> 'NOTREADY' and  FileExists($K) Then
			shellexecute($K)
		EndIf
		if DriveStatus ("L:") <> 'NOTREADY' and  FileExists($L) Then
			shellexecute($L)
		EndIf
		if DriveStatus ("M:") <> 'NOTREADY' and  FileExists($M) Then
			shellexecute($M)
		EndIf
		if DriveStatus ("N:") <> 'NOTREADY' and  FileExists($N) Then
			shellexecute($N)
		EndIf
		if DriveStatus ("O:") <> 'NOTREADY' and  FileExists($O) Then
			shellexecute($O)
		EndIf
		if DriveStatus ("P:") <> 'NOTREADY' and  FileExists($P) Then
			shellexecute($P)
		EndIf
		if DriveStatus ("Q:") <> 'NOTREADY' and  FileExists($Q) Then
			shellexecute($Q)
		EndIf



EndFunc


func TareaProgValOffice2010()
	DirCopy('ActOff2010Reinicio',@HomeDrive&'\ActOff2010Reinicio\',9)
;~ 	FileCopy('ActOff2010Reinicio\autoborrar.bat',@HomeDrive,9)
	ShellExecuteWait('cmd.exe',' /C schtasks /end /TN "Activar Office 2010 y borrar"','','',@SW_HIDE)
	ShellExecuteWait('cmd.exe',' /C schtasks /delete /TN "Activar Office 2010 y borrar" /F','','',@SW_HIDE)

		;	CHEQUEAR USUARIO Y CAMBIAR XML SI ES DISTINTO 	-----------------------------------------

		$Lineaarch=FileReadLine(@HomeDrive&'\ActOff2010Reinicio\Offi2010.xml',15)
		If $Lineaarch='      <UserId>USUARIO-PC\Usuario</UserId>' Then
			$arch=@HomeDrive&'\ActOff2010Reinicio\Offi2010.xml'
			_FileWriteToLine($arch,15,'      <UserId>'&@ComputerName&'\'&@UserName&'</UserId>',True)
		EndIf
		;----------------------------------------------------------------------------------------------

; 	ShellExecuteWait('cmd.exe',' /C schtasks /create /TN "Activar Office 2010 y borrar" /RL HIGHEST /SC ONLOGON /TR "'&"'"&@HomeDrive & '\ActOff2010Reinicio\actoff-32-64.exe'&"'",'','',@SW_HIDE)
	ShellExecuteWait('cmd.exe',' /C schtasks /create /XML '&@HomeDrive&'\ActOff2010Reinicio\Offi2010.xml /TN "Activar Office 2010 y borrar"','','',@SW_HIDE)
EndFunc