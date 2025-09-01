#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#cs
firefox --private-window "google.com"
firefox -new-tab "google.com"
chrome google.com
chrome -incognito google.com
#ce



#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <EditConstants.au3>


global $tipo='', $cont=''
global $nav=''
global $priv=0, $bitprog=0, $bitpelis=0, $bitdd=0, $bittorr=0, $bitjuegos=0
global $ff=0, $fc=0
global $parametro=''
global $busqueda='', $busquedaclip='', $busquedaprimerletra='', $busquedaconguion='', $busquedaconmas='', $busquedaconporc20=''




$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6) = ' (x86)' then $ProgramFilesDir= StringTrimRight($ProgramFilesDir,6)


#Region ### START Koda GUI section ### Form=descarga.kxf
$Formulario = GUICreate("Buscador de descargas", 339, 155, 192, 124)
$Input1 = GUICtrlCreateInput("Que estas buscando?", 16, 16, 129, 21)
$Checkbox10 = GUICtrlCreateCheckbox("Programas", 16, 64, 105, 17)
$Checkbox11 = GUICtrlCreateCheckbox("Pelis", 16, 80, 105, 17)
$Checkbox12 = GUICtrlCreateCheckbox("Juegos", 16, 96, 105, 17)
$Checkbox1 = GUICtrlCreateCheckbox("Descarga Directa", 128, 64, 105, 17)
$Checkbox2 = GUICtrlCreateCheckbox("Torrent", 128, 80, 105, 17)
$Checkbox5 = GUICtrlCreateCheckbox("INCOGNITO", 240, 104, 89, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Button1 = GUICtrlCreateButton("Buscar", 16, 120, 75, 25, $BS_DEFPUSHBUTTON)
$Label1 = GUICtrlCreateLabel("Buscar:", 16, 48, 40, 17)
$Label2 = GUICtrlCreateLabel("En:", 128, 48, 20, 17)
$Label3 = GUICtrlCreateLabel("Con:", 240, 48, 26, 17)
$Checkbox6 = GUICtrlCreateRadio("Firefox", 240, 64, 89, 17)
$Checkbox7 = GUICtrlCreateRadio("Chrome", 240, 80, 89, 17)
#EndRegion ### END Koda GUI section ###

inicio()


	While 1

		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				Exit
			Case $Button1
				correr()
			Case $Checkbox6
				GUICtrlSetState($Checkbox7,4)
			Case $Checkbox7
				GUICtrlSetState($Checkbox6,4)
		EndSwitch

	WEnd


func inicio()
	;~ Global $vent=WinGetTitle($Formulario)
	GUICtrlSetState($Checkbox5,1)
	GUICtrlSetState($Checkbox6,1)

	if not FileExists($ProgramFilesDir&'\Mozilla Firefox\firefox.exe') and not FileExists($ProgramFilesDir&' (x86)\Mozilla Firefox\firefox.exe') Then $ff=1
	if not FileExists($ProgramFilesDir&'\Google\Chrome\Application\chrome.exe') and not FileExists($ProgramFilesDir&' (x86)\Google\Chrome\Application\chrome.exe') Then $fc=1

	if $ff then
		GUICtrlSetState($Checkbox6,132)
		GUICtrlSetState($Checkbox7,1)
	EndIf
	if $fc then
		GUICtrlSetState($Checkbox7,132)
		GUICtrlSetState($Checkbox6,1)
	EndIf
	if $ff and $fc then
		GUICtrlSetState($Checkbox6,132)
		GUICtrlSetState($Checkbox7,132)
		MsgBox(0,'','No tenes navegador, instala uno y reinicia el programa.')
		GUISetState(@SW_SHOW)
		Exit
	EndIf
	GUISetState(@SW_SHOW)
	ControlFocus($Formulario,'',$Input1)

EndFunc


func correr()

	grisear()


	; Navegadores y parametro modo incognito
	if GUICtrlRead($Checkbox5) <> 1 then $priv = 0
	if GUICtrlRead($Checkbox5)  = 1 then $priv = 1

	if GUICtrlRead($Checkbox6)  = 1 then
		$nav='firefox'
		if $priv = 0 then $parametro='-new-tab '
		if $priv = 1 then $parametro='--private-window '
	EndIf
	if GUICtrlRead($Checkbox7)  = 1 then
		$nav='chrome'
		if $priv = 0 then $parametro=''
		if $priv = 1 then $parametro='-incognito '
	EndIf
	; -------------------------------




	;Setear bits de busqueda
	if GUICtrlRead($Checkbox1) <> 1 then $bitdd = 0
	if GUICtrlRead($Checkbox1)  = 1 then $bitdd = 1

	if GUICtrlRead($Checkbox2) <> 1 then $bittorr = 0
	if GUICtrlRead($Checkbox2)  = 1 then $bittorr = 1



	if GUICtrlRead($Checkbox10) <> 1 then $bitprog = 0
	if GUICtrlRead($Checkbox10)  = 1 then $bitprog = 1

	if GUICtrlRead($Checkbox11) <> 1 then $bitpelis = 0
	if GUICtrlRead($Checkbox11)  = 1 then $bitpelis = 1

	if GUICtrlRead($Checkbox12) <> 1 then $bitjuegos = 0
	if GUICtrlRead($Checkbox12)  = 1 then $bitjuegos = 1
	; -------------------------------


	;VERIFICACIONES
	;verificar que ingresaste algo para buscar
	if GUICtrlRead($Input1)='Que estas buscando?' then
		MsgBox(0,'','Que estas buscando? :)')
		degrisear()
		ControlFocus($Formulario,'',$Input1)
		Return
	EndIf
	;verificar contenido
	if $bitprog=0 and $bitpelis=0 and $bitjuegos=0 then
		MsgBox(0,'','Programas pelis y/o juegos? :)')
		degrisear()
		ControlFocus($Formulario,'',$Input1)
		Return
	EndIf
	;verificar dd o torrent
	if $bitdd=0 and $bittorr=0 then
		MsgBox(0,'','Descarga directa y/o torrent? :)')
		degrisear()
		ControlFocus($Formulario,'',$Input1)
		Return
	EndIf
	; -------------------------------



	;Formatear texto de entrada
	$busqueda=GUICtrlRead($Input1)
;~ 	MsgBox(0,'',$busqueda)
	; -------------------------------


	input()
	links()
	resetear()
	degrisear()


EndFunc

func resetear()
	$busqueda=''
	$busquedaclip=''
	$busquedaprimerletra=''
	$busquedaconguion=''
	$busquedaconmas=''
	$busquedaconporc20=''
EndFunc

func grisear()
	GUICtrlSetState($Input1,128)
	GUICtrlSetState($Button1,128)

	for $i=1 to 20 step 1
		GUICtrlSetState(Eval('Checkbox'&$i),128)
	Next
EndFunc


func degrisear()
	GUICtrlSetState($Input1,64)
	GUICtrlSetState($Button1,64)

	for $i=1 to 20 step 1
		GUICtrlSetState(Eval('Checkbox'&$i),64)
	Next


EndFunc



func links()


	Local $links[25][6] = [['https://es.taiwebs.com/s/?s='&$busquedaconmas&'&lang=AR'															, 1, 0, 1, 0, 1 ] _
			, ['https://thepiratebay10.org/search/'&$busquedaconporc20&'/1/99/0'																, 0, 1, 1, 1, 1 ] _
			, ['https://1337x.to/search/'&$busquedaconmas&'/1/'																					, 0, 1, 1, 1, 1 ] _
			, ['https://yts.mx/browse-movies/'&$busquedaconporc20&'/all/all/0/featured/0/all'													, 0, 1, 1, 1, 1 ] _
			, ['https://eztv.re/search/'&$busquedaconguion																						, 0, 1, 1, 1, 1 ] _
			, ['https://zooqle.com/search?q='&$busquedaconmas																					, 0, 1, 1, 1, 1 ] _
			, ['https://www.limetorrents.info/search/all/'&$busquedaconguion&'/'																, 0, 1, 1, 1, 1 ] _
			, ['https://torrentdownloads.info/search/?new=1&s_cat=0&search='&$busquedaconmas													, 0, 1, 1, 1, 1 ] _
			, ['https://kickasstorrents.to/usearch/'&$busquedaconporc20&'/'																		, 0, 1, 1, 1, 1 ] _
			, ['https://www.magnetdl.com/'&$busquedaprimerletra&'/'&$busquedaconguion&'/'														, 0, 1, 1, 1, 1 ] _
			, ['https://torrentz2.is/search?f='&$busquedaconmas																					, 0, 1, 1, 1, 1 ] _
			, ['https://www.pirate-bay.net/search?q='&$busquedaconmas&'?q='&$busquedaconmas														, 0, 1, 1, 1, 1 ] _
			, ['https://katcr.to/usearch/'&$busquedaconporc20&'/'																				, 0, 1, 1, 1, 1 ] _
			, ['https://rarbggo.org/torrents.php?search='&$busquedaconmas																		, 0, 1, 1, 1, 1 ] _
			, ['https://www.torlock.com/all/torrents/'&$busquedaconguion&'.html?'																, 0, 1, 1, 1, 1 ] _
			, ['https://idope.se/torrent-list/'&$busquedaconporc20&'/'																			, 0, 1, 1, 1, 1 ] _
			, ['https://www.gtdb.to/search_results.php?search='&$busquedaconmas&'&cat=0&incldead=0&inclexternal=0&lang=0&sort=id&order=desc'	, 0, 1, 1, 1, 1 ] _
			, ['https://torrentgalaxy.to/torrents.php?search='&$busquedaconmas&'#results'														, 0, 1, 1, 1, 1 ] _
			, ['https://www.torrentfunk.com/all/torrents/'&$busquedaconguion&'.html'															, 0, 1, 1, 1, 1 ] _
			, ['https://www.skytorrents.to/?search='&$busquedaconporc20																			, 0, 1, 1, 1, 1 ] _
			, ['https://muacknet.ipower.com/?web=IV&q='&$busquedaconmas																			, 1, 0, 1, 0, 0 ] _
			, ['https://www.compucalitv.com/?s='&$busquedaconmas																				, 1, 0, 1, 1, 1 ] _
			, ['https://portableapps.com/search/node/'&$busquedaconporc20																		, 1, 0, 1, 0, 0 ] _
			, ['https://www.thenekodark.com/?s='&$busquedaconmas																				, 1, 0, 1, 1, 1 ] _
			, ['dummy'																															, 0, 0, 0, 0, 0 ]] ; <---- A ESTE NO TOCARLO
	;       , ['Pag'																															, 'DD', 'Torr', 'Prog', 'Pelis', 'Juegos']]

			;~ 	 _ArrayDisplay($aWords)






	global $m=0
	;, $listo=0

	for $i=0 to (UBound($links) - 2) step 1
		if     (   ($bitdd = 1 and $bitdd = $links[$i][1]) or ($bittorr = 1 and $bittorr = $links[$i][2])   )     and     (   ($bitprog = 1 and $bitprog = $links[$i][3]) or ($bitpelis = 1 and $bitpelis = $links[$i][4]) or ($bitjuegos = 1 and $bitjuegos = $links[$i][5])   )  then
			;if not ProcessExists($nav&'.exe') then ShellExecute($nav)

			ShellExecute($nav,$parametro&$links[$i][0])
			if $m =0 and $nav='firefox' Then
				Sleep(1000)
;~ 				$listo = 1
			EndIf

			;pausar cada 10 y preg
			$m=$m+1

			if $m=8 and $links[$i+1][0] <> 'dummy' then
				$m=0
				if 7=MsgBox(4,'Descargas','Continuar con las proximas paginas?') then Return
			EndIf

		EndIf

	Next





	; DESCARGA POR PORTAPAPELES
	ClipPut($busquedaclip)
	MsgBox(0,'','Copiado al portapapeles')
	ClipPut($busquedaclip)

	if $bitdd = 1 then
		ShellExecute($nav,$parametro&'https://www.megawarez.org/')
		ShellExecute($nav,$parametro&'https://www.appnee.com/')
	EndIf

	if $bittorr = 1 then
		ShellExecute($nav,$parametro&'https://extratorrents.it/')
	EndIf
	; ----------------------------

EndFunc


func input()
	global $busquedaclip=$busqueda
	global $busquedaprimerletra=''
	$busquedaprimerletra=StringLeft($busqueda,1)
;~ MsgBox(0,'',$busquedaprimerletra)
	if $busqueda='' then Return
	Do
		if StringLeft($busqueda,1)<>' ' then
			$busquedaconmas=$busquedaconmas&StringLeft($busqueda,1)
			$busquedaconguion=$busquedaconguion&StringLeft($busqueda,1)
			$busquedaconporc20=$busquedaconporc20&StringLeft($busqueda,1)
		Else
		EndIf

		if StringLeft($busqueda,1)=' ' then $busquedaconmas=$busquedaconmas&'+'
		if StringLeft($busqueda,1)=' ' then $busquedaconguion=$busquedaconguion&'-'
		if StringLeft($busqueda,1)=' ' then $busquedaconporc20=$busquedaconporc20&'%20'
		$busqueda=StringTrimLeft($busqueda,1)
	until $busqueda=''



EndFunc






func clip()
	ClipPut($busquedaclip)
	MsgBox(0,'','Copiado al portapapeles')
	ClipPut($busquedaclip)
EndFunc


func Torrent()

	clip()
	ShellExecute($nav,$parametro&'https://extratorrents.it/')

EndFunc


func DD()

	clip()
	ShellExecute($nav,$parametro&'https://www.megawarez.org/')
	ShellExecute($nav,$parametro&'https://www.appnee.com/')

EndFunc
