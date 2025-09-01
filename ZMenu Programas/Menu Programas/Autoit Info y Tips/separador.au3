separador()


func separador()
	$i=0
	$borrar=0
	For $i=1 to 15 step 1
		if FileExists (@DesktopDir & '\Separador ' & $i) Then
			$borrar=1
		EndIf
	Next

	$i=0
	For $i=1 to 15 step 1
		if $borrar=1 Then
			FileDelete (@DesktopDir & '\Separador ' & $i)
		Else
			FileWrite (@DesktopDir & '\Separador ' & $i,'')
		EndIf
	Next
EndFunc

;~ 			FileDelete (@DesktopDir & '\Separador ' & $i)
