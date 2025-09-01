#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;~ MsgBox(0,'',ClipGet())
;~ Exit

#include <Misc.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=DoubleDriverLauncher.kxf
$Form1_1 = GUICreate("DPLauncher", 172, 107, 192, 124)
$Button1 = GUICtrlCreateButton("DoubleDriver", 8, 8, 75, 25)
$Button2 = GUICtrlCreateButton("Reiniciarlo", 88, 8, 75, 25)
$Button3 = GUICtrlCreateButton("Dpinst al Portapapeles", 8, 40, 155, 25)
$Button4 = GUICtrlCreateButton("Abrir carpeta de drivers", 8, 72, 155, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

;~ if ControlCommand($Form1_1,'',$Button4,"IsEnabled", "") then MsgBox(0,'','esta en')
;~ GUICtrlsetState($Button4,$GUI_DISABLE)
;~ if not ControlCommand($Form1_1,'',$Button4,"Isenabled", "") then MsgBox(0,'','esta dis')

$dir=''
inicio()


;~ Global $pid=0
;~ Global $existe=0
;~ Global $dir=''
;~ Global $ventanaexiste=0
;~ Global $actualizdir=0
;~ GUICtrlsetState($Button4,$GUI_DISABLE)


While 1
	loop()
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		case $Button1
			inicio()
			$pid=ShellExecute('dd.exe')
		case $Button2
			if 6=MsgBox(4,'','Desea reiniciar Double Driver?') Then
				Do
					ProcessClose('dd.exe')
					ProcessClose('ddc.exe')
				until not ProcessExists('dd.exe') and not ProcessExists('ddc.exe')
				$pid=ShellExecute('dd.exe')
			EndIf
		case $Button3
			ponerdpinstenportapapelesycopiar()
		case $Button4
			ShellExecute($dir)
	EndSwitch
WEnd

func inicio()
	Global $pid=0
	Global $existe=0
	Global $dir=''
	Global $ventanaexiste=0
	Global $actualizdir=0
	GUICtrlsetState($Button4,$GUI_DISABLE)
EndFunc

func loop()

	;if ControlCommand($Form1_1,'',$Button4,"IsEnabled", "") and $dir='' then GUICtrlSetState($Button4,$GUI_DISABLE)
	if $pid<>0 then $existe=1

	If not ProcessExists($pid) and $existe=1 then
		$pid=0
		if 6=MsgBox(4,'Double Driver','Se cerró Double Driver.'&@CRLF&'Mandar dpinst al directorio de drivers y al portapapeles?') then ponerdpinstenportapapelesycopiar()

	EndIf

	if $pid=0 then $existe=0

if WinExists('Buscar carpeta','Select the destination folder where you want to save the backup.') then
	$ventanaexiste=1
	;MsgBox(0,'','existe')
EndIf

if $ventanaexiste=1 and not WinExists('Buscar carpeta','Select the destination folder where you want to save the backup.') Then
	$ventanaexiste=0
	;MsgBox(0,'','NO existe')
	$actualizdir=1
EndIf




	if $actualizdir=0 and $dir<>'' and $dir<>@UserProfileDir&'\Documents\Double Driver Backup\' then
		if not ControlCommand($Form1_1,'',$Button4,"Isenabled", "") then GUICtrlSetState($Button4,$GUI_ENABLE)
	Else
		$dir= ControlGetText('Double Driver','Structured folder (default)','TEdit1')
		$actualizdir=0
	EndIf

EndFunc


func ponerdpinstenportapapelesycopiar()
	FileCopy(@ScriptDir&'\dpinst.exe',$dir)
	FileCopy(@ScriptDir&'\dpinst.xml',$dir)
	FileCopy(@ScriptDir&'\dpinst64.exe',$dir)
	FileCopy(@ScriptDir&'\DPInst Auto X86 X64.au3',$dir)




	$clip=@ScriptDir&'\dpinst.exe' & '|'
	$clip=$clip  &   @ScriptDir&'\dpinst.xml'    &  '|'
	$clip=$clip  &   @ScriptDir&'\dpinst64.exe'    &  '|'
	$clip=$clip  &   @ScriptDir&'\DPInst Auto X86 X64.au3'    &  '|'
	_ClipPutFile(FileGetLongName($clip,1))
	MsgBox(0,'Dpinst','Dpinst copiado al portapapeles',1)
EndFunc
