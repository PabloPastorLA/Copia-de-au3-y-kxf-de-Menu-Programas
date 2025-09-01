$count=circulo(150,@DesktopHeight -20,3,30,150)
;~ MsgBox(0,'',$count)

Func circulo($X,$Y,$XDesp,$radio,$salida)
	$i = 0
	$count=0
	While 1
		MouseMove($X + $XDesp*($radio * Cos($i)), $Y + ($radio * Sin($i)),0)
		$i += 0.1
		Sleep(10)
		if $count>=$salida then Return $count
		$count=$count+1
	WEnd
EndFunc
