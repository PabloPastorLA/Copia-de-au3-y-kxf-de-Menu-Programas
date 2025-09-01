if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. AllwaySync',160,80,0,110)

$programfiles=@ProgramFilesDir
if StringRight($programfiles,6)=' (x86)' then $programfiles=StringTrimRight($programfiles,6)




If (FileExists("allwaysync-x64-20-1-7.exe") or FileExists('allwaysync-20-1-7')) and not FileExists ($ProgramFiles & "\Allway Sync\Bin\syncappw.exe") AND not FileExists ($ProgramFiles & " (x86)\Allway Sync\Bin\syncappw.exe") Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Inst. AllwaySync"&@CRLF)
	if @OSArch='x86' Then ShellExecuteWait("allwaysync-20-1-7.exe",' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-')
	if @OSArch='x64' Then ShellExecuteWait("allwaysync-x64-20-1-7.exe",' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-')


	if @OSArch='x86' then
		if FileExists ($ProgramFiles & "\Allway Sync\Bin\syncappw.exe") Then
			FileCopy('x86\syncapp.dll',$ProgramFiles & "\Allway Sync\Bin\syncapp.dll",9)
		ElseIf FileExists ($ProgramFiles & " (x86)\Allway Sync\Bin\syncappw.exe") Then
			FileCopy('x86',$ProgramFiles & " (x86)\Allway Sync\Bin\syncapp.dll",9)
		Else
			MsgBox(0,'Allway sync','Fallo copia de crack')
		EndIf
	ElseIf @OSArch='x64' then
		if FileExists ($ProgramFiles & "\Allway Sync\Bin\syncappw.exe") Then
			FileCopy('x64\syncapp.dll',$ProgramFiles & "\Allway Sync\Bin\syncapp.dll",9)
		Else
			MsgBox(0,'Allway sync','Fallo copia de crack')
		EndIf
	EndIf

	if WinExists($ProgramFiles &'\Allway Sync\Bin\NewService.exe') Then WinWaitClose($ProgramFiles &'\Allway Sync\Bin\NewService.exe')
	if WinExists($ProgramFiles &' (x86)\Allway Sync\Bin\NewService.exe') then WinWaitClose($ProgramFiles &' (x86)\Allway Sync\Bin\NewService.exe')


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Term. AllwaySync"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","AllwaySync"&@CRLF)
EndIf


