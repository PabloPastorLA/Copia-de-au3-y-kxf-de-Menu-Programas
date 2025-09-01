#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=WinMergeU.ico
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

;Reviso linea de COMANDOS
If $CmdLine[0] = 0 Then
	MsgBox(0,'Winmerge','Falta parametro. Cerrando')
	Exit
EndIf

;~ for $i=1 to $CmdLine[0]
;~ 	MsgBox(0,'',$CmdLine[$i])
;~ 	;~ MsgBox(0,'',$CmdLine[2])
;~ 	;~ MsgBox(0,'',$CmdLine[3])
;~ Next
;~ MsgBox(0,'','cierro')
;~ Exit

if $CmdLine[0]=1 then ShellExecute(@ScriptDir&'\WinMergeUORIGINAL.exe','"'&$CmdLine[1]&'"')

if $CmdLine[0]=2 then
	ShellExecute(@ScriptDir&'\WinMergeUORIGINAL.exe','"'&$CmdLine[1] & '" "'&$CmdLine[2]&'"')
	WinWait('WinMerge','Panel de diferencias')
	if WinExists('WinMerge','Los archivos seleccionados son ') then
		do

			WinClose('WinMerge')
		until not WinExists('WinMerge')
		MsgBox(0,'','IGUALES',1)
	EndIf
EndIf


