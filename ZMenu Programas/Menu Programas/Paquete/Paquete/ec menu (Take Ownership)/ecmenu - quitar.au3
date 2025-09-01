#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'DesInst. ECMenu',160,80,0,110)


Global $ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


Do
	DirRemove($ProgramFilesDir & "\Easy Context Menu\",1)
	DirRemove($ProgramFilesDir & " (x86)\Easy Context Menu\",1)
	RegDelete('HKEY_CLASSES_ROOT\*\shell\Z001AAL')
	RegDelete('HKEY_CLASSES_ROOT\Directory\shell\Z002AAL')
	RegDelete('HKEY_CLASSES_ROOT\Drive\shell\Z002AAL')
	RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\*\shell\Z001AAL')
	RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Directory\shell\Z002AAL')

Until not FileExists($ProgramFilesDir & "\Easy Context Menu\") and not FileExists($ProgramFilesDir & " (x86)\Easy Context Menu\")

