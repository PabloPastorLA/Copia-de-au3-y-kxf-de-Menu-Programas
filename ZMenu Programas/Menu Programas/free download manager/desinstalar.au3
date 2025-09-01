
;--------------				DESINSTALAR FDM		-----------------------

If FileExists(@ProgramFilesDir & '\Free Download Manager\unins000.exe') Then

	ShellExecute(@ProgramFilesDir & '\Free Download Manager\unins000.exe', ' /S')

	WinWait('Free Download Manager Uninstall','Are you sure you')
	WinActivate('Free Download Manager Uninstall','Are you sure you')
	WinWaitActive('Free Download Manager Uninstall','Are you sure you')
	ControlClick('Free Download Manager Uninstall','&Sí','Button1')

	WinWait('Uninstall','Do you want to delete')
	WinActivate('Uninstall','Do you want to delete')
	WinWaitActive('Uninstall','Do you want to delete')
	ControlClick('Uninstall','&Sí','Button1')

	WinWait('Free Download Manager Uninstall','Free Download Manager uninstall complete.')
	WinActivate('Free Download Manager Uninstall','Free Download Manager uninstall complete.')
	WinWaitActive('Free Download Manager Uninstall','Free Download Manager uninstall complete.')
	ControlClick('Free Download Manager Uninstall','Aceptar','Button1')
	WinWaitClose('Free Download Manager Uninstall','Free Download Manager uninstall complete.')
	Sleep(1000)

	DirRemove(@ProgramFilesDir & "\Free Download Manager\", 1)
	DirRemove(@ProgramFilesDir & "\Free Download Manager\", 0)
;~ 	DirRemove(@ProgramsCommonDir & "\AutoIt v3\SciTE\", 1)
;~ 	DirRemove(@ProgramFilesDir & "\AutoIt3\", 1)
;~ 	DirRemove(@ProgramsCommonDir & "\AutoIt v3\", 1)

	FileWrite(@DesktopDir & "\Bien Instalado.txt", "Free download manager Desinstalado" & @CRLF)
Else
	FileWrite(@DesktopDir & "\Mal Instalado.txt", "Free download manager no Desinstalado" & @CRLF)
EndIf

;-----------------------------------------------------------------------------------








