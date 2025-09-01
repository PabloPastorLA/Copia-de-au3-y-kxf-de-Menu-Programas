;~ 	MsgBox(0,'',@ProgramFilesDir & "\EZ CD Audio Converter\ezcd.exe")
	if FileExists (@ProgramFilesDir & "\EZ CD Audio Converter\ezcd.exe") Then MsgBox(0,'','')


;~ 	if FileExists (@ProgramFilesDir & "\EZ CD Audio Converter\ezcd.exe") Then
;~ 		While FileGetSize(@ProgramFilesDir & "\EZ CD Audio Converter\ezcd.exe") <> 7292928 And FileGetSize(@ProgramFilesDir & "\EZ CD Audio Converter\ezcd.exe") <> 13911040
;~ 			if @OSArch = 'X86' Then FileCopy ('crack x86\ezcd.exe',@ProgramFilesDir & "\EZ CD Audio Converter\ezcd.exe",1)
;~ 			if @OSArch = 'X64' Then FileCopy ('crack x64\ezcd.exe',@ProgramFilesDir & "\EZ CD Audio Converter\ezcd.exe",1)
;~ 			Sleep(500)
;~ 		WEnd
;~ 	Elseif FileExists (@ProgramFilesDir & " (x86)\EZ CD Audio Converter\ezcd.exe") Then
;~ 		While FileGetSize(@ProgramFilesDir & " (x86)\EZ CD Audio Converter\ezcd.exe") <> 7292928 And FileGetSize(@ProgramFilesDir & " (x86)\EZ CD Audio Converter\ezcd.exe") <> 13911040
;~ 			if @OSArch = 'X86' Then FileCopy ('crack x86\ezcd.exe',@ProgramFilesDir & " (x86)\EZ CD Audio Converter\ezcd.exe",1)
;~ 			if @OSArch = 'X64' Then FileCopy ('crack x64\ezcd.exe',@ProgramFilesDir & " (x86)\EZ CD Audio Converter\ezcd.exe",1)
;~ 			Sleep(500)
;~ 		WEnd
;~ 		Else
;~ 			While 1
;~ 				MsgBox(0,'','EZCDAudio No Encuentro exe')
;~ 			WEnd
;~ 		EndIf



