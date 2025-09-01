#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****











;~ If $CmdLine[0] > 0 Then
;~ 	Switch $CmdLine[1]
;~ 		Case "/RED"
;~ 			$ModoRED=1
;~ 		Case "/LOC"
;~ 			$ModoRED=0
;~ 	EndSwitch
;~ Else
;~ 	$ModoRED=2
;~ EndIf







;~ MsgBox(0,'',$CmdLine[0])

if $CmdLine[0]=0 then
	MsgBox(0,'Monitor Suspender-Hibernar','Falla en parametro. Saliendo')
	Exit
EndIf

	FileWrite('"'&$CmdLine[1]&'"','detectado comando shutdown'&@CRLF)

Do
	if ProcessExists('shutdown.exe') then FileWrite($CmdLine[1],'detectado comando shutdown'&@CRLF)
	Sleep(200)
Until not ProcessExists('Estado Bateria.exe')








