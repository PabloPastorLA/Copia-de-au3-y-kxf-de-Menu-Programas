#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Compile_Both=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf


;~ If $CmdLine[0] > 0 Then
;~ 	Switch $CmdLine[1]
;~ 		Case "/RED"
;~ 			MsgBox(0, "", "red")
;~ 		Case "/LOC"
;~ 			MsgBox(0, "", "local")
;~ 	EndSwitch
;~ Else
;~ 	MsgBox(0, "", "No Parameters passed")
;~ EndIf
;Termino de Revisar linea de COMANDOS



;Reviso linea de COMANDOS
If $CmdLine[0] = 0 Then
	MsgBox(0,'Tomar Control','Falta parametro. Cerrando')
	Exit
EndIf

;~ MsgBox(0,'',$CmdLine[1])
;~ MsgBox(0,'',$CmdLine[2])
;~ MsgBox(0,'',$CmdLine[3])


;~ /Admin
;~ /takeown
;~ C:\Users\asdasdadasd.pdf
Do
	Sleep(Random(100,300,1))
until not ProcessExists('EcMenu_x64.exe') and not ProcessExists('EcMenu.exe')

ShellExecuteWait(@ScriptDir&'\EcMenu.exe',' '&$CmdLine[1]&' '&$CmdLine[2]&' '&$CmdLine[3])
SoundPlay(@ScriptDir&'\SUCCESS.WAV')
MsgBox(0,'Tomar Control','Listo!')
;~ $param=$CmdLine[1]
;~ $param2=$CmdLine[2]
;~ $param3=$CmdLine[3]
;~ $param4=$CmdLine[4]
;~ $param5=$CmdLine[5]

;~ MsgBox(0,'',$param&' '&$param2&' '&$param3&' '&$param4&' '&$param5)

;~ If $CmdLine[0] > 0 Then
;~ 	Switch $CmdLine[1]
;~ 		Case "/RED"
;~ 			MsgBox(0, "", "red")
;~ 		Case "/LOC"
;~ 			MsgBox(0, "", "local")
;~ 	EndSwitch
;~ Else
;~ 	MsgBox(0, "", "No Parameters passed")
;~ EndIf
;~ ;Termino de Revisar linea de COMANDOS

;~ MsgBox(0,'','termine')