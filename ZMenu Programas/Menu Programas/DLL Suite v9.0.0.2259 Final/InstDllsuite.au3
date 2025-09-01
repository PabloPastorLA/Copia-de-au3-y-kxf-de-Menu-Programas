#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Dll Suite',160,80,0,110)



If not FileExists(@ProgramFilesDir &"\DLL Suite\DLLSuite.exe") and not FileExists(@ProgramFilesDir &" (X86)\DLL Suite\DLLSuite.exe") Then
	FileDelete(@ProgramFilesDir &"\DLL Suite\DllSuite.ini")
	FileDelete(@ProgramFilesDir &" (X86)\DLL Suite\DllSuite.ini")

	if @OSVersion='WIN_7' and @OSArch = 'X86' Then
		ShellExecuteWait('xcopy',' "system32" "' & @WindowsDir & '\system32" /I /C /K /Y /E')
	EndIf
	if @OSVersion='WIN_7' and @OSArch = 'X64' Then
		ShellExecuteWait('xcopy',' "X64\System32" "' & @WindowsDir & '\system32" /I /C /K /Y /E')
		ShellExecuteWait('xcopy',' "X64\SysWOW64" "' & @WindowsDir & '\SysWOW64" /I /C /K /Y /E')
	EndIf

	ShellExecute('"DLL Suite v9.0.0.2259 Final.exe"')
	WinWait('Setup - DLL Suite')
	WinActivate('Setup - DLL Suite')
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Dll Suite' & @crlf & 'No tocar el Mouse',160,80,0,110)
	WinWaitActive('Setup - DLL Suite')

	BlockInput(1)
	$positionArray = WinGetPos ('Setup - DLL Suite')
	WinActivate('Setup - DLL Suite')
	WinWaitActive('Setup - DLL Suite')
	MouseMove($positionArray[0] + 190 , $positionArray[1] + 270,0)
	WinActivate('Setup - DLL Suite')
	WinWaitActive('Setup - DLL Suite')
	MouseClick('left')

	$positionArray = WinGetPos ('Setup - DLL Suite')
	WinActivate('Setup - DLL Suite')
	WinWaitActive('Setup - DLL Suite')
	MouseMove($positionArray[0] + 340 , $positionArray[1] + 315,0)
	WinActivate('Setup - DLL Suite')
	WinWaitActive('Setup - DLL Suite')
	MouseClick('left')
	BlockInput(0)

	WinWait('Setup - DLL Suite','&Finish')

	$positionArray = WinGetPos ('Setup - DLL Suite')
	WinActivate('Setup - DLL Suite')
	WinWaitActive('Setup - DLL Suite')
	MouseMove($positionArray[0] + 173 , $positionArray[1] + 405,0)
	WinActivate('Setup - DLL Suite')
	WinWaitActive('Setup - DLL Suite')
	MouseClick('left')

	$positionArray = WinGetPos ('Setup - DLL Suite')
	WinActivate('Setup - DLL Suite')
	WinWaitActive('Setup - DLL Suite')
	MouseMove($positionArray[0] + 202 , $positionArray[1] + 456,0)
	WinActivate('Setup - DLL Suite')
	WinWaitActive('Setup - DLL Suite')
	MouseClick('left')

	WinWaitClose('Setup - DLL Suite')
	FileDelete(@ProgramFilesDir &"\DLL Suite\DllSuite.ini")
	FileDelete(@ProgramFilesDir &" (X86)\DLL Suite\DllSuite.ini")

	if FileExists(@ProgramFilesDir &"\DLL Suite\DLLSuite.exe") Then
		While FileExists(@ProgramFilesDir &"\DLL Suite\DLLSuite.exe")
			FileDelete (@ProgramFilesDir &"\DLL Suite\DLLSuite.exe")
		WEnd
		FileCopy ('Crack\DLLSuite.exe',@ProgramFilesDir & '\DLL Suite\DLLSuite.exe')
		ShellExecute (@ProgramFilesDir & '\DLL Suite\DLLSuite.exe')
	EndIf

	if FileExists(@ProgramFilesDir &" (X86)\DLL Suite\DLLSuite.exe") Then
		While FileExists(@ProgramFilesDir &" (X86)\DLL Suite\DLLSuite.exe")
			FileDelete (@ProgramFilesDir &" (X86)\DLL Suite\DLLSuite.exe")
		WEnd
		FileCopy ('Crack\DLLSuite.exe',@ProgramFilesDir & ' (X86)\DLL Suite\DLLSuite.exe')
		ShellExecute (@ProgramFilesDir & ' (X86)\DLL Suite\DLLSuite.exe')
	EndIf

	ProcessWait('DLLSuite.exe')
	$j=0

	$rutax=@ProgramFilesDir & "\DLL Suite\DLLSuite.ini"
	$rutay=@ProgramFilesDir & " (X86)\DLL Suite\DLLSuite.ini"

	While not FileExists ($rutax) and not FileExists ($rutay) and $j<15
		Sleep(3000)
	WEnd
	ProcessClose('DLLSuite.exe')

	File()

	RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','DLLSuite2016')
	RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run','DLLSuite2016')

	FileWrite(@DesktopDir & "\Bien Instalado.txt","DLLSuite"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","DLLSuite"&@CRLF)
EndIf

func file()
	$ruta='0'
	if FileExists (@ProgramFilesDir & "\DLL Suite\DLLSuite.ini") then $ruta=@ProgramFilesDir & "\DLL Suite\DLLSuite.ini"
	if FileExists (@ProgramFilesDir & " (X86)\DLL Suite\DLLSuite.ini") then $ruta=@ProgramFilesDir & " (X86)\DLL Suite\DLLSuite.ini"
	if $ruta='0' Then
		While 1
			MsgBox(0,'','Falle en la ruta al ini')
		WEnd
	EndIf

	;~ 	$cantlin=_FileCountLines($ruta)
	For $i=1 to _FileCountLines($ruta) step 1
		$linea=FileReadLine($ruta,$i)
		if $linea = 'StartWhenWindowRun=1' Then _FileWriteToLine($ruta,$i,'StartWhenWindowRun=0',1)
		if $linea = 'LanguageItemIndex=3' Then _FileWriteToLine($ruta,$i,'LanguageItemIndex=4',1)
		if $linea = 'FirstRun=1' Then _FileWriteToLine($ruta,$i,'FirstRun=0',1)
		if $linea = 'UserExperienceProgram=1' Then _FileWriteToLine($ruta,$i,'UserExperienceProgram=0',1)
		if $linea = 'ExpiredAutoScan=1' Then _FileWriteToLine($ruta,$i,'ExpiredAutoScan=0',1)

	Next

EndFunc
