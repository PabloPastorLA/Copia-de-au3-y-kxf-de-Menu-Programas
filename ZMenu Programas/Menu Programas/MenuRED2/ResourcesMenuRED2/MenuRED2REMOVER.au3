#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
ProcessWaitClose('MenuRED2.exe')
#RequireAdmin
;~ while ProcessExists('MenuRED2.exe') or ProcessExists('MenuRED2VENTANAS.exe')
;~ 	ProcessClose('MenuRED2.exe')
;~ 	ProcessClose('MenuRED2VENTANAS.exe')
;~ WEnd


while RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System','EnableLinkedConnections') = 1
	RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System','EnableLinkedConnections')
WEnd

ShellExecuteWait('cmd.exe',' /C schtasks /end /TN "MenuRED2 continuar"','','',@SW_HIDE)
ShellExecuteWait('cmd.exe',' /C schtasks /delete /TN "MenuRED2 continuar" /F','','',@SW_HIDE)
;MsgBox(0,'','1')
while FileExists(@DesktopCommonDir&'\MenuRED2.lnk') or FileExists(@DesktopDir&'\MenuRED2.lnk')
	FileDelete(@DesktopCommonDir&'\MenuRED2.lnk')
	FileDelete(@DesktopDir&'\MenuRED2.lnk')
WEnd


Send("#r")
WinWait('Ejecutar')
ControlSetText('Ejecutar','','Edit1','cmd /c timeout 3 & RMDIR '&@HomeDrive&'\MenuRED2 /S /Q')
ControlClick('Ejecutar','','Button2')


;MsgBox(0,'','1')
;ShellExecute('cmd',' /C timeout 5 && RMDIR '&@HomeDrive&'\MenuRED2 /S /Q',@HomeDrive,'',@SW_HIDE)
;ShellExecuteWait('cmd',' /c RMDIR '&@HomeDrive&'\MenuRED2 /S /Q',@HomeDrive,'',@SW_HIDE)
;MsgBox(0,'','2')
		;ShellExecute(@ComSpec, ' /c RMDIR '&@HomeDrive&'\MenuRED2 /S /Q',@HomeDrive,'',@SW_HIDE)
		;MsgBox(0,'','3')
;ShellExecute(@ComSpec, ' /c timeout 5 && del "' & @HomeDrive&'\MenuRED2' & '"','','',@SW_HIDE)
		;ShellExecute(@ComSpec, ' del "' & @HomeDrive&'\MenuRED2' & '"','','',@SW_HIDE)
;MsgBox(0,'','4')
;if @ScriptDir=@HomeDrive&'\MenuRED2' then
;	ShellExecute(@ComSpec, ' /c timeout 3 & del "' & @ScriptDir & '"','','',@SW_HIDE)
;MsgBox(0,'','2')
;EndIf



;$vent=ShellExecute('cmd',' /C  cls & echo off & echo En 3 seg MenuRED2 Borrado!','','',@SW_HIDE)
;WinWait('Administrador: C:\Windows\System32\cmd.exe')
;WinMove('Administrador: C:\Windows\System32\cmd.exe','',@DesktopWidth/2-100,@DesktopHeight/2-50,240,90)
;WinSetState('Administrador: C:\Windows\System32\cmd.exe','',@SW_SHOW)

Exit

