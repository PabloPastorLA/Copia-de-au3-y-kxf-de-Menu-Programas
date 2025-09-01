if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf


$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)




SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. VC Redist',160,80,0,110)
;~ if FileExists("VC_RedistInstaller.exe") then MsgBox(0,'','asd1')
If not FileExists($ProgramFilesDir&'\MenuInstalado\VC') then

ShellExecute('VCRedVentanas.exe')

ShellExecuteWait('fsharp_redist','/s')
ShellExecuteWait('MicrosoftRuntime','/S')


ShellExecuteWait('vcredist_x86_2005','/s')
ShellExecuteWait('vcredist_x86_2008','/s')
ShellExecuteWait('vcredist_x86_2010','/s')
ShellExecuteWait('vcredist_x86_2012','/s')
ShellExecuteWait('vcredist_x86_2013','/s')

if @OSArch<>'x86' then
	ShellExecuteWait('vcredist_x64_2005','/s')
	ShellExecuteWait('vcredist_x64_2008','/s')
	ShellExecuteWait('vcredist_x64_2010','/s')
	ShellExecuteWait('vcredist_x64_2012','/s')
	ShellExecuteWait('vcredist_x64_2013','/s')
EndIf


	ProcessClose('VCRedVentanas.exe')
;	DirCreate($ProgramFilesDir&'\MenuInstalado')
;	FileWrite($ProgramFilesDir&'\MenuInstalado\VC','')

	FileWrite(@DesktopDir & "\Bien Instalado.txt","VC Redistributable"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","VC Redistributable"&@CRLF)
EndIf

