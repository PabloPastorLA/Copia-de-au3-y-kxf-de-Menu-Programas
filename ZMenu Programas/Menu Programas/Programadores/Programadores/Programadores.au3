#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=RT809H_151.ico
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=Programadores.kxf
$Form1_1 = GUICreate("Programadores y ME", 314, 172, -1, -1)
$Button1 = GUICtrlCreateButton("Minipro", 24, 8, 75, 25)
$Button2 = GUICtrlCreateButton("RT809H", 24, 40, 75, 25)
$Button3 = GUICtrlCreateButton("NANO Bios", 24, 72, 75, 25)
$Button4 = GUICtrlCreateButton("CH341a", 24, 104, 75, 25)
$Button5 = GUICtrlCreateButton("DIR", 24, 136, 75, 25)
$Button6 = GUICtrlCreateButton("Instalar HxD", 120, 136, 75, 25)
$Button7 = GUICtrlCreateButton("ME Injector", 120, 40, 75, 25)
$Button8 = GUICtrlCreateButton("ME Analyzer", 120, 8, 75, 25)
$Button9 = GUICtrlCreateButton("ME Repository", 120, 72, 75, 25)
$Button10 = GUICtrlCreateButton("DIR", 120, 104, 75, 25)
$Button11 = GUICtrlCreateButton("UEFI Tool", 216, 8, 75, 25)
$Button12 = GUICtrlCreateButton("Pagina Oficial", 216, 40, 75, 25)
$Button13 = GUICtrlCreateButton("Asus Cap2Bin", 216, 72, 75, 25)
$Button14 = GUICtrlCreateButton("Telegram", 216, 104, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			Minipro()
		Case $Button2
			RT809H()
		case $Button3
			nanobios()
		Case $Button4
			CH341a()
		Case $Button5
			ShellExecute(@ScriptDir)
		Case $Button6
			if 6=MsgBox(4,'HxD','Desea instalar Hxd?') then ShellExecute('HxD(deProgramadores).exe','','HxDSetupES')
		Case $Button7
			MEInjector()
		Case $Button8
			ShellExecute('MEA.exe','','ME')
		Case $Button9
			MERepository()
		Case $Button10
			ShellExecute(@ScriptDir&'\ME\')
		Case $Button11
			SplashTextOn('','Lanzando UEFITool',200,40,@DesktopWidth/2-100,@DesktopHeight/2-20,1)
			ShellExecute('UEFITool.exe','','UEFI')
			WinWait('UEFITool NE')
			SplashOff()
		Case $Button12
			UEFIToolPag()
		Case $Button14
			telegram()
	EndSwitch
WEnd

func telegram()
	if FileExists(@AppDataDir&"\Telegram Desktop\Telegram.exe") then
		SplashTextOn('','Lanzando Telegram',200,100,@DesktopWidth/2-100,@DesktopHeight/2-50,33)
		ShellExecute(@AppDataDir&"\Telegram Desktop\Telegram.exe")
		WinWait('Telegram (')
		SplashOff()
	Else
		MsgBox(0,'','No encontré Telegram')
	EndIf
EndFunc

func MEInjector()
	Opt('WinTitleMatchMode',3)
	ShellExecute('MEInject.exe','','ME')

	Do
		Sleep(100)
	until WinExists('','Please, specify ME files folder first') or WinExists('asdasdasda')

	if WinExists('','Please, specify ME files folder first') then
		WinWait('','Please, specify ME files folder first')
		Do
			WinClose('','Please, specify ME files folder first')
		until not WinExists('','Please, specify ME files folder first')
		MsgBox(0,'ME Injector','Buscar carpeta repositorio en C:\Programadores\ME\ME Repositorio')
	EndIf


;~ 	Do
;~ 		Sleep(100)
;~ 	until WinExists('','Please, specify ME files folder first')
;~ 	ControlClick('','Please, specify ME files folder first','Button1')
	Opt('WinTitleMatchMode',1)
EndFunc

func UEFIToolPag()
	$rta=''
	$rta=MsgBox(3,'UEFITool Pagina Oficial','Abrir pagina oficial en navegador?'&@CRLF&@crlf&'Si -> Abrir'&@CRLF&'No -> Al portapapeles'&@CRLF&'Cancelar -> Nada')
	if $rta=6 then ShellExecute('https://github.com/LongSoft/UEFITool')
	if $rta=7 then
		ClipPut('https://github.com/LongSoft/UEFITool')
		MsgBox(0,'UEFITool Pagina Oficial','Copiado al portapapeles.',1)
	EndIf
EndFunc



func MERepository()
	$rta=''
	$rta=MsgBox(3,'ME Repository','Abrir repositorio en navegador?'&@CRLF&@crlf&'Si -> Abrir'&@CRLF&'No -> Al portapapeles'&@CRLF&'Cancelar -> Nada')
	if $rta=6 then ShellExecute('https://mega.nz/folder/PJFXnCDK#lWSX5W0ODubZ2pf3gu3unw')
	if $rta=7 then
		ClipPut('https://mega.nz/folder/PJFXnCDK#lWSX5W0ODubZ2pf3gu3unw')
		MsgBox(0,'ME Repository','Copiado al portapapeles.',1)
	EndIf
EndFunc

func Minipro()
	;if FileExists(@ScriptDir&'\MiniPro\Minipro Launcher.exe') Then ShellExecute('Minipro Launcher.exe','','MiniPro')
	if FileExists(@ScriptDir&'\MiniPro\Minipro Comandos.exe') Then ShellExecute('Minipro Comandos.exe','','MiniPro')
	ShellExecute('Minipro.exe','','MiniPro')
EndFunc

func RT809H()
	if FileExists(@ScriptDir&'\RT809H\RT809H.exe') Then
		SplashTextOn('','Lanzando RT809H',200,100,@DesktopWidth/2-100,@DesktopHeight/2-50,33)
		ShellExecute('RT809H.exe','','RT809H')
		Sleep(4000)
		SplashOff()
	EndIf
;	if FileExists(@ScriptDir&'\RT809H-20210420\RT809H.exe') Then ShellExecute('RT809H.exe','','RT809H-20210420')
EndFunc

func nanobios()
	if FileExists(@ScriptDir&'\NANO BIOS Programmer V1.1\biosw.exe') Then ShellExecute('biosw.exe','','NANO BIOS Programmer V1.1')
EndFunc

func CH341a()
	if FileExists(@ScriptDir&'\CH341A Mini Programmer (Black Edition) RECOMENDADO\CH341A.exe') Then ShellExecute('CH341A.exe','','CH341A Mini Programmer (Black Edition) RECOMENDADO')
EndFunc
