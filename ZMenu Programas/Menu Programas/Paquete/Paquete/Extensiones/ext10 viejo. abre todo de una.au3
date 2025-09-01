#include <WinAPIShellEx.au3>

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Conf. Extens',160,80,0,110)

ShellExecuteWait('regedit.exe',' /s VisorImagenesW10.reg')

$Existe=0
if WinExists('ARCHIVOS PRUEBA') Then $Existe=1



$imagen = ('Visualizador de fotos de Windows')
$imagen = ('Fotos')
$musica = ('Winamp')
$video = ('MPC-HC')
$propimagen = ('Propiedades de IMAGEN')
$propmusica = ('Propiedades de MUSICA')
$propvideo = ('Propiedades de VIDEO')
$botoncambiar=('Cam&biar...')


abrirtodaslaspropiedades()
cerrarloqueestabien()
cambiarloqueestamal()




if $Existe = 1 Then ShellExecute(@ScriptDir&'\ARCHIVOS PRUEBA')




func abrirtodaslaspropiedades()

abrirpropiedades('IMAGEN.bmp')
abrirpropiedades('IMAGEN.gif')
abrirpropiedades('IMAGEN.jpeg')
abrirpropiedades('IMAGEN.jpg')
abrirpropiedades('IMAGEN.png')

abrirpropiedades('MUSICA.flac')
abrirpropiedades('MUSICA.m3u')
abrirpropiedades('MUSICA.mp3')
abrirpropiedades('MUSICA.wav')
abrirpropiedades('MUSICA.wma')

abrirpropiedades('VIDEO.avi')
abrirpropiedades('VIDEO.flv')
abrirpropiedades('VIDEO.mkv')
abrirpropiedades('VIDEO.mp4')
abrirpropiedades('VIDEO.mpeg')
abrirpropiedades('VIDEO.mpg')
abrirpropiedades('VIDEO.wmv')

EndFunc


func cambiarloqueestamal()
	$exit=0
	While $exit= 0
		if WinExists ($propvideo) Then
			if not WinActive($propvideo) Then
				WinActivate($propvideo)
				WinWaitActive($propvideo)
			EndIf
			ControlClick($propvideo,$botoncambiar,'Button1')
			if @OSVersion='WIN_10' Then
				While WinActive($propvideo)
					Sleep(500)
				WEnd
				Sleep(1000)
				While not WinActive($propvideo)
					Sleep(500)
				WEnd
			EndIf
			WinWaitClose('Abrir con')
			WinClose($propvideo,$video)
		Else
			$exit=1
		EndIf
	WEnd

	$exit=0
	While $exit= 0
		if WinExists ($propimagen) Then
			if not WinActive($propimagen) Then
				WinActivate($propimagen)
				WinWaitActive($propimagen)
			EndIf
			ControlClick($propimagen,$botoncambiar,'Button1')
			if @OSVersion='WIN_10' Then
				While WinActive($propimagen)
					Sleep(500)
				WEnd
				Sleep(1000)
				While not WinActive($propimagen)
					Sleep(500)
				WEnd
			EndIf
			WinWaitClose('Abrir con')
			WinClose($propimagen,$imagen)
		Else
			$exit=1
		EndIf
	WEnd

	$exit=0
	While $exit= 0
		if WinExists ($propmusica) Then
			if not WinActive($propmusica) Then
				WinActivate($propmusica)
				WinWaitActive($propmusica)
			EndIf
			ControlClick($propmusica,$botoncambiar,'Button1')
			if @OSVersion='WIN_10' Then
				While WinActive($propmusica)
					Sleep(500)
				WEnd
				Sleep(1000)
				While not WinActive($propmusica)
					Sleep(500)
				WEnd
			EndIf
			WinWaitClose('Abrir con')
			WinClose($propmusica,$musica)
		Else
			$exit=1
		EndIf
	WEnd
EndFunc


Func abrirpropiedades($arch)
	$dir=(@ScriptDir&'\ARCHIVOS PRUEBA')
	local $aList[9]
	$aList[1] = $arch
	_WinAPI_ShellOpenFolderAndSelectItems($dir, $aList, 1)
	WinWaitActive('ARCHIVOS PRUEBA')
	ControlSend('ARCHIVOS PRUEBA','','DirectUIHWND3','{altdown}{enter}{altup}')
	ControlSend('ARCHIVOS PRUEBA','','DirectUIHWND3','{altdown}{enter}{altup}')
	ControlSend('ARCHIVOS PRUEBA','','DirectUIHWND3','{altdown}{enter}{altup}')
	Winclose('ARCHIVOS PRUEBA')
	WinWaitclose('ARCHIVOS PRUEBA')
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




;~ MsgBox(0,'',@OSVersion)
;RegDelete('HKEY_CLASSES_ROOT\.bmp')
;~ RegDelete('HKEY_CLASSES_ROOT\.gif')
;RegDelete('HKEY_CLASSES_ROOT\.jpeg')
;RegDelete('HKEY_CLASSES_ROOT\.jpg')
;RegDelete('HKEY_CLASSES_ROOT\.png')


;RegDelete('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif')
;RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\OpenWithList','a','REG_SZ','PhotoViewer.dll')
;RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\OpenWithList','b','REG_SZ','DllHost.exe')
;RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\OpenWithList','MRUList','REG_SZ','ba')




;~ if @OSVersion='WIN_XP' Then
;~ 	$imagen = ('Visor de imágenes y fax de Windows')
;~ 	$propimagen = ('Propiedades de IMAGEN')
;~ 	$propmusica = ('Propiedades de MUSICA')
;~ 	$propvideo = ('Propiedades de VIDEO')
;~ 	$botoncambiar=('&Cambiar...')
;~ EndIf

;~ if @OSVersion='WIN_7' Then
;~ 	$imagen = ('Visualizador de fotos de Windows')
;~ 	$propimagen = ('Propiedades: IMAGEN')
;~ 	$propmusica = ('Propiedades: MUSICA')
;~ 	$propvideo = ('Propiedades: VIDEO')
;~ 	$botoncambiar=('Cam&biar...')
;~ EndIf





;~ 	While WinExists('ARCHIVOS PRUEBA')
;~ 		WinClose('ARCHIVOS PRUEBA')
;~ 	WEnd
;~ EndIf

;Letraunidad()

;~ ShellExecute(@ScriptDir&'\ARCHIVOS PRUEBA')
;MsgBox(0,'','')

;~ WinWait('Extensiones')
;~ While not WinActive('ARCHIVOS PRUEBA')
;~ 	WinActivate('ARCHIVOS PRUEBA')
;~ WEnd
;~ WinWaitActive('ARCHIVOS PRUEBA')
;~ if @OSVersion='WIN_XP' then Send('{altdown}{v}{d}{altup}')
;~ if @OSVersion='WIN_7' then Send('{altdown}{v}{e}{altup}')
;~ if @OSVersion='WIN_10' then Sleep(0)
;~ sleep(500)
;~ Send('{space}')
;~ sleep(500)
;~ WinMinimizeAll
;~ WinActivate('Extensiones')
;~ WinWaitActive('Extensiones')
;~ Sleep(800)

;~ $exit=0
;~ While $exit<17
;~ 	$exit = $exit + 1

;~ 	Send('{altdown}{enter}{altup}')
;~ 	WinWaitNotActive('ARCHIVOS PRUEBA')
;~ 	sleep(500)

;~ 	WinActivate('ARCHIVOS PRUEBA')
;~ 	WinWaitActive('ARCHIVOS PRUEBA')
;~ 	Send('{down}')

;~ WEnd

;~ WinClose('ARCHIVOS PRUEBA')
;~ WinWaitClose('ARCHIVOS PRUEBA')

;------	Cerrar las que estan BIEN ----------------
;~ MsgBox(0,'','')

;-----------------------------------------------



