#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. USB Safely',160,80,0,110)


$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)

If FileExists("USB Safely Remove 6.2.1.1284.exe") and not FileExists ($ProgramFilesDir & "\USB Safely Remove\USBSafelyRemove.exe") AND not FileExists ($ProgramFilesDir & " (x86)\USB Safely Remove\USBSafelyRemove.exe") Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	USB Safe"&@CRLF)
;~ MsgBox(0,'','')
	ShellExecute("USB Safely Remove 6.2.1.1284.exe")

$win='Installation USB Safely Remove 6.2.1.1284'
	WinWait($win)

	Do
		if WinExists($win,'Welcome to the USB') then ControlClick($win,'','Button2')
		if WinExists($win,'The default interface language:') then
			if ControlCommand($win,'','Button6','IsChecked','')=0 then ControlCommand($win,'','Button6','Check','')
			if ControlCommand($win,'','Button9','IsChecked','')=1 then ControlCommand($win,'','Button9','UnCheck','')
			if ControlCommand($win,'','Button10','IsChecked','')=1 then ControlCommand($win,'','Button10','UnCheck','')

			if ControlCommand($win,'','Button6','IsChecked','')=1 and ControlCommand($win,'','Button9','IsChecked','')=0 and ControlCommand($win,'','Button10','IsChecked','')=0 then ControlClick($win,'','Button2')
		EndIf
		if WinExists($win,'Choose Install Location') then ControlClick($win,'','Button2')
		if WinExists($win,'Completing the USB Safely') then
			if ControlCommand($win,'','Button4','IsChecked','')=1 then ControlCommand($win,'','Button4','UnCheck','')
			if ControlCommand($win,'','Button5','IsChecked','')=1 then ControlCommand($win,'','Button5','UnCheck','')

			if ControlCommand($win,'','Button4','IsChecked','')=0 and ControlCommand($win,'','Button5','IsChecked','')=0 then ControlClick($win,'','Button2')
		EndIf

	Sleep(500)
	Until not WinExists($win)

	RegDelete('HKEY_CURRENT_USER\Software\SafelyRemove\Options','LangFileName')
	RegWrite('HKEY_CURRENT_USER\Software\SafelyRemove\Options','LangFileName','REG_SZ','Spanish')
	RegDelete('HKEY_CURRENT_USER\Software\SafelyRemove\Options','CheckforUpdates')
	RegWrite('HKEY_CURRENT_USER\Software\SafelyRemove\Options','CheckforUpdates','REG_SZ','0')
	RegDelete('HKEY_CURRENT_USER\Software\SafelyRemove\Options','IconSize')
	RegWrite('HKEY_CURRENT_USER\Software\SafelyRemove\Options','IconSize','REG_SZ','2')
	RegDelete('HKEY_CURRENT_USER\Software\SafelyRemove\Advises','YouCanHideIcon')
	RegWrite('HKEY_CURRENT_USER\Software\SafelyRemove\Advises','YouCanHideIcon','REG_SZ','1')


	If FileExists ($ProgramFilesDir & "\USB Safely Remove\USBSafelyRemove.exe") then
		ShellExecute($ProgramFilesDir & "\USB Safely Remove\USBSafelyRemove.exe")
	ElseIf FileExists ($ProgramFilesDir & " (x86)\USB Safely Remove\USBSafelyRemove.exe") Then
		ShellExecute($ProgramFilesDir & " (x86)\USB Safely Remove\USBSafelyRemove.exe")
	Else
		MsgBox(0,'','No encontre ejecutable Usb Safely Remove')
	EndIf





	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	USB Safe"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","USB Safe"&@CRLF)
EndIf

