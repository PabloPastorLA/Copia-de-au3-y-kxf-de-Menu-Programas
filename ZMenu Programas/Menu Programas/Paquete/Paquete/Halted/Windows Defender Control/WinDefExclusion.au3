if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf

#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****


SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'WinDefExcl',160,80,0,110)

If $CmdLine[0] <= 0 Then
	MsgBox(0,'Exclusion Windows Defender','Se debe agregar parámetro. Cerrando')
	Exit
EndIf


$ruta=$CmdLine[1]

VerifWindefCorriendo()


;~ MsgBox(0,'',$ruta)

;~ if FileExists($ruta) then
;~ 	ShellExecuteWait('cmd',' /k')


 	ShellExecuteWait('cmd',' /c powershell -inputformat none -outputformat none -NonInteractive -Command Add-MpPreference -ExclusionPath '&"'"&'"'&$ruta&'"'&"'")

;~ Else
	;MsgBox(0,'Exclusiones WinDefender',' /c powershell -inputformat none -outputformat none -Command Add-MpPreference -ExclusionPath '&"'"&'"'&$ruta&'"'&"'")
;~ EndIf






Func VerifWindefCorriendo()
	ShellExecute("DefenderControl.exe","");,'','',@SW_HIDE)
	Do
		Sleep(100)
	until WinExists('Defender Control v1.6','Windows Defender está desactivado') or WinExists('Defender Control v1.6','Windows Defender está ejecutándose')

	if WinExists('Defender Control v1.6','Windows Defender está desactivado') then
		ProcessClose('DefenderControl.exe')

;~ 		if 6=MsgBox(4,'Exclusion Windefender','Windefender debe estar activado para poder excluir.'&@crlf&'Desea activarlo y continuar?') then
		if 1 then
			ShellExecuteWait('WinDefAct.exe')
		Else
			MsgBox(0,'Exclusion Windefender','Imposible continuar. Cerrando')
			ProcessClose('DefenderControl.exe')
			Exit
		EndIf
	ProcessClose('DefenderControl.exe')
	EndIf
EndFunc
