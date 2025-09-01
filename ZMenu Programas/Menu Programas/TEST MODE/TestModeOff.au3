#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf

$NombrePrograma='Test Mode Off'
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. '&$NombrePrograma,160,80,0,110)

If @OSArch='x64' Then ShellExecute('DISABLE TEST MODE.exe')
WinWait('DISABLE TEST MODE V1.0 Setup')
Do
	if ControlGetText('DISABLE TEST MODE V1.0 Setup','','Button1')='&Sí' Then ControlClick('DISABLE TEST MODE V1.0 Setup','','Button1')
	if ControlGetText('DISABLE TEST MODE V1.0 Setup','','Button2')='&Sí' Then ControlClick('DISABLE TEST MODE V1.0 Setup','','Button2')
until not WinExists('DISABLE TEST MODE V1.0 Setup')
Sleep(10000)
