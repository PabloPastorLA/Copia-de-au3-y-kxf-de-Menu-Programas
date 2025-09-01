#RequireAdmin

if 7=MsgBox(4,'Cuidado!','Ya hiciste Backup de este disco???') then
	MsgBox(0,'Cuidado!','Hacelo primero. Cerrando...')
	Exit
EndIf



$dir=@ScriptDir
Do
	$dir=StringTrimRight($dir,1)
Until StringRight($dir,1)='\'
;~ MsgBox(0,'',$dir)

FileChangeDir($dir)

VHD()
ShellExecute(@ScriptDir&'\VHDMueveMSGBOX.exe')
MsgBox(0,'VHD Launch','Attach VHD')

Minitool()
;EaseUS()
if MsgBox(4,'Estado del disco (sectores defectuosos)','Es un disco RBD??')=6 then
	ShellExecute(@ScriptDir&'\VHDMueveMSGBOX.exe')
	MsgBox(0,'VHD Launch','Actualizar EPM'&@CRLF&'En disco USB seleccionar espacios y crear particiones SIN formato'&@CRLF&'Procesar y continuar cuando termine')
	ShellExecute(@ScriptDir&'\VHDMueveMSGBOX.exe')
	MsgBox(0,'VHD Launch','Si todo OK entonces borrar particiones sanas'&@CRLF&'Clonar de a una las particiones al espacio sin particionar'&@CRLF&'Eliminar particiones con sectores defectuosos'&@CRLF&'Eliminar las etiquetas de las particiones clonadas'&@CRLF&'Marcar como Activa la particion de Recuperacion')
Else
	ShellExecute(@ScriptDir&'\VHDMueveMSGBOX.exe')
	MsgBox(0,'VHD Launch','Actualizar EPM'&@CRLF&'Selec disco USB'&@CRLF&'Borrar todo'&@CRLF&'Clonar particion A DISCO USB. OJO!'&@CRLF&''&@CRLF&'')
EndIf






Func EaseUS()

	if WinExists('MiniTool Partition Wizard Enterprise 12.0') then
		WinActivate('MiniTool Partition Wizard Enterprise 12.0')
	ElseIf not WinExists('MiniTool Partition Wizard Enterprise 12.0') and not ProcessExists('epm0.exe') and not ProcessExists('main.exe') then
		ShellExecute('"EaseUSPartitionMasterPortable.exe"','','EASEUSPartitionMasterPortable')
		WinWait('EaseUS Partition Master','EaseUS Partition Master Portable did not close properly',4)
		if WinExists('EaseUS Partition Master','EaseUS Partition Master Portable did not close properly') then
			WinClose('EaseUS Partition Master','EaseUS Partition Master Portable did not close properly')
			EaseUS()
			Return
		EndIf
	ElseIf not WinExists('MiniTool Partition Wizard Enterprise 12.0') and (ProcessExists('epm0.exe') or ProcessExists('main.exe')) then
		MsgBox(0,'Paquete','Easeus corriendo de fondo. Espere',2)
		EaseUS()
		Return
	EndIf
;~ 	WinWaitActive('MiniTool Partition Wizard Enterprise 12.0','Main.exe')
	WinWaitActive('MiniTool Partition Wizard Enterprise 12.0','')
EndFunc




Func Minitool()

	if WinExists('MiniTool Partition Wizard Enterprise 12.0') then
		WinActivate('MiniTool Partition Wizard Enterprise 12.0')
	ElseIf not WinExists('MiniTool Partition Wizard Enterprise 12.0') and not ProcessExists('MiniToolPartitionWizardPortable.exe') and not ProcessExists('PartitionWizard.exe') then
		ShellExecute('"MiniToolPartitionWizardPortable.exe"','','MiniTool Partition Wizard 12 Portable')
;~ 		WinWait('EaseUS Partition Master','EaseUS Partition Master Portable did not close properly',4)
;~ 		if WinExists('EaseUS Partition Master','EaseUS Partition Master Portable did not close properly') then
;~ 			WinClose('EaseUS Partition Master','EaseUS Partition Master Portable did not close properly')
;~ 			EaseUS()
;~ 			Return
;~ 		EndIf
	ElseIf not WinExists('MiniTool Partition Wizard Enterprise 12.0') and (ProcessExists('MiniToolPartitionWizardPortable.exe') or ProcessExists('PartitionWizard.exe')) then
		MsgBox(0,'Paquete','MiniTool Partition Wizard corriendo de fondo. Espere 5s',5)
		Minitool()
		Return
	EndIf
;~ 	WinWaitActive('MiniTool Partition Wizard Enterprise 12.0','PartitionWizard.exe')
	WinWaitActive('MiniTool Partition Wizard Enterprise 12.0','')
EndFunc





Func VHD()
;~ 	ShellExecute('LAUNCHER.exe','','vhd2disk')

	;desde aca bootice. es el que vá
	if @OSArch= 'x86' then ShellExecute('BOOTICEx86.exe','','BOOTICE')
	if @OSArch<>'x86' then ShellExecute('BOOTICEx64.exe','','BOOTICE')

	;~ ShellExecute('BOOTICEx86.exe','','Resources')

	$ventana='BOOTICE v1.3.3 x64 - by Pauly'
	if @OSArch='x86' then $ventana='BOOTICE v1.3.3 - by Pauly'
	;~ $ventana='BOOTICE v1.3.2 - by Pauly'

	WinWait($ventana)
	Do
		ControlClick($ventana,'','Button19')
	Until WinExists('Attach/Detach VHD/VHDX')

	WinWait('Attach/Detach VHD/VHDX')
	Do
		ControlCommand('Attach/Detach VHD/VHDX','','Button3','Check','')
	until ControlCommand('Attach/Detach VHD/VHDX','','Button3','isChecked','')=1

EndFunc
