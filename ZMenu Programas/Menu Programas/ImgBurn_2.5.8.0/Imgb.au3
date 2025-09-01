if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. ImgBurn',160,80,0,110)



If FileExists("SetupImgBurn_2.5.8.0.exe") AND not FileExists (@ProgramFilesDir & "\ImgBurn\ImgBurn.exe")  AND not FileExists (@ProgramFilesDir & " (x86)\ImgBurn\ImgBurn.exe") Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	ImgBURN"&@CRLF)

	RunWait('SetupImgBurn_2.5.8.0.exe /S')
	If FileExists (@ProgramFilesDir & "\ImgBurn\ImgBurn.exe") Then 	FileCopy('spanish_international.lng', @ProgramFilesDir & "\ImgBurn\Languages\", 9)
	If FileExists (@ProgramFilesDir & " (x86)\ImgBurn\ImgBurn.exe") Then FileCopy('spanish_international.lng', @ProgramFilesDir & " (x86)\ImgBurn\Languages\", 9)

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	ImgBURN"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","ImgBURN"&@CRLF)
EndIf

