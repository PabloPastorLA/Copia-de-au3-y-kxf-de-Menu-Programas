if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. AllwaySync',160,80,0,110)

$programfiles=@ProgramFilesDir
if StringRight($programfiles,6)=' (x86)' then $programfiles=StringTrimRight($programfiles,6)




If (FileExists("allwaysync-x64-19-1-5.exe") or FileExists('allwaysync-x86-19-1-5')) and not FileExists ($ProgramFiles & "\Allway Sync\Bin\syncappw.exe") AND not FileExists ($ProgramFiles & " (x86)\Allway Sync\Bin\syncappw.exe") Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Inst. AllwaySync"&@CRLF)
	if @OSArch='x86' Then ShellExecuteWait("allwaysync-x86-19-1-5.exe",' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-')
	if @OSArch='x64' Then ShellExecuteWait("allwaysync-x64-19-1-5.exe",' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-')

	if FileExists ($ProgramFiles & "\Allway Sync\Bin\syncappw.exe") Then
		FileCopy('Bin - despues\syncapp.dll',$ProgramFiles & "\Allway Sync\Bin\syncapp.dll",9)

	ElseIf FileExists ($ProgramFiles & " (x86)\Allway Sync\Bin\syncappw.exe") Then
		FileCopy('Bin - despues\syncapp.dll',$ProgramFiles & " (x86)\Allway Sync\Bin\syncapp.dll",9)

	Else
		MsgBox(0,'Allway sync','Fallo copia de crack')
	EndIf

	if WinExists($ProgramFiles &'\Allway Sync\Bin\NewService.exe') Then WinWaitClose($ProgramFiles &'\Allway Sync\Bin\NewService.exe')
	if WinExists($ProgramFiles &' (x86)\Allway Sync\Bin\NewService.exe') then WinWaitClose($ProgramFiles &' (x86)\Allway Sync\Bin\NewService.exe')


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Term. AllwaySync"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","AllwaySync"&@CRLF)
EndIf


