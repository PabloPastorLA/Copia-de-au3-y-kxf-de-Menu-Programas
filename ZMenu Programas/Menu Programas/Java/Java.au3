SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Java',160,80,0,110)
if @OSVersion <> "WIN_XP" Then
	#RequireAdmin
EndIf

$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)

if not FileExists($ProgramFilesDir&'\MenuInstalado\JV') and not FileExists($ProgramFilesDir&' (x86)\MenuInstalado\JV') then

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Java 8"&@CRLF)

	If DriveStatus(@HomeDrive) = 'READY' Then
	   FileCopy('JavaConfig',@HomeDrive&'\JavaConfig')
	   $l='c:'
	Else
		MsgBox(0,'','Java no pude instalar')
	EndIf



		If @OSArch = "X86" and FileExists('jre-8u60-windows-i586.exe') Then RunWait('jre-8u60-windows-i586.exe INSTALLCFG='&$l&'\JavaConfig')
		If @OSArch <>"X86" and FileExists('jre-8u60-windows-x64.exe') Then RunWait('jre-8u60-windows-x64.exe INSTALLCFG='&$l&'\JavaConfig')
		if not FileExists('jre-8u60-windows-i586.exe') and not FileExists('jre-8u60-windows-x64.exe') Then
			Do
				MsgBox(0,'','Falla java')
			Until 0
		EndIf

	RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','SunJavaUpdateSched')
	RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run','SunJavaUpdateSched')
	RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run-','SunJavaUpdateSched')

	IF FileExists (@HomeDrive&'\JavaConfig') Then
		FileDelete(@HomeDrive&'\JavaConfig')
	EndIf

	DirCreate($ProgramFilesDir&'\MenuInstalado')
	FileWrite($ProgramFilesDir&'\MenuInstalado\JV','')




	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Java 8"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt",'Java 8'&@CRLF)
EndIf

