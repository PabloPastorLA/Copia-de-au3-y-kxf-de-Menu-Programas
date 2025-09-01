#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=ICON.ico
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

$vent='AVS Video Converter 11.0'
$ruta='AVS4YOU\AVSVideoConverter\AVSVideoConverter.exe'
$exe='AVSVideoConverter.exe'



;~ agregar boton para lanzar programa

$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)



lanzar()



#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=AVSConv Loader.kxf
$Form1_1 = GUICreate("Receta VHS", 228, 639, 194, 4)
$Checkbox1 = GUICtrlCreateCheckbox("Archivo Entrada (Tarda MUCHO)", 16, 32, 209, 17)
$Checkbox3 = GUICtrlCreateCheckbox("Navegar / Ubicacion / Guardar", 16, 88, 209, 17)
$Checkbox4 = GUICtrlCreateCheckbox("A MPEG o DVD o AVI", 16, 104, 209, 17)
$Checkbox5 = GUICtrlCreateCheckbox("Editar", 16, 160, 209, 17)
$Checkbox6 = GUICtrlCreateCheckbox("Marcar INICIO", 16, 192, 209, 17)
$Checkbox7 = GUICtrlCreateCheckbox("Repro, pausa  y Marcar FIN", 16, 208, 209, 17)
$Checkbox8 = GUICtrlCreateCheckbox("Verificar en la tijera y volver", 16, 224, 209, 17)
$Checkbox9 = GUICtrlCreateCheckbox("Buscar aproximado el final", 16, 256, 209, 17)
$Checkbox10 = GUICtrlCreateCheckbox("Hacer ZOOM casi al maximo", 16, 272, 209, 17)
$Checkbox11 = GUICtrlCreateCheckbox("Ubicar el final y marcar INICIO", 16, 288, 209, 17)
$Checkbox12 = GUICtrlCreateCheckbox("Quitar ZOOM", 16, 304, 209, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Checkbox13 = GUICtrlCreateCheckbox("Recorrer despacio", 16, 320, 209, 17)
$Checkbox14 = GUICtrlCreateCheckbox("Marcar FIN", 16, 336, 209, 17)
$Checkbox15 = GUICtrlCreateCheckbox("Verificar en la tijera y reproducir", 16, 368, 209, 17)
$Checkbox16 = GUICtrlCreateCheckbox("Recorrer video con slider del preview", 16, 384, 209, 17)
$Button1 = GUICtrlCreateButton("Resetear Checks", 4, 560, 131, 33)
$Group1 = GUICtrlCreateGroup("Salida", 8, 64, 208, 65)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup("Entrada", 8, 8, 208, 49)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group3 = GUICtrlCreateGroup("Editar", 8, 136, 208, 289)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Checkbox17 = GUICtrlCreateCheckbox("Si ok darle a ACEPTAR", 16, 400, 209, 17)
$Group4 = GUICtrlCreateGroup("Convertir", 8, 432, 208, 113)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Checkbox18 = GUICtrlCreateCheckbox("Verif Dif en Tiempos y Rutas Similares", 16, 456, 209, 17)
$Checkbox19 = GUICtrlCreateCheckbox("Abrir Avanzado", 16, 472, 209, 17)
$Checkbox20 = GUICtrlCreateCheckbox("Ajustar DVD a Tamaño max", 16, 488, 209, 17)
$Checkbox21 = GUICtrlCreateCheckbox("¡Convertir!", 16, 504, 209, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Button2 = GUICtrlCreateButton("Lanzar / Activar", 92, 600, 131, 33)
$Checkbox2 = GUICtrlCreateCheckbox("Click en barra de tiempo del video", 16, 176, 209, 17)
$Button3 = GUICtrlCreateButton("Cerrar", 4, 600, 67, 33)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


WinMove($Form1_1,'',@DesktopWidth-233,4)

$ventanaeditor=1


While 1
	if $ventanaeditor=1 and WinExists('Editar archivos de entrada') then ventanaeditor()
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			uncheck()
		Case $Button2
			lanzar()
		Case $Button3
			If 6=MsgBox(4,'Receta VHS','Cerrar AVS Video Converter?') then cerrar()
	EndSwitch
WEnd

func ventanaeditor()
	WinMove('Editar archivos de entrada','',0,0,@DesktopWidth-250,4)
EndFunc

func cerrar()
	do
		ProcessClose('AVSVideoConverter.exe')
		ProcessClose('AVSVideoConverterHost.exe')
	Until not ProcessExists('AVSVideoConverter.exe') and not ProcessExists('AVSVideoConverterHost.exe')
EndFunc

func uncheck()
	For $i=1 to 40
		ControlCommand($Form1_1,'','Button'&$i,'Uncheck','')
	Next
EndFunc

func lanzar()
	if not WinExists($vent) and not ProcessExists($exe) then
		if FileExists ($ProgramFilesDir&'\'&$ruta) then
			ShellExecute($ProgramFilesDir&'\'&$ruta)
		ElseIf FileExists ($ProgramFilesDir&' (x86)\'&$ruta) Then
			ShellExecute($ProgramFilesDir&' (x86)\'&$ruta)
		Else
			MsgBox(0,'AVS Video Converter','No encontre ejecutable. Cerrando')
			Exit
		EndIf
		WinWait($vent)
	EndIf


	Do
		WinActivate($vent)
		WinSetState($vent,'',@SW_SHOW)
		Sleep(100)
	until WinActive($vent)
	;~ WinWaitActive($vent)
	WinMove($vent,'',@DesktopWidth-990,@DesktopHeight/2-150)
EndFunc

