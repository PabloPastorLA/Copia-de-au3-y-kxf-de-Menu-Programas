$MenuProgramas=@ScriptDir
;~ MsgBox(0,'',@ScriptDir)
;~ Exit

Do
$MenuProgramas=StringTrimRight($MenuProgramas,1)
until StringRight($MenuProgramas,1)='\'
$MenuProgramas=StringTrimRight($MenuProgramas,1)

MsgBox(0,'',$MenuProgramas)
