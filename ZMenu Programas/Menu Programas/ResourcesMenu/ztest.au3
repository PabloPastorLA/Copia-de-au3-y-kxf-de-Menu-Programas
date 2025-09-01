#include <WindowsConstants.au3>
#include <WinAPI.au3>
#Include <GDIPlus.au3>

_GDIPlus_Startup()

Run("notepad.exe")
$hWnd = WinWait("Untitled")

$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hWnd)
$Color = 0xFFFF0000
$hPen = _GDIPlus_PenCreate($Color, 2)


For $i = 1 To 10
    _GDIPlus_GraphicsDrawRect($hGraphic, 200, 200, 25 ,25, $hPen)
    ToolTip($i)
    Sleep(1000)
Next

_WinAPI_RedrawWindow($hWnd, 0, 0, $RDW_INVALIDATE + $RDW_ALLCHILDREN)
_GDIPlus_GraphicsDispose($hGraphic)
_GDIPlus_PenDispose($hPen)
_GDIPlus_Shutdown()