
$aDays = StringSplit("Button1,Autoit,Winall", ",")

For $i = 1 To $aDays[0]
;~         MsgBox(0, "", "$aDays[" & $i & "] - " & $aDays[$i])
	MsgBox(0, "",$aDays[1])
;~         MsgBox(0, "",$aDays[0])
Next
