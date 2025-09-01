
If FileExists("TU2010TrialES.exe") AND not FileExists (@ProgramFilesDir & "\TuneUp Utilities 2010\Integrator.exe")  Then

$x=15
$y=15


Global $venta[$x]
Global $texto[$x]
Global $txtcm[$x][$y]
Global $btncm[$x][$y]

$limit=$x - 1

;~ $venta[]=""
;~ $texto[]=""
;~ $txtcm[][1]=""
;~ $btncm[][1]=""
;~ $txtcm[][2]=""
;~ $btncm[][2]=""

$venta[1]="Instalación de TuneUp Utilities"
$texto[1]="Antes de la instalación"
$txtcm[1][1]="Siguiente"
$btncm[1][1]="Button1"

$venta[2]="Instalación de TuneUp Utilities"
$texto[2]="TÉRMINOS"
$txtcm[2][1]="Acepto >"
$btncm[2][1]="Button2"

$venta[3]="Instalación de TuneUp Utilities"
$texto[3]="Instalación de TuneUp Utilities finalizada"
$txtcm[3][1]="&Finalizar"
$btncm[3][1]="Button1"

$venta[4]="Comprobar actualizaciones"
$texto[4]="&No, recordar más adelante:"
$txtcm[4][1]="&No, recordar más adelante:"
$btncm[4][1]="TRadioButton2"
$txtcm[4][2]=""
$btncm[4][2]="TComboBox1"
$txtcm[4][3]="Aceptar"
$btncm[4][3]="TButton1"

$venta[5]="TuneUp Utilities"
$texto[5]="Introducir el código de registro"
$txtcm[5][1]="Introducir el código de registro"
$btncm[5][1]="TButton5"

$venta[6]="Activar producto"
$texto[6]="Activar"
$txtcm[6][1]="Activar"
$btncm[6][1]="TButton2"


$venta[7]="Muchas gracias."
$texto[7]="Muchas gracias po"
$txtcm[7][1]="Aceptar"
$btncm[7][1]="Button1"


$venta[8]="Registro de producto"
$texto[8]="Saltar"
$txtcm[8][1]="&Saltar"
$btncm[8][1]="TButton2"

$venta[9]="Continuar sin registrar el producto"
$texto[9]="&Sí"
$txtcm[9][1]=""
$btncm[9][1]="TComboBox1"
$txtcm[9][2]="&Sí"
$btncm[9][2]="TButton2"

$venta[10]="Es necesario reiniciar el programa"
$texto[10]="Debe reiniciar"
$txtcm[10][1]="Aceptar"
$btncm[10][1]="Button1"

$venta[11]="Instalación de TuneUp Utilities"
$texto[11]="Setup has finished"
;~ $txtcm[11][1]=""
;~ $btncm[11][1]="TNewCheckListBox1"
$txtcm[11][2]="&Finish"
$btncm[11][2]="TNewButton4"


Run("TU2010TrialES")

for $x=1 to $limit step 1
	if $venta[$x] <> "" Then
	winwait($venta[$x],$texto[$x])
	WinActivate($venta[$x],$texto[$x])
	Winwaitactive($venta[$x],$texto[$x])
	for $y=1 to $limit step 1

		If $btncm[$x][$y] <> "" Then
			ControlClick($venta[$x],$txtcm[$x][$y],$btncm[$x][$y])
		EndIf
		If $x=4 and $y=2 Then
			Sleep(1000)
			send("{down}{down}{down}{down}{enter}")
			Sleep(1000)
		EndIf
		If $x=5 and $y=1 Then
			WinWait("Activar producto")
			WinActivate("Activar producto")
			WinwaitActive("Activar producto")
			Send("PabloPastorLA")
			Send("{tab}")
			Send("Cel 0280 - 154 654 999")
			Send("{tab}")
			Send("N1YD6Q-6JP6QP-2JN2MH-05JJVV-M3Q5T3-APTWNR")
		EndIf
		If $x=9 and $y=1 Then
			Sleep(1000)
			send("{down}{down}{down}{down}{enter}")
			Sleep(1000)
		EndIf
	next
	EndIf
next

WinWaitClose($venta[11],$texto[11])

EndIf



#cs run(@ProgramFilesDir & "\TuneUp Utilities 2008\Integrator.exe")
WinWaitActive("TuneUp Utilities 2008: Interfaz de inicio")
ControlClick("Necesita reiniciar el programa", "Aceptar", "Button1")
#ce


;ProcessClose ( "UnlockerAssistant.exe" )
;If $title = "Mozilla Firefox Setup " And $TextLine[8] = "C:\Program Files\Mozilla Firefox\" Or                  ;32bit
;   $title = "Mozilla Firefox Setup " And $TextLine[8] = "C:\Program Files(x86)\Mozilla Firefox\" Then      ;64bit
;Something I do when it's correct
;ElseIf $title = "Mozilla Firefox Setup " And $TextLine[8] = $ProgramFiles & "FireFox\" Then
;Something I do when it's not correct
;Else
;It didn't find what it's supposed to
;EndIf


;run("Unlocker1-9-2.exe")
;WinWaitActive("Installer Language")
;send("{enter}")
;WinWaitActive("Instalación de Unlocker 1.9.2")
;send(" {!s} ")
;WinWaitActive("Instalación de Unlocker 1.9.2","A. Unlocker End User License Agreement")
;WinActivate("Instalación de Unlocker 1.9.2","A. Unlocker End User License Agreement")
;send("{ALTDOWN}{c}{ALTUP}")
;WinWaitActive("Instalación de Unlocker 1.9.2", "Delta Toolbar")
;ControlClick("Instalación de Unlocker 1.9.2", "Advanced", "Button9")
;ControlClick("Instalación de Unlocker 1.9.2", "Install Delta toolbar", "Button5")
;ControlClick("Instalación de Unlocker 1.9.2", "&Siguiente >", "Button2")
;WinWaitActive("Instalación de Unlocker 1.9.2", "Elegir lugar de instalación")
;ControlClick("Instalación de Unlocker 1.9.2", "&Siguiente >", "Button2")

;WinWaitActive("Instalación de Unlocker 1.9.2", "Selección de componentes")
;ControlClick("Instalación de Unlocker 1.9.2", "&Instalar", "Button2")

;WinWaitActive("Instalación de Unlocker 1.9.2", "Unlocker 1.9.2 ha sido instalad")
;ControlClick("Instalación de Unlocker 1.9.2", "&Terminar", "Button2")
;WinWaitClose("Instalación de Unlocker 1.9.2")
;ALT – [!a]
;WinWaitActive("Iniciar sesión - Google Chrome","Iniciar sesión")
;send("{tab}{tab}{tab}{tab}{tab}{space}")
;Sleep(5000)


