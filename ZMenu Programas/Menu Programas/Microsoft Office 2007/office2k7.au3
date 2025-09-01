SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Off. 2k7',160,80,0,110)

If FileExists("Microsoft Office 2007\SETUP.exe") AND not FileExists (@ProgramFilesDir & "\Microsoft Office\Office11\WINWORD.EXE") AND not FileExists (@ProgramFilesDir & "\Microsoft Office\Office12\WINWORD.EXE")  Then

	; instalar office 2k7
;~ 	ShellExecuteWait('office2k7.bat')
	ShellExecuteWait("Microsoft Office 2007\SETUP.exe"," /adminfile 1.MSP")
	ProcessWaitClose ('SETUP.EXE')
	;-----------------------
	; Verificar ventanas antes que se cierren
	sleep (1000)
	$ventoff = 0
	$ventprog = 0
	if WinExists('Microsoft Office 2007','Programas y tutoriales') then $ventoff = 1
	if WinExists('Programas y tutoriales',':\Programas y tutoriales') then $ventprog = 1


	; instalar SP3
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Off. 2k7 SP3',160,80,0,110)
;~ 	ShellExecuteWait('2k7sp3.bat')
	ShellExecuteWait('msiexec.exe',' /update SP3\MAINWWsp3.msp /quiet /norestart')







	ProcessWait('explorer.exe')
	if $ventoff = 1 Then ShellExecute(ruta()&'\Microsoft Office 2007')
	if $ventprog = 1 Then ShellExecute(ruta())
	Sleep(2000)

	; instalar Complemento PDF
;~ 	ShellExecuteWait('SaveAsPDFandXPS.bat')
	ShellExecuteWait("msiexec.exe",' /i "SaveAsPDFandXPS\ExPdfXps.msi" /qb')






	;---------------------------


	RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run","GrooveMonitor")
	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Microsoft Office Groove Audit Service","Start","REG_DWORD","00000004")
	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\odserv","Start","REG_DWORD","00000004")
	RegDelete("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run","ctfmon.exe")
	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MDM", "Start", "REG_DWORD", 4)
	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ose", "Start", "REG_DWORD", 4)
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Office\12.0\Common\Internet", "UseOnlineContent", "REG_DWORD", 1)

	;--------------------------------------------------------------------
;~ 	;~ ;abrir cerrar vent y cerrar
	sleep(2000)
	ShellExecute (@ProgramFilesDir & "\Microsoft Office\Office12\WINWORD.EXE")
	While not WinExists ('2007 Microsoft Office system') And not WinExists ('Documento1 - Microsoft Word')
		Sleep(200)
	WEnd
	$i = 0
	while not WinExists ('2007 Microsoft Office system') and $i < 10
		sleep (1000)
		$i = $i + 1
	WEnd
	if WinExists ('2007 Microsoft Office system') Then
		cerrarvent()
	EndIf
	WinWait ('Documento1 - Microsoft Word')
	ProcessClose('winword.exe')
	ProcessWaitClose('winword.exe')
;~ 	;--------------------------------------------------------------------

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Microsoft Office 2K7 + SP3"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Microsoft Office 2K7 + SP3"&@CRLF)
EndIf


func cerrarvent()
	WinActivate ('2007 Microsoft Office system')
	WinWaitActive ('2007 Microsoft Office system')
	send("{altdown}{s}{altup}")
$exit=0
	While WinExists ('2007 Microsoft Office system') and $exit<3
		sleep(1000)
		$exit=$exit+1
	WEnd

	if WinExists ('2007 Microsoft Office system') Then
		WinActivate ('2007 Microsoft Office system')
		WinWaitActive ('2007 Microsoft Office system')
		send("{altdown}{n}{altup}")
		send("{altdown}{f}{altup}")
	EndIf
	$exit=0
	While WinExists ('2007 Microsoft Office system') and $exit<10
		sleep(1000)
		$exit=$exit+1
	WEnd
	if WinExists('2007 Microsoft Office system') Then cerrarvent()
EndFunc



func ruta()
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
	if DriveStatus ("C:") <> 'NOTREADY' and  FileExists($C) Then
		$ruta = ($C)
	EndIf
	if DriveStatus ("D:") <> 'NOTREADY' and  FileExists($D) Then
		$ruta = ($D)
	EndIf
	if DriveStatus ("E:") <> 'NOTREADY' and  FileExists($E) Then
		$ruta = ($E)
	EndIf
	if DriveStatus ("F:") <> 'NOTREADY' and  FileExists($F) Then
		$ruta = ($F)
	EndIf
	if DriveStatus ("G:") <> 'NOTREADY' and  FileExists($G) Then
		$ruta = ($G)
	EndIf
	if DriveStatus ("H:") <> 'NOTREADY' and  FileExists($H) Then
		$ruta = ($H)
	EndIf
	if DriveStatus ("I:") <> 'NOTREADY' and  FileExists($I) Then
		$ruta = ($I)
	EndIf
	if DriveStatus ("J:") <> 'NOTREADY' and  FileExists($J) Then
		$ruta = ($J)
	EndIf
	if DriveStatus ("K:") <> 'NOTREADY' and  FileExists($K) Then
		$ruta = ($K)
	EndIf
	if DriveStatus ("L:") <> 'NOTREADY' and  FileExists($L) Then
		$ruta = ($L)
	EndIf
	if DriveStatus ("M:") <> 'NOTREADY' and  FileExists($M) Then
		$ruta = ($M)
	EndIf
	if DriveStatus ("N:") <> 'NOTREADY' and  FileExists($N) Then
		$ruta = ($N)
	EndIf
	if DriveStatus ("O:") <> 'NOTREADY' and  FileExists($O) Then
		$ruta = ($O)
	EndIf
	if DriveStatus ("P:") <> 'NOTREADY' and  FileExists($P) Then
		$ruta = ($P)
	EndIf
	if DriveStatus ("Q:") <> 'NOTREADY' and  FileExists($Q) Then
		$ruta = ($Q)
	EndIf
	Return($ruta)
EndFunc


