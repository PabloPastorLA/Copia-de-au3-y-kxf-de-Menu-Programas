if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf

#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'DES. Win Def',160,80,0,110)

;~ If FileExists("setup.exe") AND not FileExists (@ProgramFilesDir & "\Ares\Ares.exe") AND not FileExists (@ProgramFilesDir & " (x86)\Ares\Ares.exe")  Then
;~ 	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Ares"&@CRLF)
cerrar()

ShellExecute("DefenderControl.exe","");,'','',@SW_HIDE)
Do
	Sleep(100)
until WinExists('Defender Control v1.6','Windows Defender está desactivado') or WinExists('Defender Control v1.6','Windows Defender está ejecutándose')



Do
	Sleep(300)
until ControlCommand('Defender Control v1.6','','Button1','isenabled','')

if WinExists('Defender Control v1.6','Windows Defender está desactivado') then
	cerrar()
	Exit
Else
	Do
		ControlClick('Defender Control v1.6','','Button1')
		Sleep(1000)
	until not WinExists('Defender Control v1.6','Por favor espere ...') or not WinExists('Defender Control v1.6','Windows Defender está desactivado')
	cerrar()
EndIf



func cerrar()
	do
		ProcessClose('DefenderControl.exe')
	until not ProcessExists('DefenderControl.exe')
EndFunc


