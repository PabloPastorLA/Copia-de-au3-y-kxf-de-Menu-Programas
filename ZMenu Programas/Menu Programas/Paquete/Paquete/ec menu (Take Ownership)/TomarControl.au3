#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

if @OSVersion <> "WIN_XP" then
;~ 	#RequireAdmin
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

;~ for $i=1 to $CmdLine[0]
;~ 	MsgBox(0,'',$CmdLine[$i])
	;~ MsgBox(0,'',$CmdLine[2])
	;~ MsgBox(0,'',$CmdLine[3])
;~ Next
;~ MsgBox(0,'','cierro')
;~ Exit

;~ /Admin
;~ /takeown
;~ C:\Users\asdasdadasd.pdf
;~ Do
;~ 	Sleep(Random(100,300,1))
;~ until not ProcessExists('EcMenu_x64.exe') and not ProcessExists('EcMenu.exe')

SplashTextOn('Tomar Control','Agregando a lista. Espere',300,50,@DesktopWidth-300,0)

Do
	$handle=FileOpen(@TempDir&'\TomarControlLista.txt',1)
	Sleep(100)
until $handle <> -1
Do
	$error=FileWriteLine(@TempDir&'\TomarControlLista.txt',' '&$CmdLine[1]&' '&$CmdLine[2]&' '&$CmdLine[3])
until $error<>0
FileClose($handle)

Sleep(300)
if not ProcessExists('TomarControlCorrerLista.exe') then ShellExecute(@ScriptDir&'\TomarControlCorrerLista.exe')
