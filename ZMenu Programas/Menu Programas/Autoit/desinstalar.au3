#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****



if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit ' & @crlf & 'Desinstalandose',160,80,0,110)


Global $ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


;--------------				DESINSTALAR SCITE Y AUTOIT		-----------------------

If FileExists($ProgramFilesDir & '\AutoIt3\') Or FileExists($ProgramFilesDir & ' (X86)\AutoIt3\') Then
	if FileExists($ProgramFilesDir & '\AutoIt3\SciTE\uninst.exe') then ShellExecuteWait($ProgramFilesDir & '\AutoIt3\SciTE\uninst.exe', ' /S')
	If FileExists($ProgramFilesDir & '\AutoIt3\Uninstall.exe') then ShellExecuteWait($ProgramFilesDir & '\AutoIt3\Uninstall.exe', ' /S')
	if FileExists($ProgramFilesDir & ' (X86)\AutoIt3\SciTE\uninst.exe') then ShellExecuteWait($ProgramFilesDir & ' (X86)\AutoIt3\SciTE\uninst.exe', ' /S')
	if FileExists($ProgramFilesDir & ' (X86)\AutoIt3\Uninstall.exe') Then ShellExecuteWait($ProgramFilesDir & ' (X86)\AutoIt3\Uninstall.exe', ' /S')

	Do
		DirRemove($ProgramFilesDir & "\AutoIt3\", 1)
		DirRemove(@ProgramsCommonDir & "\AutoIt v3\", 1)
		DirRemove($ProgramFilesDir & " (X86)\AutoIt3\", 1)
		DirRemove(@ProgramsCommonDir & "\AutoIt v3\", 1)
		SplashTextOn('Espera','Autoit ' & @crlf & 'Desinstalandose'&@CRLF&'Borrando',160,80,0,110)
	Until not FileExists($ProgramFilesDir & "\AutoIt3\") and not FileExists($ProgramFilesDir & " (x86)\AutoIt3\")

EndIf














