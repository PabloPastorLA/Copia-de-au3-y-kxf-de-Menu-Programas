if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. EZ CD',160,80,0,110)



If FileExists("ez_cd_audio_converter_setup.exe") AND not FileExists (@ProgramFilesDir & "\EZ CD Audio Converter\ezcd.exe") AND not FileExists (@ProgramFilesDir & " (x86)\EZ CD Audio Converter\ezcd.exe") Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	EZ CD Audio"&@CRLF)

	ShellExecuteWait("ez_cd_audio_converter_setup.exe"," /S")
	$i=0
	While Not FileExists (@ProgramFilesDir & "\EZ CD Audio Converter\ezcd.exe") and not FileExists (@ProgramFilesDir & " (x86)\EZ CD Audio Converter\ezcd.exe") and $i<10
		sleep(1000)
		$i=$i+1
	WEnd

	if FileExists (@ProgramFilesDir & "\EZ CD Audio Converter\ezcd.exe") Then
		While FileGetSize(@ProgramFilesDir & "\EZ CD Audio Converter\ezcd.exe") <> 7292928 And FileGetSize(@ProgramFilesDir & "\EZ CD Audio Converter\ezcd.exe") <> 13911040
			if @OSArch = 'X86' Then FileCopy ('crack x86\ezcd.exe',@ProgramFilesDir & "\EZ CD Audio Converter\ezcd.exe",1)
			if @OSArch = 'X64' Then FileCopy ('crack x64\ezcd.exe',@ProgramFilesDir & "\EZ CD Audio Converter\ezcd.exe",1)
			Sleep(500)
		WEnd
	Elseif FileExists (@ProgramFilesDir & " (x86)\EZ CD Audio Converter\ezcd.exe") Then
		While FileGetSize(@ProgramFilesDir & " (x86)\EZ CD Audio Converter\ezcd.exe") <> 7292928 And FileGetSize(@ProgramFilesDir & " (x86)\EZ CD Audio Converter\ezcd.exe") <> 13911040
			if @OSArch = 'X86' Then FileCopy ('crack x86\ezcd.exe',@ProgramFilesDir & " (x86)\EZ CD Audio Converter\ezcd.exe",1)
			if @OSArch = 'X64' Then FileCopy ('crack x64\ezcd.exe',@ProgramFilesDir & " (x86)\EZ CD Audio Converter\ezcd.exe",1)
			Sleep(500)
		WEnd

	Else
		While 1
			MsgBox(0,'','EZCDAudio No Encuentro exe')
		WEnd
	EndIf


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	EZ CD Audio"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","EZ CD Audio"&@CRLF)
EndIf



