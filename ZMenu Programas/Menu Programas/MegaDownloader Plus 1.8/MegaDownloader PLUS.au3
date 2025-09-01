#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=MegaDownloader PLUS.ico
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****



$ventana='MegaDownloader v1.8'






#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=MegaDownloader PLUS.kxf
$Form1_1 = GUICreate("Form1", 200, 126, 192, 124)
$Button1 = GUICtrlCreateButton("MegaDown", 24, 24, 75, 25)
$Button2 = GUICtrlCreateButton("PsiPhon", 24, 72, 75, 25)
$Checkbox1 = GUICtrlCreateCheckbox("Re-Iniciar", 112, 32, 65, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
;~ 	if ControlCommand($Form1_1,'',$Checkbox1,'IsChecked','') and ExisteError()=1 then quitarerror();MsgBox(0,'','si, existe')
	if ControlCommand($Form1_1,'',$Checkbox1,'IsChecked','') then ReIniciar();MsgBox(0,'','si, existe')

	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			mega()
		Case $Button2
			psi()

	EndSwitch
WEnd

func ReIniciar()
	Sleep(300)
	if WinExists('MegaDownloader','Cerrar el programa') then
		Do
			WinClose('MegaDownloader','Cerrar el programa')
		until not WinExists('MegaDownloader','Cerrar el programa')
		Sleep(3000)
		ProcessWaitClose('MegaDownloader.exe')
		mega()

;~ 		ShellExecute
;~ 		darle Iniciar
;~
	EndIf

EndFunc

func quitarerror()
	WinActivate($ventana)
	WinWaitActive($ventana)
;~ 	ControlCommand($ventana,'','WindowsForms10.SysListView32.app.0.141b42a_r13_ad11',
	$cantitems=ControlListView($ventana,'','WindowsForms10.SysListView32.app.0.141b42a_r13_ad11',"GetItemCount")
;~ 	MsgBox(0,'',$cantitems)
	$cantsubitems=ControlListView($ventana,'','WindowsForms10.SysListView32.app.0.141b42a_r13_ad11',"GetSubItemCount")
;~ 	MsgBox(0,'',$cantsubitems)


;recorro todo
	for $i=0 to $cantitems-1 step 1
		for $j=0 to $cantsubitems-1 Step 1
;~ 			MsgBox(0,'',ControlListView($ventana,'','WindowsForms10.SysListView32.app.0.141b42a_r13_ad11',"GetText", $i, $j))
;~ 			MsgBox(0,'','$i= '&$i&@CRLF&'$j= '&$j)
		Next
	Next

	for $i=0 to $cantitems-1 step 1
;~ 		for $j=0 to $cantsubitems-1 Step 1
;~ 			MsgBox(0,'',ControlListView($ventana,'','WindowsForms10.SysListView32.app.0.141b42a_r13_ad11',"GetText", $i, 4))
			if 'error'=ControlListView($ventana,'','WindowsForms10.SysListView32.app.0.141b42a_r13_ad11',"GetText", $i, 4) then
				ControlListView($ventana,'','WindowsForms10.SysListView32.app.0.141b42a_r13_ad11',"SelectClear")
				ControlListView($ventana,'','WindowsForms10.SysListView32.app.0.141b42a_r13_ad11',"Select", $i, 4)
			EndIf


;~ 			MsgBox(0,'','$i= '&$i&@CRLF&'$j= '&$j)
;~ 		Next
	Next





EndFunc
func ExisteError()
;~ 	WinActivate($ventana)
;~ 	ControlCommand($ventana,'','WindowsForms10.SysListView32.app.0.141b42a_r13_ad11',
	$cantitems=ControlListView($ventana,'','WindowsForms10.SysListView32.app.0.141b42a_r13_ad11',"GetItemCount")
;~ 	MsgBox(0,'',$cantitems)
	$cantsubitems=ControlListView($ventana,'','WindowsForms10.SysListView32.app.0.141b42a_r13_ad11',"GetSubItemCount")
;~ 	MsgBox(0,'',$cantsubitems)


;recorro todo
	for $i=0 to $cantitems-1 step 1
		for $j=0 to $cantsubitems-1 Step 1
;~ 			MsgBox(0,'',ControlListView($ventana,'','WindowsForms10.SysListView32.app.0.141b42a_r13_ad11',"GetText", $i, $j))
;~ 			MsgBox(0,'','$i= '&$i&@CRLF&'$j= '&$j)
		Next
	Next



	for $i=0 to $cantitems-1 step 1
;~ 		for $j=0 to $cantsubitems-1 Step 1
;~ 			MsgBox(0,'',ControlListView($ventana,'','WindowsForms10.SysListView32.app.0.141b42a_r13_ad11',"GetText", $i, 4))
			if 'error'=ControlListView($ventana,'','WindowsForms10.SysListView32.app.0.141b42a_r13_ad11',"GetText", $i, 4) then Return 1

;~ 			MsgBox(0,'','$i= '&$i&@CRLF&'$j= '&$j)
;~ 		Next
	Next





EndFunc

func mega()
	if WinExists($ventana) and ProcessExists('MegaDownloader.exe') Then
		WinActivate($ventana)
	Elseif FileExists(@ProgramFilesDir&'\MegaDownloader\MegaDownloader.exe') Then
		ShellExecute(@ProgramFilesDir&'\MegaDownloader\MegaDownloader.exe')
	ElseIf FileExists(@ProgramFilesDir&' (x86)\MegaDownloader\MegaDownloader.exe') Then
		ShellExecute(@ProgramFilesDir&' (x86)\MegaDownloader\MegaDownloader.exe')
	Else
		MsgBox(0,'','Error no encuentro ejecutable megadownloader')
	EndIf
EndFunc

func psi()
	if WinExists('Psiphon 3') and ProcessExists('psiphon3.exe') Then
		WinActivate('Psiphon 3')
	Elseif FileExists(@ProgramFilesDir&'\MegaDownloader\psiphon3.exe') Then
		ShellExecute(@ProgramFilesDir&'\MegaDownloader\psiphon3.exe')
	ElseIf FileExists(@ProgramFilesDir&' (x86)\MegaDownloader\psiphon3.exe') Then
		ShellExecute(@ProgramFilesDir&' (x86)\MegaDownloader\psiphon3.exe')
	Else
		MsgBox(0,'','Error no encuentro ejecutable psiphon')
	EndIf
EndFunc
