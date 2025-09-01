#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf

$Instalador='MiniLyrics.exe'
;~ $SilentSwitch=' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$SilentSwitch=' /S'
;~ $SilentSwitch=' /Silenminit'


$NombrePrograma='Mini Lyrics'
$ruta='Minilyrics\MiniLyrics.exe'

;~ $accesojuego='Zombie Night Terror Special Edition.lnk'


;~ MsgBox(0,'',FileReadLine(@AppDataDir&'\minilyrics\MiniLyric.ini',24))
;~ Exit


SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. '&$NombrePrograma,160,80,0,110)


$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


If FileExists($Instalador) AND not FileExists ($ProgramFilesDir&'\'&$ruta) AND not FileExists ($ProgramFilesDir&' (x86)\'&$ruta) Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	"&$NombrePrograma&@CRLF)


;Instalar
	ShellExecuteWait($Instalador,$SilentSwitch)
	WinWait('Configuración de Minilyrics para reproductores')
	Do
		ControlClick('Configuración de Minilyrics para reproductores','','Button27')
		if WinExists('Configuración de Minilyrics para reproductores','Aceptar') then ControlClick('Configuración de Minilyrics para reproductores','','Button1')
	until not WinExists('Configuración de Minilyrics para reproductores')
	ProcessWait('MiniLyrics.exe')
	ProcessClose('MiniLyrics.exe')

;~ 	do
;~ 		FileDelete(@AppDataDir&'\minilyrics\MiniLyric.ini')
;~ 	until not FileExists(@AppDataDir&'\minilyrics\MiniLyric.ini')
	if 0=FileCopy('MiniLyric.ini',@AppDataDir&'\minilyrics\MiniLyric.ini',1) Then
		MsgBox(0,'','Error en minilyrics, en minilyric.ini. Cerrando')
		exit(1)
	EndIf

;~ $handle=FileOpen(@AppDataDir&'\minilyrics\MiniLyric.ini')
;~ if $handle='-1' then
;~ 	MsgBox(0,'','Error en minilyrics. Cerrando')
;~ 	exit(1)
;~ EndIf

;~ if FileReadLine(@AppDataDir&'\minilyrics\MiniLyric.ini',24)='DefaultSkin=MiniLyrics' Then
;~ 	FileClose($handle)
;~ 	$handle=FileOpen(@AppDataDir&'\minilyrics\MiniLyric.ini')
;~ 	FileWriteLine(
;~ 	if $handle='-1' then
;~ 		MsgBox(0,'','Error en minilyrics. Cerrando')
;~ 		exit(1)
;~ 	EndIf
;~ Else
;~ 	MsgBox(0,'','Error en minilyrics, linea de skin. Cerrando')
;~ 	exit(1)
;~ EndIf


;esperar y cerrar
;~ 	if ProcessExists("YouTubeDownloader.exe") then MsgBox(0,'','')
;~ 	Do
;~ 		ProcessClose('YouTubeDownloader.exe')
;~ 	Until not ProcessExists('YouTubeDownloader.exe')


;Copiar CRACK
;~ 	if FileExists ($ProgramFilesDir&'\'&$ruta) then
;~ 		FileCopy('Crack\YouTubeDownloader.exe',$ProgramFilesDir&'\'&$ruta,9)
;~ 	ElseIf FileExists ($ProgramFilesDir&' (x86)\'&$ruta) Then
;~ 		FileCopy('Crack\YouTubeDownloader.exe',$ProgramFilesDir&' (x86)\'&$ruta,9)
;~ 	Else
;~ 		MsgBox(0,$NombrePrograma,'No encontre ejecutable. Cerrando')
;~ 		Exit
;~ 	EndIf


;Mover Acceso Directo a Juegos
;~ 	Do
;~ 	until FileExists (@DesktopDir&'\'&$accesojuego)
;~ 	Do
;~ 		FileMove(@DesktopDir&'\'& $accesojuego,@DesktopCommonDir&'\Juegos\'& $accesojuego,9)
;~ 	Until not FileExists (@DesktopDir&'\'&$accesojuego)


	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	"&$NombrePrograma&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt",$NombrePrograma&@CRLF)
EndIf





;EOF


