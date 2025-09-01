#include <WinAPIShellEx.au3>

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Conf. Extens',160,80,0,110)

ShellExecuteWait('regedit.exe',' /s VisorImagenesW10.reg')

$Existe=0
if WinExists('ARCHIVOS PRUEBA') Then $Existe=1



$imagen = ('Visualizador de fotos de Windows')
$propimagen = ('Propiedades: IMAGEN')

$musica = ('Winamp')
$propmusica = ('Propiedades: MUSICA')

$video = ('MPC-HC')
$propvideo = ('Propiedades: VIDEO')

$botoncambiar=('Cam&biar...')





$tiempoventana=500
$tiempoabajo=100


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


if $Existe = 1 Then ShellExecute(@ScriptDir&'\ARCHIVOS PRUEBA')

Exit


func principal($arch,$prop)



; 	MsgBox(0,'',$arch)
; 	MsgBox(0,'',$prop)
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

		Do
		Sleep(300)
		Until WinGetTitle("[ACTIVE]")<>''
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
	send ('{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{enter}')
	Sleep ($tiempoventana)


EndFunc





Func abrirpropiedades($arch)
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

;~ 	ShellExecuteWait('GDProps.exe',' "'&@ScriptDir&'\ARCHIVOS PRUEBA\'& $arch & '"')
;~ 	MsgBox(0,'','aca: '&$arch)

;MsgBox(0,'','')
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


