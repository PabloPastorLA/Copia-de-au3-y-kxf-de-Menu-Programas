;~ $archivo='Hardware Snapshot - 01.txt'
for $i=99 to 1 step -1
	if $i=1 or $i=2 or $i=3 or $i=4 or $i=5 or $i=6 or $i=7 or $i=8 or $i=9 then $i=0&$i
	$archivo='Hardware Snapshot - '&$i&'.txt'
	if FileExists ($archivo) then
		$archivo='Hardware Snapshot - '&0&$i+1&'.txt'
		ExitLoop
	EndIf

Next


cerrar()
abrir()


ControlTreeView('Administrador de dispositivos','','SysTreeView321',"Expand", '#0')
$NVL1=ControlTreeView('Administrador de dispositivos','','SysTreeView321',"GetItemCount", '#0')
;~ MsgBox(0,'',$NVL1)

For $i=0 to $NVL1-1 step 1
	$NVL2=ControlTreeView('Administrador de dispositivos','','SysTreeView321',"GetItemCount", '#0|#'&$i)
;~ 	MsgBox(0,'',$NVL2)

	$TXTNVL1=ControlTreeView('Administrador de dispositivos','','SysTreeView321',"GetText", '#0|#'&$i)
;~ 	MsgBox(0,'',$TXTNVL1)
	FileWriteLine($archivo,$TXTNVL1)

	for $j=0 to $NVL2-1 step 1
		$TXTNVL2='	'&ControlTreeView('Administrador de dispositivos','','SysTreeView321',"GetText", '#0|#'&$i&'|#'&$j)
;~ 		MsgBox(0,'',$TXTNVL2)
		FileWriteLine($archivo,$TXTNVL2)
	Next

	FileWriteLine($archivo,@CRLF)

Next

cerrar()







func cerrar()
	Do
		WinClose('Administrador de dispositivos')
	until not WinExists('Administrador de dispositivos')
EndFunc


func abrir()
	ShellExecute('devmgmt.msc')
	WinWait('Administrador de dispositivos')
	WinActivate('Administrador de dispositivos')
	WinWaitActive('Administrador de dispositivos')
EndFunc
