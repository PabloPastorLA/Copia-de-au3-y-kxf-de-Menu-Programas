if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf

$exit=0
while $exit<61
	Sleep (100)
	If WinExists('DAMN NFO Viewer') Then
		WinClose('DAMN NFO Viewer')
		$exit=1
	EndIf
	if WinExists('Asistente para la compatibilidad de programas','Este programa se instaló correctamente') then WinClose('Asistente para la compatibilidad de programas','Este programa se instaló correctamente')
	$exit=$exit+1
WEnd


