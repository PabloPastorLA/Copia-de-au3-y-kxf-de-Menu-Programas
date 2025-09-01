#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=icon.ico
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
if not ProcessExists('Minipro.exe') then ShellExecute('Minipro.exe')


if @DesktopWidth<1030 or @DesktopHeight<732 Then

	WinWait('MiniPro v6.85')
	WinActivate('MiniPro v6.85')
	WinSetState('MiniPro v6.85','',@SW_MAXIMIZE)
EndIf

