#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#RequireAdmin
$Fecha=''
$linea1='Nombre de tarea:          \Halted'
$linea2='Estado:                   Listo'
$Tareaok=0
while FileExists(@WindowsDir&'\Halted\H.txt')
	FileDelete(@WindowsDir&'\Halted\H.txt')
WEnd
ShellExecuteWait('cmd.exe',' /c schtasks /query /FO list >> '&@WindowsDir&'\Halted\H.txt','','',@SW_HIDE)
$arch=FileOpen(@WindowsDir&'\Halted\H.txt')
For $i=0 to 1000 step 1
	if FileReadLine($arch,$i) =$linea1 and FileReadLine($arch,$i+2) =$linea2 then $Tareaok=1
Next
FileClose($arch)
while FileExists(@WindowsDir&'\Halted\H.txt')
	FileDelete(@WindowsDir&'\Halted\H.txt')
WEnd

$arch=FileOpen(@WindowsDir&'\Halted\0day')
$Fecha=FileReadLine($arch,1)

If FileExists(@WindowsDir&'\Halted\0day') And FileExists(@WindowsDir&'\Halted\Halted.exe') and $Tareaok=1 Then
	MsgBox(0,'','Todo OK')
	MsgBox(0,'','Fecha: '&$Fecha)
Else
	MsgBox(0,'','Algo esta mal que no esta bien')
EndIf

;~ MsgBox(0,'','Fecha: '&$Fecha)
;~ 	ok
;~ Else
;~ 	falla
;~
;~ s


