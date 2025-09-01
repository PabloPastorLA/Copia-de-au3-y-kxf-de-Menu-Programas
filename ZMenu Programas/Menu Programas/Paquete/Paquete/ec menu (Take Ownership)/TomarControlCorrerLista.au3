#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
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
;~ If $CmdLine[0] = 0 Then
;~ 	MsgBox(0,'Tomar Control','Falta parametro. Cerrando')
;~ 	Exit
;~ EndIf

;~ MsgBox(0,'',$CmdLine[1])
;~ MsgBox(0,'',$CmdLine[2])
;~ MsgBox(0,'',$CmdLine[3])


;~ /Admin
;~ /takeown
;~ C:\Users\asdasdadasd.pdf


;Prevengo doble instancia
$g_szVersion = "prevencion de doble instancia"
If WinExists($g_szVersion) Then Exit ; It's already running
AutoItWinSetTitle($g_szVersion)





Do
	;buckle hasta tener handle y hasta poder leer linea
	Do
		$handle=FileOpen(@TempDir&'\TomarControlLista.txt',1)
		Sleep(100)
	until $handle <> -1
	Do
		$linea=FileReadToArray(@TempDir&'\TomarControlLista.txt')
	until @error<>1

	;si archivo esta vacio borrar y cerrar
	do
		FileClose($handle)
		FileDelete(@TempDir&'\TomarControlLista.txt')
	until not FileExists(@TempDir&'\TomarControlLista.txt')



	for $i=0 to UBound($linea)-1 Step 1
		TraySetToolTip(StringTrimLeft($linea[$i],17))
		ShellExecuteWait(@ScriptDir&'\EcMenu.exe',$linea[$i])
	Next

	;~ FileWriteLine($handle,)

until not FileExists(@TempDir&'\TomarControlLista.txt')


MsgBox(0,'Tomar Control','Terminé.')


Exit







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