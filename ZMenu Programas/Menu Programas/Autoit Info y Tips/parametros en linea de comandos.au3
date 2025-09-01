;MsgBox(0,'',)
;~ If $CmdLine[0] > 0 Then
;~         Switch $CmdLine[1]
;~
;~             Case "/?"
;~                 MsgBox(0, "", "Help")
;~             Case "/s"
;~                 MsgBox(0, "", "_s")
;~             Case "/u"
;~                 MsgBox(0, "", "_u")
;~             Case "/x"
;~                 MsgBox(0, "", "_x")
;~         EndSwitch
;~     Else
;~         MsgBox(0, "", "No Parameters passed")
;~     EndIf
;~
;~
;~


;Reviso linea de COMANDOS
If $CmdLine[0] > 0 Then
	Switch $CmdLine[1]
		Case "/RED"
			MsgBox(0, "", "red")
		Case "/LOC"
			MsgBox(0, "", "local")
	EndSwitch
Else
	MsgBox(0, "", "No Parameters passed")
EndIf
;Termino de Revisar linea de COMANDOS

MsgBox(0,'','termine')