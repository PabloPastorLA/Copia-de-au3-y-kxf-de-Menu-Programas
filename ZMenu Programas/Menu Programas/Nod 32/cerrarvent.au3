#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#NoTrayIcon

$out=0

while $out < 480
$out = $out + 1
	;modif()
	cerrar('MenuverificarGUI.exe')
	cerrar('menuverificarCERRAR.exe')

	cerrar('Menu.exe')
	cerrar('autoit3.exe')
	cerrar('ventrun.exe')
	cerrar('AutoIt3.exe')
	cerrar('AutoIt3Wrapper.exe')
	cerrar('MenuRED2.exe')
	cerrar('MenuRED2VENTANAS.exe')
	cerrar('cerrarvent.exe')
	Sleep(500)
WEnd

func cerrar($texto)
	if WinExists('Amenaza detectada',$texto) Then
		While WinExists('Amenaza detectada',$texto)
			WinActivate('Amenaza detectada',$texto)
			ControlClick('Amenaza detectada','','ESET Button Window3')
		WEnd
	EndIf
EndFunc

func modif()
	if WinExists('Amenaza detectada','Menu.exe') Then
		While WinExists('Amenaza detectada','Menu.exe')
			WinActivate('Amenaza detectada','Menu.exe')
			ControlClick('Amenaza detectada','','ESET Button Window3')
		WEnd
	EndIf


	if WinExists('Amenaza detectada','autoit3.exe') Then
		While WinExists('Amenaza detectada','autoit3.exe')
			WinActivate('Amenaza detectada','autoit3.exe')
			ControlClick('Amenaza detectada','','ESET Button Window3')
		WEnd
	EndIf


	if WinExists('Amenaza detectada','ventrun.exe') Then
		While WinExists('Amenaza detectada','ventrun.exe')
			WinActivate('Amenaza detectada','ventrun.exe')
			ControlClick('Amenaza detectada','','ESET Button Window3')
		WEnd
	EndIf


	if WinExists('Amenaza detectada','AutoIt3.exe') Then
		While WinExists('Amenaza detectada','AutoIt3.exe')
			WinActivate('Amenaza detectada','AutoIt3.exe')
			ControlClick('Amenaza detectada','','ESET Button Window3')
		WEnd
	EndIf


	if WinExists('Amenaza detectada','AutoIt3Wrapper.exe') Then
		While WinExists('Amenaza detectada','AutoIt3Wrapper.exe')
			WinActivate('Amenaza detectada','AutoIt3Wrapper.exe')
			ControlClick('Amenaza detectada','','ESET Button Window3')
		WEnd
	EndIf


	if WinExists('Amenaza detectada','MenuRED2.exe') Then
		While WinExists('Amenaza detectada','MenuRED2.exe')
			WinActivate('Amenaza detectada','MenuRED2.exe')
		ControlClick('Amenaza detectada','','ESET Button Window3')
		WEnd
	EndIf


	if WinExists('Amenaza detectada','MenuRED2VENTANAS.exe') Then
		While WinExists('Amenaza detectada','MenuRED2VENTANAS.exe')
			WinActivate('Amenaza detectada','MenuRED2VENTANAS.exe')
			ControlClick('Amenaza detectada','','ESET Button Window3')
		WEnd
	EndIf


	if WinExists('Amenaza detectada','cerrarvent.exe') Then
		While WinExists('Amenaza detectada','cerrarvent.exe')
			WinActivate('Amenaza detectada','cerrarvent.exe')
			ControlClick('Amenaza detectada','','ESET Button Window3')
		WEnd
	EndIf

EndFunc

