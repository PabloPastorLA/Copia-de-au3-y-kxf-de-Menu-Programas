if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Youtube Downloader',160,80,0,110)

;Nombre para mostrar con splash
$NombrePrograma='Youtube Downloader'


$file= "Descargar de Youtube Musica y Videos.url"

FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	"&$NombrePrograma&@CRLF)
Filecopy ($file,@DesktopDir & "\" & $file,1)
FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	"&$NombrePrograma&@CRLF)

