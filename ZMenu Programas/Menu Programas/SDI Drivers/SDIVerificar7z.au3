#include <File.au3>

;NO CONVIENE SACAR LOS DRIVERPACKS VIEJOS, NO DESDE ACA, SOLO DE FORMA MANUAL CUANDO SOBREN
;~ ShellExecuteWait('del_old_driverpacks.bat')

;~ Exit
;borrar txts que no apuntan a nada
$arrdir=_FileListToArray ('drivers','*.txt',1)
for $i=1 to UBound($arrdir)-1 step 1
	if not FileExists ('drivers\'&StringTrimRight($arrdir[$i],3) & '7z') then FileDelete('drivers\'&$arrdir[$i])
Next

global $borrar=0
if 6 = MsgBox(4,'SDIVerificar7z','Hacer automagicamente todo?' & @CRLF & 'Borrar paquetes y txt´s') then $borrar=1

$dontsleep=0
if ProcessExists('DontSleep.exe') or ProcessExists('DontSleep_x64.exe') then
	$dontsleep=1
else
	if @OSArch='x86' then ShellExecute('DontSleep.exe','','Dont Sleep')
	if @OSArch<>'x86' then ShellExecute('DontSleep_x64.exe','','Dont Sleep')
EndIf

;hacer el resto
$arrdir=_FileListToArray ('drivers','*.7z',1)
;~ MsgBox(0,'',$arrdir[1])
for $i=1 to UBound($arrdir)-1 step 1
;~ 	MsgBox(0,'',$arrdir[$i])
;~ 	MsgBox(0,'',StringTrimRight($arrdir[$i],3)&'.txt')
	$7z=$arrdir[$i]
	$txt=StringTrimRight($arrdir[$i],3)&'.txt'

;~ MsgBox(0,'',$7z)
;~ MsgBox(0,'',$txt)

	if FileExists('drivers\'&$txt) and not FileExists('drivers\'&$7z) then FileDelete($txt)
	if FileExists('drivers\'&$7z) and not FileExists('drivers\'&$txt) then sevenz($7z, $txt)
Next





MsgBox(0,'SDIVerificar7z','Terminé. Si corresponde voy a cerrar dont sleep')

if $dontsleep=0 then
	do
		ProcessClose('DontSleep.exe')
		ProcessClose('DontSleep_x64.exe')
	until not ProcessExists('DontSleep.exe') and not ProcessExists('DontSleep_x64.exe')
EndIf


if not $borrar then
	if 6=MsgBox(4,'SDIVerificar7z','Borrar txt´s viejos?') then borrartxt()
else
	borrartxt()
EndIf


func borrartxt()

	$arrdir=_FileListToArray ('drivers','*.txt',1)
;	MsgBox(0,'',$arrdir[1])
	for $i=1 to UBound($arrdir)-1 step 1
		$txt=$arrdir[$i]
;		$txt=StringTrimRight($arrdir[$i],3)&'.txt'

	;~ MsgBox(0,'',$7z)
	;~ MsgBox(0,'',$txt)

		if FileExists(@ScriptDir & '\drivers\'&$txt) then FileDelete(@ScriptDir & '\drivers\'&$txt)
	Next

EndFunc


func sevenz($7z,$txt)
	$ok = 0
;~ 	7z t drivers\DP_Sounds_Realtek_DCH_23120.7z > drivers\asd.txt
;~ 	ShellExecuteWait('cmd','/C rar.exe x -y "'&@ScriptDir&'\Repositorio ME.rar" "'&@HomeDrive&'\Programadores\ME"')
;~  	MsgBox(0,'','/C 7z t "drivers\'&$7z&'" > "drivers\'&$txt&'"')
	TrayTip ( "Drivers", $7z, 10)
	TraySetToolTip($7z)

	ShellExecuteWait('cmd','/C 7z t "drivers\'&$7z&'" > "drivers\'&$txt&'"')

	$cantlineas=_FileCountLines('drivers\'&$txt)
	$handle=FileOpen('drivers\'&$txt)
	for $i=1 to $cantlineas
		if 'Everything is Ok' = FileReadLine($handle,$i) Then $ok = 1
	Next

	if $ok=0 then
		if not $borrar then
			if 6= MsgBox(4,'SDIVerificar7z','Falla driver: '&$txt&'.'&@CRLF&'Borrarlo?') then
				FileDelete('drivers\'&$7z)
				FileDelete('drivers\'&$txt)
			EndIf
		else
			FileDelete('drivers\'&$7z)
			FileDelete('drivers\'&$txt)
		EndIf
	EndIf
EndFunc




