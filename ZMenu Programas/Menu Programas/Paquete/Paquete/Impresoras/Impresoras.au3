If @OSVersion <> 'WIN_XP' Then
	#RequireAdmin
EndIf
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=menuicono.ico
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <File.au3>
#include <WinAPIFiles.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Date.au3>
#include <GuiTab.au3>






;  ___       _      _          ____ _   _ ___			--------------------------------------------------------------------------------------------------
; |_ _|_ __ (_) ___(_) ___    / ___| | | |_ _|			--------------------------------------------------------------------------------------------------
;  | || '_ \| |/ __| |/ _ \  | |  _| | | || |			--------------------------------------------------------------------------------------------------
;  | || | | | | (__| | (_) | | |_| | |_| || |			--------------------------------------------------------------------------------------------------
; |___|_| |_|_|\___|_|\___/   \____|\___/|___|			--------------------------------------------------------------------------------------------------





#Region ### START Koda GUI section ### Form=Impresoras.kxf
$Menu = GUICreate("Menu", 376, 426, 192, 1)
$BotonCorrer = GUICtrlCreateButton("Correr", 28, 384, 75, 25)
$BotonSalir = GUICtrlCreateButton("Salir", 284, 382, 75, 25)
$OculExt = GUICtrlCreateButton("OculExt", 304, 50, 55, 25)
$MostExt = GUICtrlCreateButton("MostExt", 304, 20, 55, 25)
$Tab1 = GUICtrlCreateTab(0, 16, 273, 353)
GUICtrlSetFont(-1, 9, 400, 0, "Arial")
$TabSheet1 = GUICtrlCreateTabItem("Programas")
$Group7 = GUICtrlCreateGroup("Video", 40, 87, 201, 145)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button101 = GUICtrlCreateCheckbox("Nvidia 341.74 x64", 52, 130, 121, 17)
$Button102 = GUICtrlCreateCheckbox("GTX 1060 (completar)", 52, 146, 121, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group6 = GUICtrlCreateGroup("Impresoras", 40, 246, 201, 113)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button201 = GUICtrlCreateCheckbox("Kyocera 2035dn", 52, 273, 165, 17)
$Button202 = GUICtrlCreateCheckbox("HP Laser 103 107 108 (OFFLINE)", 52, 289, 181, 17)
$Button203 = GUICtrlCreateCheckbox("Epson L380", 52, 305, 181, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Autoit = GUICtrlCreateCheckbox("AUTOIT", 48, 61, 101, 17)
GUICtrlSetFont(-1, 9, 400, 0, "Arial")
GUICtrlCreateTabItem("")
$Dir = GUICtrlCreateButton("Dir", 304, 90, 55, 25)
$Devmgmt = GUICtrlCreateButton("Devmgmt", 304, 162, 55, 25)
$DispImp = GUICtrlCreateButton("Disp Imp", 304, 122, 55, 25)
$PrintUI = GUICtrlCreateButton("PrintUI", 305, 194, 55, 25)
$ColaImp = GUICtrlCreateButton("Cola Imp", 305, 226, 55, 25)
$Button1 = GUICtrlCreateButton("MajorGeeks", 296, 272, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

CorrerUnaUnicaVez()

While 1

	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $BotonSalir
			exit
		Case $BotonCorrer
			$cont = 1
			$rta = 7


			$rta = 0
			If $rta = 2 Then $cont = 0

;			If $cont = 1 And GUICtrlRead($Button80) = 1 Then $rta = MsgBox(1, 'Menu', 'Ha seleccionado REINICIAR. Desea continuar?')
			If $rta = 2 Then $cont = 0

			If $cont = 1 Then $rta = MsgBox(1, 'Menu', 'Largamos, cancela o dale para adelante')

			If $rta = 2 Then $cont = 0
			If $cont = 1 Then Botoncorrer()


		Case $OculExt
			OculExt()
		Case $MostExt
			MostExt()
		Case $Devmgmt
			ShellExecute('devmgmt.msc')
		Case $PrintUI
			ShellExecute('printui',' /s /t2')
		Case $ColaImp
			ShellExecute(@WindowsDir&'\system32\spool\PRINTERS')

		Case $dir
			ShellExecute(@ScriptDir)
		case $DispImp
			ShellExecute('control',' /name Microsoft.DevicesAndPrinters')
		case $Button1
			MsgBox(0,'','https://www.majorgeeks.com/content/page/backup_and_restore_printers.html')
	EndSwitch
WEnd




;  ___       _      _         _____                   ____              _			----------------------------------------------------------------------
; |_ _|_ __ (_) ___(_) ___   |  ___|   _ _ __   ___  |  _ \ _ __   __ _| |			----------------------------------------------------------------------
;  | || '_ \| |/ __| |/ _ \  | |_ | | | | '_ \ / __| | |_) | '_ \ / _` | |			----------------------------------------------------------------------
;  | || | | | | (__| | (_) | |  _|| |_| | | | | (__  |  __/| |_) | (_| | |			----------------------------------------------------------------------
; |___|_| |_|_|\___|_|\___/  |_|   \__,_|_| |_|\___| |_|   | .__/ \__,_|_|			----------------------------------------------------------------------
;                                                          |_|						----------------------------------------------------------------------




Func Botoncorrer()

	If GUICtrlRead($Autoit) = 1 Then Autoit()


	;VIDEO
	If GUICtrlRead($Button101) = 1 Then Nvidia_341_74_x64()
	If GUICtrlRead($Button102) = 1 Then Nada()



	;IMPRESORAS
	If GUICtrlRead($Button201) = 1 Then Kyocera_2035dn()
	If GUICtrlRead($Button202) = 1 Then HP_103_107_108()
	If GUICtrlRead($Button203) = 1 Then Epson_L380()



EndFunc   ;==>Botoncorrer






;---------------------------------------------------------------------------------

; ____  _  _  __ _   ___    ____  ____  ____  __   ____   __   ____
;(  __)/ )( \(  ( \ / __)  (  __)/ ___)(_  _)/ _\ (    \ /  \ / ___)
; ) _) ) \/ (/    /( (__    ) _) \___ \  )( /    \ ) D ((  O )\___ \
;(__)  \____/\_)__) \___)  (____)(____/ (__)\_/\_/(____/ \__/ (____/


Func ponerestados()

	For $i = 1 To 80 Step 1 ;Programas
		GUICtrlSetState(Eval('Button' & $i), 128)
	Next

	For $i = 100 To 129 Step 1 ;Juegos
		GUICtrlSetState(Eval('Button' & $i), 128)
	Next

	For $i = 300 To 350 Step 1 ;Progs
		GUICtrlSetState(Eval('Button' & $i), 128)
	Next

	GUICtrlSetState($BotonCorrer, 128)
	GUICtrlSetState($BotonSalir, 128)
	GUICtrlSetState($Devmgmt, 128)
	GUICtrlSetState($MostExt, 128)
	GUICtrlSetState($OculExt, 128)

EndFunc   ;==>ponerestados

Func sacarestados()

	For $i = 1 To 80 Step 1
		GUICtrlSetState(Eval('Button' & $i), 64)
	Next

	For $i = 100 To 129 Step 1 ;Juegos
		GUICtrlSetState(Eval('Button' & $i), 64)
	Next

	For $i = 300 To 350 Step 1 ;Progs
		GUICtrlSetState(Eval('Button' & $i), 64)
	Next

;~ 	if FileExists(@DesktopDir & "\Mal Verificado.txt") then GUICtrlSetState($Label1,16)

	GUICtrlSetState($BotonCorrer, 64)
	GUICtrlSetState($BotonSalir, 64)
	GUICtrlSetState($Devmgmt, 64)
	GUICtrlSetState($MostExt, 64)
	GUICtrlSetState($OculExt, 64)
EndFunc   ;==>sacarestados

; ____  __  __ _    ____  ____  ____  __   ____   __   ____
;(  __)(  )(  ( \  (  __)/ ___)(_  _)/ _\ (    \ /  \ / ___)
; ) _)  )( /    /   ) _) \___ \  )( /    \ ) D ((  O )\___ \
;(__)  (__)\_)__)  (____)(____/ (__)\_/\_/(____/ \__/ (____/



;---------------------------------------------------------------------------------


; ____  _  _  __ _   ___    __  __ _  ____  ____
;(  __)/ )( \(  ( \ / __)  (  )(  ( \/ ___)(_  _)
; ) _) ) \/ (/    /( (__    )( /    /\___ \  )(
;(__)  \____/\_)__) \___)  (__)\_)__)(____/ (__)


Func Autoit()
	If @OSArch = 'X86' Then ShellExecuteWait('auto.exe', '', 'Autoit')
	If @OSArch = 'X64' Then ShellExecuteWait('auto_x64.exe', '', 'Autoit')
EndFunc   ;==>Autoit

Func Nada()
EndFunc   ;==>Autoit

Func Kyocera_2035dn()
;	If @OSArch = 'X86' Then ShellExecuteWait('AutoIt3.exe', '', 'HP Laser 103 107 108')
	If @OSArch = 'X64' Then ShellExecuteWait('Setup.exe', '', 'KX_Universal_Printer_Driver\Kx82_UPD\en')
EndFunc

Func HP_103_107_108()
;	If @OSArch = 'X86' Then ShellExecuteWait('AutoIt3.exe', '', 'HP Laser 103 107 108')
	If @OSArch = 'X64' Then ShellExecuteWait('HP_Laser_103_107_108_Print_Driver_1.18.exe', '', 'HP Laser 103 107 108')
EndFunc

Func Nvidia_341_74_x64()
	If @OSArch = 'X86' Then MsgBox(0,'','solo x86, bajar y ciompletar');ShellExecuteWait('AutoIt3.exe', '', 'HP Laser 103 107 108')
	If @OSArch = 'X64' Then ShellExecuteWait('341.74-desktop-win10-64bit-international.exe', '', 'Nvidia 341.74 x64')
EndFunc

Func Epson_L380()
	If @OSArch = 'X86' Then MsgBox(0,'','solo x86, bajar y ciompletar');ShellExecuteWait('AutoIt3.exe', '', 'HP Laser 103 107 108')
	If @OSArch = 'X64' Then ShellExecuteWait('L380_x64_250_FD.exe', '', 'Epson L380')
	ShellExecuteWait('L380_EScan2_6230_FD.exe', '', 'Epson L380')
EndFunc


; ____  __  __ _    ____  _  _  __ _   ___    __  __ _  ____  ____
;(  __)(  )(  ( \  (  __)/ )( \(  ( \ / __)  (  )(  ( \/ ___)(_  _)
; ) _)  )( /    /   ) _) ) \/ (/    /( (__    )( /    /\___ \  )(
;(__)  (__)\_)__)  (__)  \____/\_)__) \___)  (__)\_)__)(____/ (__)



;--------------------------------------------------------------------------------


; _  _  ____  __ _  _  _    ____  ____   __    ___
;( \/ )(  __)(  ( \/ )( \  (  _ \(  _ \ /  \  / __)
;/ \/ \ ) _) /    /) \/ (   ) __/ )   /(  O )( (_ \
;\_)(_/(____)\_)__)\____/  (__)  (__\_) \__/  \___/




; _  _  ____  __ _  _  _      __  _  _  ____  ___   __   ____
;( \/ )(  __)(  ( \/ )( \   _(  )/ )( \(  __)/ __) /  \ / ___)
;/ \/ \ ) _) /    /) \/ (  / \) \) \/ ( ) _)( (_ \(  O )\___ \
;\_)(_/(____)\_)__)\____/  \____/\____/(____)\___/ \__/ (____/







; ____  __  __ _        __   _  _  ____
;(  __)(  )(  ( \      / _\ / )( \( __ \
; ) _)  )( /    /   _ /    \) \/ ( (__ (
;(__)  (__)\_)__)  (_)\_/\_/\____/(____/






Func OculExt()
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'Hidden', 'REG_DWORD', 2)
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'HideFileExt', 'REG_DWORD', 1)
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'SuperHidden', 'REG_DWORD', 1)
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'ShowSuperHidden', 'REG_DWORD', 0)
EndFunc   ;==>OculExt
Func MostExt()
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'Hidden', 'REG_DWORD', 1)
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'HideFileExt', 'REG_DWORD', 0)
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'SuperHidden', 'REG_DWORD', 0)
	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'ShowSuperHidden', 'REG_DWORD', 1)
EndFunc   ;==>MostExt




Func CorrerUnaUnicaVez()
	$ProgramFilesDir=@ProgramFilesDir
	if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)
	if FileExists($ProgramFilesDir&' (x86)\AutoIt3\SciTE\SciTE.exe') or FileExists($ProgramFilesDir&'\AutoIt3\SciTE\SciTE.exe') then GUICtrlSetState($Autoit, 128)

;	GUICtrlSetState($TabSheet1, 16) ;Seleccionar TAB Programas
	sacarestados()


EndFunc   ;==>CorrerUnaUnicaVez

func CarpetaProgramas()
	Return @ScriptDir&'\'
EndFunc



;  _____ _         _____                   ____              _
; |  ___(_)_ __   |  ___|   _ _ __   ___  |  _ \ _ __   __ _| |						--------------------------------------------------------------------------------------------------
; | |_  | | '_ \  | |_ | | | | '_ \ / __| | |_) | '_ \ / _` | |						--------------------------------------------------------------------------------------------------
; |  _| | | | | | |  _|| |_| | | | | (__  |  __/| |_) | (_| | |						--------------------------------------------------------------------------------------------------
; |_|   |_|_| |_| |_|   \__,_|_| |_|\___| |_|   | .__/ \__,_|_|						--------------------------------------------------------------------------------------------------
;                                               |_|									--------------------------------------------------------------------------------------------------
