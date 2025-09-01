#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=ext.ico
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <WinAPIShellEx.au3>
if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Cambiando EXT',160,80,0,110)



FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	extensiones"&@CRLF)

$paq = StringLeft(@ScriptDir,StringInStr(@ScriptDir,'\',0,-1))&'Paquete\Paquete\Extensiones'

DirCopy(@ScriptDir,$paq,1)

if @OSVersion<>'WIN_7' and @OSVersion<>'WIN_81' and @OSVersion<>'WIN_10' Then
	MsgBox(0,'','falla extensiones')
EndIf


global $LTSC=0
if RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion','ProductName')='Windows 10 Enterprise LTSC 2019' then $LTSC=2019
if RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion','ProductName')='Windows 10 Enterprise LTSC 2021 Evaluation' or RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion','ProductName')='Windows 10 Enterprise LTSC 2021' then $LTSC=2021
;~ RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion','ProductName') = 'Windows 10 Enterprise LTSC 2021 Evaluation'


Webp()

if @OSVersion='WIN_7' then ext7()
if @OSVersion='WIN_81' then ext81()
if @OSVersion='WIN_10' then
	if $LTSC=0 then
		MsgBox(0,'','Error $LTSC en Extensiones/extensiones.au3. Continuo para probar...')
		ext10()
	EndIf

	if $LTSC=2019 then	ext10LTSC2019()
	if $LTSC=2021 then	ext10LTSC2021()
EndIf




FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	extensiones"&@CRLF)


func Webp()
	ShellExecuteWait('webp5419097b.msi',' /quiet /norestart','WebP Codec Setup')
EndFunc

func ext7()

	CambiarTipoDeArchivo('avi','avi','MPC')
	CambiarTipoDeArchivo('flv','flv','MPC')
	CambiarTipoDeArchivo('mkv','mkv','MPC')
	CambiarTipoDeArchivo('mpg','mpg','MPC')
	CambiarTipoDeArchivo('mpeg','mpeg','MPC')
	CambiarTipoDeArchivo('mp4','mp4','MPC')
	CambiarTipoDeArchivo('wmv','wmv','MPC')
	;~ MsgBox(0,'','term video')


	CambiarTipoDeArchivo('MP3','File.MP3','WINAMP')
	CambiarTipoDeArchivo('WAV','File.WAV','WINAMP')
	CambiarTipoDeArchivo('WMA','File.WMA','WINAMP')
	CambiarTipoDeArchivo('FLAC','File.FLAC','WINAMP')
	CambiarTipoDeArchivo('M3U','Playlist','WINAMP')
	;~ MsgBox(0,'','term audio')


	CambiarTipoDeArchivo('BMP','Jpeg','PHOTOVIEWER')	;<---	No pude cambiar icono. Lo pongo como jpeg.
	CambiarTipoDeArchivo('GIF','Jpeg','PHOTOVIEWER')	;<---	No pude cambiar icono. Lo pongo como jpeg.
	CambiarTipoDeArchivo('JPEG','Jpeg','PHOTOVIEWER')
	CambiarTipoDeArchivo('JPG','Jpeg','PHOTOVIEWER')
	CambiarTipoDeArchivo('PNG','Jpeg','PHOTOVIEWER')		;<---	No pude cambiar icono. Lo pongo como jpeg.
	;~ MsgBox(0,'','term imagen')


	if WinExists('Paq','Corregir Exten') then ShellExecute(@ScriptDir&'\ARCHIVOS PRUEBA')
EndFunc


func CambiarTipoDeArchivo($ext,$tipo,$app)
	if $app='MPC' Then		;cambiar extensiones de VIDEO al tipo de archivo del media player classic
;~ 		ShellExecute('cmd.exe',' /K assoc .'&$ext)	;	<---	VER TIPO DE ARCHIVO  ANTES  DE CAMBIAR
		if @OSArch =  'x86' then ShellExecuteWait('cmd.exe',' /C assoc .'&$ext&'=mplayerc.'&$tipo)
		if @OSArch <> 'x86' then ShellExecuteWait('cmd.exe',' /C assoc .'&$ext&'=mplayerc64.'&$tipo)
;~ 		ShellExecute('cmd.exe',' /K assoc .'&$ext)	;	<---	VER TIPO DE ARCHIVO DESPUES DE CAMBIAR
;~ 		MsgBox(0,'','Ver la dif entre antes y despues del cambio')	;	<---	MOSTRAR MSG ANTES DE CONTINUAR
	EndIf

	if $app='WINAMP' Then		;cambiar extensiones de AUDIO al tipo de archivo del winamp
;~ 		ShellExecute('cmd.exe',' /K assoc .'&$ext)	;	<---	VER TIPO DE ARCHIVO  ANTES  DE CAMBIAR
		if @OSArch =  'x86' then ShellExecuteWait('cmd.exe',' /C assoc .'&$ext&'=Winamp.'&$tipo)
		if @OSArch <> 'x86' then ShellExecuteWait('cmd.exe',' /C assoc .'&$ext&'=Winamp.'&$tipo)
;~ 		ShellExecute('cmd.exe',' /K assoc .'&$ext)	;	<---	VER TIPO DE ARCHIVO DESPUES DE CAMBIAR
;~ 		MsgBox(0,'','Ver la dif entre antes y despues del cambio')	;	<---	MOSTRAR MSG ANTES DE CONTINUAR
	EndIf

	if $app='PHOTOVIEWER' Then		;cambiar extensiones de IMAGEN al tipo de archivo del visor de windows
;~ 		ShellExecute('cmd.exe',' /K assoc .'&$ext)	;	<---	VER TIPO DE ARCHIVO  ANTES  DE CAMBIAR
		if @OSArch =  'x86' then ShellExecuteWait('cmd.exe',' /C assoc .'&$ext&'=PhotoViewer.FileAssoc.'&$tipo)
		if @OSArch <> 'x86' then ShellExecuteWait('cmd.exe',' /C assoc .'&$ext&'=PhotoViewer.FileAssoc.'&$tipo)
;~ 		ShellExecute('cmd.exe',' /K assoc .'&$ext)	;	<---	VER TIPO DE ARCHIVO DESPUES DE CAMBIAR
;~ 		MsgBox(0,'','Ver la dif entre antes y despues del cambio')	;	<---	MOSTRAR MSG ANTES DE CONTINUAR
	EndIf

	BorrarUserChoice($ext)
EndFunc

Func BorrarUserChoice($ext)

;	Otorgar permisos para El usuario actual y borrar UserChoice
	if @OSArch =  'x86' then ShellExecuteWait('cmd.exe',' /c SetACL32.exe -on "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.'&$ext&'\UserChoice" -ot reg -actn setowner -ownr "n:'&@UserName&'"')
	if @OSArch =  'x86' then ShellExecuteWait('cmd.exe',' /c SetACL32.exe -on "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.'&$ext&'\UserChoice" -ot reg -actn ace -ace "n:'&@UserName&';p:full"')

	if @OSArch <> 'x86' then ShellExecuteWait('cmd.exe',' /C SetACL64.exe -on "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.'&$ext&'\UserChoice" -ot reg -actn setowner -ownr "n:'&@UserName&'"')
	if @OSArch <> 'x86' then ShellExecuteWait('cmd.exe',' /C SetACL64.exe -on "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.'&$ext&'\UserChoice" -ot reg -actn ace -ace "n:'&@UserName&';p:full"')

	RegDelete('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.'&$ext&'\UserChoice')
EndFunc


Func ext81()
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Conf. Extens',160,80,0,110)
	;ShellExecuteWait('regedit.exe',' /s VisorImagenesW10.reg')
	$Existe=0
	if WinExists('ARCHIVOS PRUEBA') or WinExists('Paq','Corregir Exten') Then $Existe=1

	global $imagen = ('Visualizador de fotos de Windows')
	global $propimagen = ('Propiedades: IMAGEN')
	global $musica = ('Winamp')
	global $propmusica = ('Propiedades: MUSICA')
	global $video = ('MPC-HC')
	global $propvideo = ('Propiedades: VIDEO')
	global $botoncambiar=('Cam&biar...')

	global $tiempoventana=500
	global $tiempoabajo=100


	principal('IMAGEN.bmp',$propimagen)
	principal('IMAGEN.gif',$propimagen)
	principal('IMAGEN.jpeg',$propimagen)
	principal('IMAGEN.jpg',$propimagen)
	principal('IMAGEN.png',$propimagen)

	principal('MUSICA.flac',$propmusica)
	principal('MUSICA.m3u',$propmusica)
	principal('MUSICA.mp3',$propmusica)
	principal('MUSICA.wav',$propmusica)
	principal('MUSICA.wma',$propmusica)

	principal('VIDEO.avi',$propvideo)
	principal('VIDEO.flv',$propvideo)
	principal('VIDEO.mkv',$propvideo)
	principal('VIDEO.mp4',$propvideo)
	principal('VIDEO.mpeg',$propvideo)
	principal('VIDEO.mpg',$propvideo)
	principal('VIDEO.wmv',$propvideo)


	Do
		WinClose('Tienda')
	Until not WinExists('Tienda')
	if $Existe = 1 Then ShellExecute(@ScriptDir&'\ARCHIVOS PRUEBA')

EndFunc


Func ext10()
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Conf. Extens',160,80,0,110)
	ShellExecuteWait('regedit.exe',' /s VisorImagenesW10.reg')
	$Existe=0
	if WinExists('ARCHIVOS PRUEBA') or WinExists('Paq','Corregir Exten') Then $Existe=1

	global $imagen = ('Visualizador de fotos de Windows')
	global $propimagen = ('Propiedades de IMAGEN')
	global $musica = ('Winamp')
	global $propmusica = ('Propiedades de MUSICA')
	global $video = ('MPC-HC')
	global $propvideo = ('Propiedades de VIDEO')
	global $botoncambiar=('Cam&biar...')

	global $tiempoventana=500
	global $tiempoabajo=100

	principal('IMAGEN.bmp',$propimagen)

	principal('IMAGEN.gif',$propimagen)
	principal('IMAGEN.jpeg',$propimagen)
	principal('IMAGEN.jpg',$propimagen)
	principal('IMAGEN.png',$propimagen)

	principal('MUSICA.flac',$propmusica)
	principal('MUSICA.m3u',$propmusica)
	principal('MUSICA.mp3',$propmusica)
	principal('MUSICA.wav',$propmusica)
	principal('MUSICA.wma',$propmusica)

	principal('VIDEO.avi',$propvideo)
	principal('VIDEO.flv',$propvideo)
	principal('VIDEO.mkv',$propvideo)
	principal('VIDEO.mp4',$propvideo)
	principal('VIDEO.mpeg',$propvideo)
	principal('VIDEO.mpg',$propvideo)
	principal('VIDEO.wmv',$propvideo)


	Do
		WinClose('Tienda')
	Until not WinExists('Tienda')
	if $Existe = 1 Then ShellExecute(@ScriptDir&'\ARCHIVOS PRUEBA')

EndFunc

Func ext10LTSC2019()
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Conf. Extens',160,80,0,110)
	ShellExecuteWait('regedit.exe',' /s VisorImagenesW10.reg')
	$Existe=0
	if WinExists('ARCHIVOS PRUEBA') or WinExists('Paq','Corregir Exten') Then $Existe=1

	global $imagen = ('Visualizador de fotos de Windows')
	global $propimagen = ('Propiedades: IMAGEN')
	global $musica = ('Winamp')
	global $propmusica = ('Propiedades: MUSICA')
	global $video = ('MPC-HC')
	global $propvideo = ('Propiedades: VIDEO')
	global $botoncambiar=('Cam&biar...')

	global $tiempoventana=500
	global $tiempoabajo=100

	principal('IMAGEN.bmp',$propimagen)

	principal('IMAGEN.gif',$propimagen)
	principal('IMAGEN.jpeg',$propimagen)
	principal('IMAGEN.jpg',$propimagen)
	principal('IMAGEN.png',$propimagen)

	principal('MUSICA.flac',$propmusica)
	principal('MUSICA.m3u',$propmusica)
	principal('MUSICA.mp3',$propmusica)
	principal('MUSICA.wav',$propmusica)
	principal('MUSICA.wma',$propmusica)

	principal('VIDEO.avi',$propvideo)
	principal('VIDEO.flv',$propvideo)
	principal('VIDEO.mkv',$propvideo)
	principal('VIDEO.mp4',$propvideo)
	principal('VIDEO.mpeg',$propvideo)
	principal('VIDEO.mpg',$propvideo)
	principal('VIDEO.wmv',$propvideo)


	Do
		WinClose('Tienda')
	Until not WinExists('Tienda')
	if $Existe = 1 Then ShellExecute(@ScriptDir&'\ARCHIVOS PRUEBA')

EndFunc



Func ext10LTSC2021()
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Conf. Extens',160,80,0,110)
	ShellExecuteWait('regedit.exe',' /s VisorImagenesW10.reg')
	$Existe=0
	if WinExists('ARCHIVOS PRUEBA') or WinExists('Paq','Corregir Exten') Then $Existe=1

	global $imagen = ('Visualizador de fotos de Windows')
	global $propimagen = ('Propiedades: IMAGEN')
	global $musica = ('Winamp')
	global $propmusica = ('Propiedades: MUSICA')
	global $video = ('MPC-HC')
	global $propvideo = ('Propiedades: VIDEO')
	global $botoncambiar=('Cam&biar...')

	global $tiempoventana=500
	global $tiempoabajo=100




	principal('IMAGEN.bmp',$propimagen)

	principal('IMAGEN.gif',$propimagen)
	principal('IMAGEN.jpeg',$propimagen)
	principal('IMAGEN.jpg',$propimagen)
	principal('IMAGEN.png',$propimagen)

	principal('MUSICA.flac',$propmusica)
	principal('MUSICA.m3u',$propmusica)
	principal('MUSICA.mp3',$propmusica)
	principal('MUSICA.wav',$propmusica)
	principal('MUSICA.wma',$propmusica)

	principal('VIDEO.avi',$propvideo)
	principal('VIDEO.flv',$propvideo)
	principal('VIDEO.mkv',$propvideo)
	principal('VIDEO.mp4',$propvideo)
	principal('VIDEO.mpeg',$propvideo)
	principal('VIDEO.mpg',$propvideo)
	principal('VIDEO.wmv',$propvideo)


	Do
		WinClose('Tienda')
	Until not WinExists('Tienda')
	if $Existe = 1 Then ShellExecute(@ScriptDir&'\ARCHIVOS PRUEBA')

EndFunc


func principal($arch,$prop)

	abrirpropiedades($arch)
	cerrarloqueestabien()
	if WinExists($prop) Then cambioautomatico($prop)
EndFunc


func cambioautomatico($prop)
	$sentido=0
	$i=-1
	Do
		if $sentido=0 then $i=$i+1
		if $sentido=1 then $i=$i-1
		$j=$i

		if $sentido=0 and $j=0 then $j=1
		abrirventanaeleccion($prop)
		Do
			abajo()
			Sleep($tiempoabajo)
			$j=$j-1
		Until $j=0

	Send('{enter}')
		Sleep($tiempoventana)

		$cont=0
		Do
			Sleep(300)
			$cont=$cont+1
		Until WinGetTitle("[ACTIVE]")<>'' or ($cont >= 5 and WinGetTitle("[ACTIVE]")='')
		if WinGetTitle("[ACTIVE]")='' then
			;FALLA DETECTADA
			send('{tab}{enter}')
			if $sentido=0 then $i=$i-1
			if $sentido=1 then $i=$i+1
		EndIf
		WinWait($prop)

		cerrarloqueestabien()
		if ProcessExists ('Winstore.app.exe') then ProcessClose('Winstore.app.exe')
		if WinExists('Abrir con…') then
			WinClose('Abrir con…')
			$sentido=1
		EndIf
		if $i=0 then $sentido=0

	Until not WinExists($prop)


EndFunc

func abajo()
	send ('{down}')
EndFunc



func abrirventanaeleccion($prop)
	WinActivate($prop)


	ControlClick($prop,$botoncambiar,'Button1')

	Do
		Sleep(200)
	Until WinGetTitle("[ACTIVE]")=''

	Sleep($tiempoventana)
	if @OSVersion='WIN_81' Then send ('{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{enter}')
	if @OSVersion='WIN_10' and $LTSC=2019 Then send ('{up}{enter}')
	if @OSVersion='WIN_10' and $LTSC=2021 Then
;~ 		if not $prueba then MouseClick('left',@DesktopWidth/2,@DesktopHeight/2)
;~ 		MouseClick('left',@DesktopWidth/2,@DesktopHeight/2 - 100)
		$prueba=1
		Sleep(600)
 		send ('{up}{enter}')
		Sleep(200)
		;if WinGetTitle("[ACTIVE]")='' then MsgBox(0,'','detectado!')
	EndIf


	Sleep ($tiempoventana)




EndFunc


func cerrarloqueestabien()
	While WinExists($propvideo,$video)
		WinClose($propvideo,$video)
	wend

	While WinExists($propmusica,$musica)
		WinClose($propmusica,$musica)
	wend

	While WinExists($propimagen,$imagen)
		WinClose($propimagen,$imagen)
	wend
EndFunc



Func abrirpropiedades($arch)
	if @OSVersion='WIN_81' Then
		$dir=(@ScriptDir&'\ARCHIVOS PRUEBA')
		local $aList[9]
		$aList[1] = $arch
		_WinAPI_ShellOpenFolderAndSelectItems($dir, $aList, 1)
		WinWaitActive('ARCHIVOS PRUEBA')
		do
			ControlSend('ARCHIVOS PRUEBA','','DirectUIHWND3','{altdown}{enter}{altup}')
			Sleep(100)
		Until WinExists($propimagen) or WinExists($propmusica) or WinExists ($propvideo)

		Winclose('ARCHIVOS PRUEBA')
		WinWaitclose('ARCHIVOS PRUEBA')
	EndIf


	if @OSVersion='WIN_10' and $LTSC=0 Then ShellExecuteWait('GDProps.exe',' "'&@ScriptDir&'\ARCHIVOS PRUEBA\'& $arch & '"')

	if @OSVersion='WIN_10' and $LTSC=2019 Then
		$dir=(@ScriptDir&'\ARCHIVOS PRUEBA')
		local $aList[9]
		$aList[1] = $arch
		_WinAPI_ShellOpenFolderAndSelectItems($dir, $aList, 1)
		WinWaitActive('ARCHIVOS PRUEBA')
		do
			ControlSend('ARCHIVOS PRUEBA','','DirectUIHWND3','{altdown}{enter}{altup}')
			Sleep(100)
		Until WinExists($propimagen) or WinExists($propmusica) or WinExists ($propvideo)

		Winclose('ARCHIVOS PRUEBA')
		WinWaitclose('ARCHIVOS PRUEBA')
	EndIf

	if @OSVersion='WIN_10' and $LTSC=2021 Then
		$dir=(@ScriptDir&'\ARCHIVOS PRUEBA')
		local $aList[9]
		$aList[1] = $arch
		_WinAPI_ShellOpenFolderAndSelectItems($dir, $aList, 1)

		WinWaitActive('ARCHIVOS PRUEBA')

			do
;~ Sleep(2000)
				ControlSend('ARCHIVOS PRUEBA','','DirectUIHWND2','{altdown}{enter}{altup}')
;~ 				Send('{altdown}{enter}{altup}')
			Sleep(100)
			Until WinExists($propimagen) or WinExists($propmusica) or WinExists ($propvideo)
		Winclose('ARCHIVOS PRUEBA')
		WinWaitclose('ARCHIVOS PRUEBA')
	EndIf

EndFunc
