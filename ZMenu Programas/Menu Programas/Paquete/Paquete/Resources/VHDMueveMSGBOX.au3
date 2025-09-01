#RequireAdmin

$exit=0
Do
	if WinExists('VHD Launch') then
		$pos=WinGetPos('VHD Launch')
		WinMove('VHD Launch','',@DesktopWidth/2+250,@DesktopHeight/2-$pos[3]/2)
;~ 		WinWaitClose('VHD Launch')
		Exit
	EndIf
	$exit=$exit+1
	Sleep(100)

Until $exit>=10 * 180 ; el 180 es segundos

