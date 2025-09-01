
if FileExists(@ProgramFilesDir & '\ESET\ESET NOD32 Antivirus\em002_32.dat') then
	$dirlocal = @ProgramFilesDir & '\ESET\ESET NOD32 Antivirus\'
	$dirnod = @ProgramFilesDir & '\ESET\ESET NOD32 Antivirus\egui.exe'
ElseIf FileExists(@ProgramFilesDir & ' (X86)\ESET\ESET NOD32 Antivirus\em002_32.dat') then
	$dirlocal = @ProgramFilesDir & ' (X86)\ESET\ESET NOD32 Antivirus\'
	$dirnod = @ProgramFilesDir & ' (X86)\ESET\ESET NOD32 Antivirus\egui.exe'
else
	msgbox(0,'falla','No encontre la carpeta de instalacion')
EndIf
;~ MsgBox(0,'',$dirlocal & 'em002_32.dat')

$EXTER=FileGetSize('Update\em002_32.dat')
$PC=FileGetSize($dirlocal & 'em002_32.dat')
;~ MsgBox(0,'',$EXTER)
;~ MsgBox(0,'',$PC)

If ($PC > $EXTER) and FileExists($dirnod) Then
	ShellExecuteWait('xcopy',' "' & $dirlocal & '*.dat" "Update" /I /C /K /Y','','',@SW_HIDE)
EndIf
