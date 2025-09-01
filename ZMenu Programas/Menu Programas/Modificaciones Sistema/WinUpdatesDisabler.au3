if @OSArch='X86' then ShellExecute('WinUpdatesDisabler_x86.exe','','win-updates-disabler-portable')
if @OSArch<>'X86' then ShellExecute('WinUpdatesDisabler_x64.exe','','win-updates-disabler-portable')

;~ if WinExists('Win Updates Disabler') then MsgBox(0,'','654654')

WinWait('Win Updates Disabler v1.4')
do
	if not WinExists('Win Updates Disabler','Los cambios han sido aplicados con éxito.') then

;~ 		if ControlCommand('Win Updates Disabler v1.4','','TCheckBox4','IsChecked','')=0 then ControlCommand('Win Updates Disabler v1.4','','TCheckBox4','Check','')
;~ 		if ControlCommand('Win Updates Disabler v1.4','','TCheckBox3','IsChecked','')=1 then ControlCommand('Win Updates Disabler v1.4','','TCheckBox3','UnCheck','')
;~ 		if ControlCommand('Win Updates Disabler v1.4','','TCheckBox2','IsChecked','')=1 then ControlCommand('Win Updates Disabler v1.4','','TCheckBox2','UnCheck','')
;~ 		if ControlCommand('Win Updates Disabler v1.4','','TCheckBox1','IsChecked','')=1 then ControlCommand('Win Updates Disabler v1.4','','TCheckBox1','UnCheck','')

;~ 		if ControlCommand('Win Updates Disabler v1.4','','TCheckBox4','IsChecked','')=1 and ControlCommand('Win Updates Disabler v1.4','','TCheckBox3','IsChecked','')=0 and ControlCommand('Win Updates Disabler v1.4','','TCheckBox2','IsChecked','')=0 and ControlCommand('Win Updates Disabler v1.4','','TCheckBox1','IsChecked','')=0 then ControlClick('Win Updates Disabler v1.4','','TButton2')



		if estachequeado('Win Updates Disabler v1.4','Desactivar actualizaciones de Windows')=0 then clickear('Win Updates Disabler v1.4','Desactivar actualizaciones de Windows')
		if estachequeado('Win Updates Disabler v1.4','Desactivar el Centro de Seguridad de Windows')=1 then clickear('Win Updates Disabler v1.4','Desactivar el Centro de Seguridad de Windows')
		if estachequeado('Win Updates Disabler v1.4','Desactivar Windows Defender')=1 then clickear('Win Updates Disabler v1.4','Desactivar Windows Defender')
		if estachequeado('Win Updates Disabler v1.4','Desactivar el Firewall de Windows')=1 then clickear('Win Updates Disabler v1.4','Desactivar el Firewall de Windows')

		if estachequeado('Win Updates Disabler v1.4','Desactivar actualizaciones de Windows')=1 and estachequeado('Win Updates Disabler v1.4','Desactivar el Centro de Seguridad de Windows')=0 and estachequeado('Win Updates Disabler v1.4','Desactivar Windows Defender')=0 and estachequeado('Win Updates Disabler v1.4','Desactivar el Firewall de Windows')=0 Then clickear('Win Updates Disabler v1.4','Aplicar ahora')
	Else
		Do
			Do
				clickear('Win Updates Disabler','&No')
			until not WinExists('Win Updates Disabler','&No')
			WinClose('Win Updates Disabler v1.4')
		until not WinExists('Win Updates Disabler v1.4')
	EndIf

;~ MsgBox(0,'','1')

;~ 	while ControlCommand('Win Updates Disabler','','Button2','IsVisible')=1
;~ 		if ControlCommand('Win Updates Disabler','','Button2','IsVisible')=1 and ControlGetText('Win Updates Disabler','','Button2')='&No' then ControlClick('Win Updates Disabler','','Button2')
;~ 		if ControlCommand('Win Updates Disabler','','Button1','IsVisible')=1 and ControlGetText('Win Updates Disabler','','Button1')='&No' then ControlClick('Win Updates Disabler','','Button1')
;~ 		if ControlCommand('Win Updates Disabler','','Button2','IsVisible')=0 then WinClose('Win Updates Disabler v1.4')
;		MsgBox(0,'',ControlCommand('Win Updates Disabler','','Button2','IsVisible'))
;~ 	WEnd

;~ MsgBox(0,'','2')

	Sleep(1000)
Until not WinExists('Win Updates Disabler v1.4')







func estachequeado($vent,$textoboton)
	For $i=1 to 99 step 1
		if ControlGetText($vent,$textoboton,'Button'&$i)=$textoboton and ControlCommand($vent,$textoboton,'Button'&$i,'ischecked','')=1 then Return 1
		if ControlGetText($vent,$textoboton,'TsCheckBox'&$i)=$textoboton and ControlCommand($vent,$textoboton,'TsCheckBox'&$i,'ischecked','')=1 then Return 1
		if ControlGetText($vent,$textoboton,'TCheckBox'&$i)=$textoboton and ControlCommand($vent,$textoboton,'TCheckBox'&$i,'ischecked','')=1 then Return 1
	Next
	Return 0
EndFunc


func clickear($vent,$textoboton)
	For $i=1 to 99 step 1
		if ControlGetText($vent,$textoboton,'Button'&$i)=$textoboton then
;			MsgBox(0,'','voy a clickear')
			ControlClick($vent,$textoboton,'Button'&$i)
			Return
		EndIf
		if ControlGetText($vent,$textoboton,'TsButton'&$i)=$textoboton then
;			MsgBox(0,'','voy a clickear')
			ControlClick($vent,$textoboton,'TsButton'&$i)
			Return
		EndIf
		if ControlGetText($vent,$textoboton,'TButton'&$i)=$textoboton then
;			MsgBox(0,'','voy a clickear')
			ControlClick($vent,$textoboton,'TButton'&$i)
			Return
		EndIf
	Next
EndFunc