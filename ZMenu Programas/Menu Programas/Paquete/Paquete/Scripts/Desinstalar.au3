#RequireAdmin

;~ "DAEMON Tools Lite\uninst.exe" /S

$NombreMostrar='Teracopy'

$RutaDESINST="DAEMON Tools Lite\uninst.exe"
$ParametroDESINST=' /S'


SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'DesInst. '&$NombreMostrar,160,80,0,110)


;~ $rest=0
if FileExists (@ProgramFilesDir & "\" & $RutaDESINST) then
	ShellExecuteWait(@ProgramFilesDir & "\" & $RutaDESINST,$ParametroDESINST)
Elseif FileExists (@ProgramFilesDir & " (x86)\" & $RutaDESINST) then
	ShellExecuteWait(@ProgramFilesDir & " (x86)\" & $RutaDESINST,$ParametroDESINST)
Else
	MsgBox(0,'','No encontre Desinstalador de '&$NombreMostrar)
EndIf
