#include <MsgBoxConstants.au3>


SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Program 1\3',160,80,0,110)

;Copiar carpeta programadores
	DirCopy('Programadores',@HomeDrive&'\Programadores',1)

	FileCreateShortcut(@HomeDrive&'\Programadores\Programadores.exe',@DesktopDir&'\Programadores.lnk',@HomeDrive&'\Programadores\')

	DirCreate(@HomeDrive&'\Programadores\ME')
	ShellExecuteWait('cmd','/C rar.exe x -y "'&@ScriptDir&'\Repositorio ME.rar" "'&@HomeDrive&'\Programadores\ME"')

	InstDriversTl866()






;Encontrar nombre del instalador para rt809h
	Local $hSearch = FileFindFirstFile("*.*")
	If $hSearch = -1 Then MsgBox($MB_SYSTEMMODAL, "", "Error: No files/directories matched the search pattern.")
	Local $sFileName = "", $iResult = 0
	$existe=0
    While 1;$existe=0
        $sFileName = FileFindNextFile($hSearch)
		if StringLeft($sFileName,6)='RT809H' and StringRight($sFileName,8)='_ENG.exe' Then
			$existe=1
			;MsgBox(0,'',"File: " & $sFileName)
			ExitLoop
		EndIf
		if $sFileName='' Then
			MsgBox(0,'','No encontré instalador del rt. Cerrando')
			Exit
		EndIf
    WEnd
	FileClose($hSearch)
;	$file=$sFileName
;	ShellExecuteWait('cmd','/k RAR.exe x -p123 -y "'&$file&'" '&@HomeDrive&'\Programadores\',@ScriptDir,'');,@SW_HIDE)


;instalar por ventanas, para poder definir ruta
	$process=ShellExecute('cmd','/c '&$sFileName)
	$vent='RT809H'
	Do
	until WinExists($vent,'Welcome to the RT809H Setup Wizard') or WinExists($vent,'Please select a language.')
	Do
;		if WinExists('RT809H','Please select a language.') then ControlClick('RT809H','','obj_BUTTON1')

		if WinExists($vent,'Please select a language.') then clickear($vent,'OK')

		if WinExists($vent,'Welcome to the RT809H Setup Wizard') then ControlClick($vent,'','obj_BUTTON1')
		if ControlGetText($vent,'','obj_EDIT2')<>@HomeDrive&'\Programadores\RT809H' then ControlSetText($vent,'','obj_EDIT2',@HomeDrive&'\Programadores\RT809H')
		if ControlGetText($vent,'','obj_EDIT2')=@HomeDrive&'\Programadores\RT809H' then clickear($vent,'Next >')
		if WinExists($vent,'Select shortcuts') then clickear($vent,'Next >')
		if WinExists($vent,'Ready to Install') then clickear($vent,'Install')
		;if WinExists($vent,'Launch RT809H') and estachequeado($vent,'Launch RT809H')=0 then clickear($vent,'Launch RT809H')
		if WinExists($vent,'Launch RT809H') then
			clickear($vent,'Finish')
			$i=0
			Do
				$i=$i+1
				Sleep(200)
			until not ProcessExists($process) or $i>=25
		EndIf
		Sleep(100)
	until not ProcessExists($process);1;(not WinExists($vent) and not WinExists('Configuración de QuickTime 7')) or $exit>=20






;segunda parte

	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Program 2\3',160,80,0,110)
	ProcessWait('RT809H.exe',30)
	if not ProcessExists('RT809H.exe') then ShellExecute(@HomeDrive&'\Programadores\RT809H\RT809H.exe')
	do
		if WinExists('RT809H','The USB Driver will install. ') then clickear('RT809H','Aceptar')
		if WinExists('RT809H/RT809HSE Programmer software version') then WinClose('RT809H/RT809HSE Programmer software version')
		Sleep(100)
	until not ProcessExists('RT809H.exe')

	$existe=0
	Do
		if FileExists(@DesktopDir&'\RT809H_RT809HSEÐÂÊÖÒýµ¼.lnk') and FileExists(@DesktopDir&'\RT809H_RT809HSEËµÃ÷Êé.lnk') then $existe=1
		if FileExists(@DesktopDir&'\RT809H_RT809HSE instruction manual.lnk') and FileExists(@DesktopDir&'\RT809H.lnk') then $existe=1
	until $existe=1

	FileDelete(@DesktopDir&'\RT809H_RT809HSE instruction manual.lnk')
	FileDelete(@DesktopDir&'\RT809H.lnk')
	FileDelete(@DesktopDir&'\RT809H_RT809HSEÐÂÊÖÒýµ¼.lnk')
	FileDelete(@DesktopDir&'\RT809H_RT809HSEËµÃ÷Êé.lnk')



SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Program 3\3',160,80,0,110)

	;instalar TOOLCHAIN
	$process=ShellExecute('ToolChain_RT809H_ENG.exe')
	$vent='WinRAR 自解压文件'
	WinWait($vent,'')
	Do
		if ControlGetText($vent,'目标文件夹(&D)','Edit1')<>@HomeDrive&'\Programadores\RT809H' then ControlSetText($vent,'目标文件夹(&D)','Edit1',@HomeDrive&'\Programadores\RT809H')
		if ControlGetText($vent,'目标文件夹(&D)','Edit1')=@HomeDrive&'\Programadores\RT809H' then clickear($vent,'解压')
 		if WinExists('确认文件替换','全部选是(&A)') then clickear('确认文件替换','全部选是(&A)')
		Sleep(1000)
	until not ProcessExists($process)










;~
;~ 	Do
;~ 		if WinExists($vent,'&Siguiente >') then clickear($vent,'&Siguiente >')
;~ 		if WinExists($vent,'&Sí') then clickear($vent,'&Sí')
;~ 		if WinExists($vent,'&Instalar') and estachequeado($vent,'Instalar accesos directos en el escritorio')=1 then clickear($vent,'Instalar accesos directos en el escritorio')
;~ 		if WinExists($vent,'&Instalar') and estachequeado($vent,'Instalar accesos directos en el escritorio')=0 then clickear($vent,'&Instalar')
;~ 		if WinExists($vent,'&Finalizar') then clickear($vent,'&Finalizar')
;~ 		Sleep(100)
;~ 	until (not WinExists($vent) and not WinExists('Configuración de QuickTime 7')) or $exit>=20
;~












func estachequeado($vent,$textoboton)
	For $i=1 to 99 step 1
		if ControlGetText($vent,$textoboton,'Button'&$i)=$textoboton and ControlCommand($vent,$textoboton,'Button'&$i,'ischecked','')=1 then Return 1
		if ControlGetText($vent,$textoboton,'TsCheckBox'&$i)=$textoboton and ControlCommand($vent,$textoboton,'TsCheckBox'&$i,'ischecked','')=1 then Return 1
		if ControlGetText($vent,$textoboton,'TCheckBox'&$i)=$textoboton and ControlCommand($vent,$textoboton,'TCheckBox'&$i,'ischecked','')=1 then Return 1
		if ControlGetText($vent,$textoboton,'obj_BUTTON'&$i)=$textoboton and ControlCommand($vent,$textoboton,'obj_BUTTON'&$i,'ischecked','')=1 then Return 1

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
		if ControlGetText($vent,$textoboton,'obj_BUTTON'&$i)=$textoboton then
;			MsgBox(0,'','voy a clickear')
			ControlClick($vent,$textoboton,'obj_BUTTON'&$i)
			Return
		EndIf
		if ControlGetText($vent,$textoboton,'TButton'&$i)=$textoboton then
;			MsgBox(0,'','voy a clickear')
			ControlClick($vent,$textoboton,'TButton'&$i)
			Return
		EndIf
	Next
EndFunc
;EOF





func InstDriversTl866()
	;MsgBox(0,'','Voy a instalar drivers tl866. falta ventana de aceptar driver')
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Program 1.2\3',160,80,0,110)

	ShellExecute('UsbDrvInstall.exe','',@HomeDrive&'\Programadores\MiniPro\')
	WinWait('USB driver install...','Install')
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Program 1.5\3',160,80,0,110)

	Do
		ControlClick('USB driver install...','Install','Button1')
		$exit=0
		SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Program 1.6\3',160,80,0,110)

		Do
			SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Program 1.7\3',160,80,0,110)

			Sleep(200)
			$exit=$exit+1
		until not WinExists('USB driver install...','Install') or ProcessExists('dpinst.exe') or ProcessExists('dpinst64.exe') or $exit>=10
	until not WinExists('USB driver install...','Install') or ProcessExists('dpinst.exe') or ProcessExists('dpinst64.exe')


	$vent='Device Driver Installation Wizard'
	WinWait($vent)
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Program 1.8\3',160,80,0,110)

	Do
		SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Program 1.9\3',160,80,0,110)

		clickear($vent,'Siguien&te >')
		clickear($vent,'Finalizar')

		Sleep(200)
	until not WinExists('Device Driver Installation Wizard')

	;MsgBox(0,'','termine esta parte')
	$exit=0
	do
		Sleep(100)
		$exit=$exit+1
		if WinExists('Seguridad de Windows','&Instalar') Then
			Do
				if ControlGetText('Seguridad de Windows','&Instalar','Button1')='&Instalar' then ControlClick('Seguridad de Windows','&Instalar','Button1')
				if ControlGetText('Seguridad de Windows','&Instalar','Button2')='&Instalar' then ControlClick('Seguridad de Windows','&Instalar','Button2')
				$exit=100
			until not WinExists('Seguridad de Windows','&Instalar')
		EndIf
	Until $exit>=100
EndFunc
