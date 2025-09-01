#include <GUIConstantsEx.au3>


Opt('MustDeclareVars', 1)
Opt("GUIOnEventMode", 1)

Global $bFlag = 1, $MenuItem1, $MenuItem2, $MenuItemExit, $bFlag = 1, $exit = 0
Local $hGui, $ContextMenu, $separator1, $msg
$hGui = GUICreate("With Context Menu")

$ContextMenu = GUICtrlCreateContextMenu()

$MenuItem1 = GUICtrlCreateMenuItem("Menu Item1", $ContextMenu, 1)
GUICtrlSetState($MenuItem1, $GUI_CHECKED)
GUICtrlSetOnEvent($MenuItem1, "FuncMenuItem1")

$separator1 = GUICtrlCreateMenuItem("", $ContextMenu) ; create a separator line
$MenuItem2 = GUICtrlCreateMenuItem("Menu Item2", $ContextMenu)
GUICtrlSetOnEvent($MenuItem2, "FuncMenuItem2")

$separator1 = GUICtrlCreateMenuItem("", $ContextMenu) ; create a separator line

$MenuItemExit = GUICtrlCreateMenuItem("Exit", $ContextMenu)
GUICtrlSetOnEvent($MenuItemExit, "quitclk")

GUISetState()

While 1
    If $exit = 1 Then Exit
    Sleep(20)
WEnd

Func FuncMenuItem1()
    If $bFlag = 1 Then
        GUICtrlSetState($MenuItem1, $GUI_UNCHECKED)
        $bFlag = 0
    Else
        GUICtrlSetState($MenuItem1, $GUI_CHECKED)
        $bFlag = 1
    EndIf
    Return
EndFunc   ;==>FuncMenuItem1

Func FuncMenuItem2()
    MsgBox(0, "", "Item 1 Selected")
    Return
EndFunc   ;==>FuncMenuItem2

; Called from context menu Exit script.
Func quitclk()
    $exit = 1
EndFunc   ;==>quitclk