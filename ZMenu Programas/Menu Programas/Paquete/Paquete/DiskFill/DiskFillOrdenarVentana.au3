#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#RequireAdmin
;Reviso linea de COMANDOS
If $CmdLine[0] > 0 Then
Else
;	MsgBox(0,'DiskFillOrdenarVentana','Falta parametro. cerrando',2)
;	Exit
EndIf

;$win=$CmdLine[1]
$win='C:\Windows\System32\cmd.exe'
;~ MsgBox(0,'DiskFillOrdenarVentana',$win)
$exit=0
Do
	$exit=$exit+1
	Sleep(10)
Until $win<>WinGetTitle("[active]") or $exit>=100
Sleep(100)

$win='C:\Windows\System32\cmd.exe'
$exit=0
Do
	$exit=$exit+1
	Sleep(10)
until WinExists($win) or $exit>=300

;MsgBox(0,'DiskFillOrdenarVentana',$win)

WinActivate($win)
for $i=1 to 20
	Sleep(100)
	if @OSVersion<>'WIN_7' and WinExists($win) then WinMove($win,'',@DesktopWidth-188,(@DesktopHeight)/2-75,377,87)
	if @OSVersion= 'WIN_7' and WinExists($win) then WinMove($win,'',@DesktopWidth-188,(@DesktopHeight)/2-67,677,72)
	if WinExists($win) Then
		$pos=WinGetPos($win)
		if $pos[3] < 100 then ExitLoop
	EndIf
Next

WinSetOnTop($win,'',1)
WinSetOnTop('DiskFill','Cerrar Todo',1)
WinSetOnTop('DummyCMD ->','',1)

;~ Size:	381, 83

;~ Size:	677, 90


;~ C:\Windows\System32\cmd.exe
;~ Class:	ConsoleWindowClass
;~ Position:	635, 233
;~ Size:	677, 90
;~ Style:	0x14EF0000
;~ ExStyle:	0x00040310
;~ Handle:	0x000000000

;~ dow <<<<
;~ Title:	C:\Windows\System32\cmd.exe
;~ Class:	ConsoleWindowClass
;~ Position:	635, 233
;~ Size:	677, 78
;~ Style:	0x14EF0000
;~ ExStyle:	0x00040310
;~ Handle:	0x00000000000305C4