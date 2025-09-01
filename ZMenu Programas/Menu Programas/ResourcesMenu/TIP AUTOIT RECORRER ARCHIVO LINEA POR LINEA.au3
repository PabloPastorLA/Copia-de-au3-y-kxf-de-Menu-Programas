Func HintsToolTips()
	$handle=FileOpen('ResourcesMenu\HintBotones.txt')
	If $handle=-1 then MsgBox(0,'Hints Botones','No encontre archivo HintBotones.txt en carpeta ResourcesMenu')
	for $i=1 to 80 step 1
		$linea=FileReadLine($handle,$i)
		$lineapartida = StringSplit($linea,';')
		GUICtrlSetTip(Eval($lineapartida[1]),$lineapartida[3])
	Next
	FileClose($handle)
EndFunc