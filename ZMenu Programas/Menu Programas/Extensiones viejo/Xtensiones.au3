;~ MsgBox(0,'',@OSVersion)
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Conf. Extens',160,80,0,110)
;RegDelete('HKEY_CLASSES_ROOT\.bmp')
;~ RegDelete('HKEY_CLASSES_ROOT\.gif')
;RegDelete('HKEY_CLASSES_ROOT\.jpeg')
;RegDelete('HKEY_CLASSES_ROOT\.jpg')
;RegDelete('HKEY_CLASSES_ROOT\.png')


;RegDelete('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif')
;RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\OpenWithList','a','REG_SZ','PhotoViewer.dll')
;RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\OpenWithList','b','REG_SZ','DllHost.exe')
;RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\OpenWithList','MRUList','REG_SZ','ba')


if @OSVersion='WIN_XP' Then
	$imagen = ('Visor de imágenes y fax de Windows')
	$propimagen = ('Propiedades de IMAGEN')
	$propmusica = ('Propiedades de MUSICA')
	$propvideo = ('Propiedades de VIDEO')
	$botoncambiar=('&Cambiar...')
EndIf

if @OSVersion='WIN_7' Then
	$imagen = ('Visualizador de fotos de Windows')
	$propimagen = ('Propiedades: IMAGEN')
	$propmusica = ('Propiedades: MUSICA')
	$propvideo = ('Propiedades: VIDEO')
	$botoncambiar=('Cam&biar...')
EndIf

if @OSVersion='WIN_10' Then
	$imagen = ('Fotos')
	$propimagen = ('Propiedades de IMAGEN')
	$propmusica = ('Propiedades de MUSICA')
	$propvideo = ('Propiedades de VIDEO')
	$botoncambiar=('Cam&biar...')
EndIf

$musica = ('Winamp')
$video = ('MPC-HC')



$Existe=0
if WinExists('Extensiones') Then
	$Existe=1
	While WinExists('Extensiones')
		WinClose('Extensiones')
	WEnd
EndIf

;Letraunidad()

ShellExecute(@ScriptDir)
MsgBox(0,'','')

;~ WinWait('Extensiones')
While not WinActive('Extensiones')
	WinActivate('Extensiones')
WEnd
WinWaitActive('Extensiones')
if @OSVersion='WIN_XP' then Send('{altdown}{v}{d}{altup}')
if @OSVersion='WIN_7' then Send('{altdown}{v}{e}{altup}')
if @OSVersion='WIN_10' then Sleep(0)
sleep(500)
Send('{space}')
sleep(500)
;~ WinMinimizeAll
;~ WinActivate('Extensiones')
;~ WinWaitActive('Extensiones')
;~ Sleep(800)

$exit=0
While $exit<15
	$exit = $exit + 1

	Send('{altdown}{enter}{altup}')
	WinWaitNotActive('Extensiones')
	sleep(1000)

	WinActivate('Extensiones')
	WinWaitActive('Extensiones')
	Send('{down}')

WEnd

WinClose('Extensiones')
WinWaitClose('Extensiones')

;------	Cerrar las que estan BIEN ----------------
;~ MsgBox(0,'','')
While WinExists($propvideo,$video)
	WinClose($propvideo,$video)
wend

While WinExists($propmusica,$musica)
	WinClose($propmusica,$musica)
wend

While WinExists($propimagen,$imagen)
	WinClose($propimagen,$imagen)
wend
;-----------------------------------------------

;----	VIDEO	-----------------------------------------------------
$exit=0
While $exit= 0

	if WinExists ($propvideo) Then
;~ 				if @OSVersion='WIN_10' then MsgBox(0,'','en windows 10 hay un pequeño error con las ventanas, se queda en un bucle,, revisar')

		WinActivate($propvideo)
		WinWaitActive($propvideo)
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

;--------------------------------------------------------------------

;----	IMAGEN	-----------------------------------------------------
$exit=0
While $exit= 0

	if WinExists ($propimagen) Then
;~ 				if @OSVersion='WIN_10' then MsgBox(0,'','en windows 10 hay un pequeño error con las ventanas, se queda en un bucle,, revisar')

		WinActivate($propimagen)
		WinWaitActive($propimagen)
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

;--------------------------------------------------------------------

;----	MUSICA	-----------------------------------------------------
$exit=0
While $exit= 0

	if WinExists ($propmusica) Then
;~ 				if @OSVersion='WIN_10' then MsgBox(0,'','en windows 10 hay un pequeño error con las ventanas, se queda en un bucle,, revisar')

		WinActivate($propmusica)
		WinWaitActive($propmusica)
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

;--------------------------------------------------------------------

;--------------------------------------------------------------------


;~ MsgBox(0,'',$propimagen)
;~ MsgBox(0,'',$propmusica)
;~ MsgBox(0,'',$propvideo)


if $Existe = 1 Then
	Letraunidad()
EndIf






func Letraunidad()

	if DriveStatus ("C:") <> 'NOTREADY' and  FileExists('C:\Programas y tutoriales\Extensiones') Then shellexecute('C:\Programas y tutoriales\Extensiones')
	if DriveStatus ("D:") <> 'NOTREADY' and  FileExists('D:\Programas y tutoriales\Extensiones') Then shellexecute('D:\Programas y tutoriales\Extensiones')
	if DriveStatus ("E:") <> 'NOTREADY' and  FileExists('E:\Programas y tutoriales\Extensiones') Then shellexecute('E:\Programas y tutoriales\Extensiones')
	if DriveStatus ("F:") <> 'NOTREADY' and  FileExists('F:\Programas y tutoriales\Extensiones') Then shellexecute('F:\Programas y tutoriales\Extensiones')
	if DriveStatus ("G:") <> 'NOTREADY' and  FileExists('G:\Programas y tutoriales\Extensiones') Then shellexecute('G:\Programas y tutoriales\Extensiones')
	if DriveStatus ("H:") <> 'NOTREADY' and  FileExists('H:\Programas y tutoriales\Extensiones') Then shellexecute('H:\Programas y tutoriales\Extensiones')
	if DriveStatus ("I:") <> 'NOTREADY' and  FileExists('I:\Programas y tutoriales\Extensiones') Then shellexecute('I:\Programas y tutoriales\Extensiones')
	if DriveStatus ("J:") <> 'NOTREADY' and  FileExists('J:\Programas y tutoriales\Extensiones') Then shellexecute('J:\Programas y tutoriales\Extensiones')
	if DriveStatus ("K:") <> 'NOTREADY' and  FileExists('K:\Programas y tutoriales\Extensiones') Then shellexecute('K:\Programas y tutoriales\Extensiones')
	if DriveStatus ("L:") <> 'NOTREADY' and  FileExists('L:\Programas y tutoriales\Extensiones') Then shellexecute('L:\Programas y tutoriales\Extensiones')
	if DriveStatus ("M:") <> 'NOTREADY' and  FileExists('M:\Programas y tutoriales\Extensiones') Then shellexecute('M:\Programas y tutoriales\Extensiones')
	if DriveStatus ("N:") <> 'NOTREADY' and  FileExists('N:\Programas y tutoriales\Extensiones') Then shellexecute('N:\Programas y tutoriales\Extensiones')
	if DriveStatus ("O:") <> 'NOTREADY' and  FileExists('O:\Programas y tutoriales\Extensiones') Then shellexecute('O:\Programas y tutoriales\Extensiones')
	if DriveStatus ("P:") <> 'NOTREADY' and  FileExists('P:\Programas y tutoriales\Extensiones') Then shellexecute('P:\Programas y tutoriales\Extensiones')
	if DriveStatus ("Q:") <> 'NOTREADY' and  FileExists('Q:\Programas y tutoriales\Extensiones') Then shellexecute('Q:\Programas y tutoriales\Extensiones')
	if DriveStatus ("R:") <> 'NOTREADY' and  FileExists('R:\Programas y tutoriales\Extensiones') Then shellexecute('R:\Programas y tutoriales\Extensiones')
	if DriveStatus ("S:") <> 'NOTREADY' and  FileExists('S:\Programas y tutoriales\Extensiones') Then shellexecute('S:\Programas y tutoriales\Extensiones')
	if DriveStatus ("T:") <> 'NOTREADY' and  FileExists('T:\Programas y tutoriales\Extensiones') Then shellexecute('T:\Programas y tutoriales\Extensiones')
	if DriveStatus ("U:") <> 'NOTREADY' and  FileExists('U:\Programas y tutoriales\Extensiones') Then shellexecute('U:\Programas y tutoriales\Extensiones')
	if DriveStatus ("V:") <> 'NOTREADY' and  FileExists('V:\Programas y tutoriales\Extensiones') Then shellexecute('V:\Programas y tutoriales\Extensiones')
	if DriveStatus ("W:") <> 'NOTREADY' and  FileExists('W:\Programas y tutoriales\Extensiones') Then shellexecute('W:\Programas y tutoriales\Extensiones')
	if DriveStatus ("X:") <> 'NOTREADY' and  FileExists('X:\Programas y tutoriales\Extensiones') Then shellexecute('X:\Programas y tutoriales\Extensiones')
	if DriveStatus ("Y:") <> 'NOTREADY' and  FileExists('Y:\Programas y tutoriales\Extensiones') Then shellexecute('Y:\Programas y tutoriales\Extensiones')
	if DriveStatus ("Z:") <> 'NOTREADY' and  FileExists('Z:\Programas y tutoriales\Extensiones') Then shellexecute('Z:\Programas y tutoriales\Extensiones')
	IF FileExists(@HomeDrive & '\MenuRED\Menu.exe') Then ShellExecute(@HomeDrive & '\MenuRED\Extensiones')
	IF FileExists(@HomeDrive & '\MenuRED2\Menu.exe') Then ShellExecute(@HomeDrive & '\MenuRED2\Extensiones')
EndFunc
