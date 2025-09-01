;desactivar
ShellExecuteWait('WinDefDesact.exe','',menuprogramas()&'\Windows Defender Control')

MsgBox(0,'','')
;activar
ShellExecuteWait('WinDefAct.exe','',menuprogramas()&'\Windows Defender Control')

;exclusion
$ruta=''
ShellExecuteWait('WinDefExclusion.exe',$ruta,menuprogramas()&'\Windows Defender Control')



func menuprogramas()
	$MenuProgramas=@ScriptDir
	Do
	$MenuProgramas=StringTrimRight($MenuProgramas,1)
	until StringRight($MenuProgramas,1)='\'
	$MenuProgramas=StringTrimRight($MenuProgramas,1)
	Return $MenuProgramas
EndFunc

;Windows Defender Control








