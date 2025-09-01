
If FileExists('ddc.exe') Then
$indice= 1
	$ubicacion=ruta()
	While FileExists($ubicacion&'\DRIVERS ACTUALES\'& $indice)
		$indice = $indice + 1
	WEnd



	ShellExecuteWait('ddc.exe',' b /target:"'&$ubicacion&'\DRIVERS ACTUALES\'&$indice&'"')

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Double Drivers Actuales"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Double Drivers Actuales"&@CRLF)
EndIf


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
		$ruta = ('C:')
	EndIf
	if DriveStatus ("D:") <> 'NOTREADY' and  FileExists($D) Then
		$ruta = ('D:')
	EndIf
	if DriveStatus ("E:") <> 'NOTREADY' and  FileExists($E) Then
		$ruta = ('E:')
	EndIf
	if DriveStatus ("F:") <> 'NOTREADY' and  FileExists($F) Then
		$ruta = ('F:')
	EndIf
	if DriveStatus ("G:") <> 'NOTREADY' and  FileExists($G) Then
		$ruta = ('G:')
	EndIf
	if DriveStatus ("H:") <> 'NOTREADY' and  FileExists($H) Then
		$ruta = ('H:')
	EndIf
	if DriveStatus ("I:") <> 'NOTREADY' and  FileExists($I) Then
		$ruta = ('I:')
	EndIf
	if DriveStatus ("J:") <> 'NOTREADY' and  FileExists($J) Then
		$ruta = ('J:')
	EndIf
	if DriveStatus ("K:") <> 'NOTREADY' and  FileExists($K) Then
		$ruta = ('K:')
	EndIf
	if DriveStatus ("L:") <> 'NOTREADY' and  FileExists($L) Then
		$ruta = ('L:')
	EndIf
	if DriveStatus ("M:") <> 'NOTREADY' and  FileExists($M) Then
		$ruta = ('M:')
	EndIf
	if DriveStatus ("N:") <> 'NOTREADY' and  FileExists($N) Then
		$ruta = ('N:')
	EndIf
	if DriveStatus ("O:") <> 'NOTREADY' and  FileExists($O) Then
		$ruta = ('O:')
	EndIf
	if DriveStatus ("P:") <> 'NOTREADY' and  FileExists($P) Then
		$ruta = ('P:')
	EndIf
	if DriveStatus ("Q:") <> 'NOTREADY' and  FileExists($Q) Then
		$ruta = ('Q:')
	EndIf
	Return($ruta)
EndFunc