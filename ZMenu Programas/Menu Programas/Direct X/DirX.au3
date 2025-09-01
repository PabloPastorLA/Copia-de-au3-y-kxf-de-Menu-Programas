if @OSVersion <> 'WIN_XP' then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Direct X',160,80,0,110)


$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


if not FileExists($ProgramFilesDir&'\MenuInstalado\DirX') and not FileExists($ProgramFilesDir&' (x86)\MenuInstalado\DirX') then

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Direct X"&@CRLF)

	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Direct X',160,80,0,110)

	ShellExecuteWait('directx10\DXSETUP.exe',' /silent')


	DirCreate($ProgramFilesDir&'\MenuInstalado')
	FileWrite($ProgramFilesDir&'\MenuInstalado\DirX','')


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Direct X"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Direct X"&@CRLF)
EndIf


