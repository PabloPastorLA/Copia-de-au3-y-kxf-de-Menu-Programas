#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#RequireAdmin

if not FileExists(@AppDataCommonDir&'\SystemExplorer\config.ini') then FileCopy('config.ini',@AppDataCommonDir&'\SystemExplorer\config.ini',8)
if not ProcessExists('SystemExplorer.exe') then ShellExecute('SystemExplorer.exe')

$exit=0
Do
	$exit=$exit+1
	Sleep(100)
	if WinExists('Licencia System Explorer') then
		do
			ControlClick('Licencia System Explorer','','TTntButton.UnicodeClass2')
		until WinGetState('Licencia System Explorer')=0 ;not WinExists('Licencia System Explorer')
		$exit=100
	EndIf
until $exit>=70



