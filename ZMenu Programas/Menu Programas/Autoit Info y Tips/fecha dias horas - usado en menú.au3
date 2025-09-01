#include <Date.au3>

Global $Anio=2020				;<--	Año Actual
Global $Mes=1					;<--	Mes Actual



;comparo fecha entre archivo y la constante y reescribo
if FileExists(@ScriptDir&'\resourcesmenu\fecha.txt') then
	$arch=FileOpen(@ScriptDir&'\resourcesmenu\fecha.txt')
	$linea=FileReadLine($arch,1)
	FileClose($arch)

	if $Anio < StringRight($linea,4) then
		$Anio=StringRight($linea,4)
		$Mes=StringTrimRight(StringRight($linea,7),5)
	EndIf
	if $Anio = StringRight($linea,4) and $Mes < StringTrimRight(StringRight($linea,7),5) Then $Mes=StringTrimRight(StringRight($linea,7),5)
EndIf
;termino de comparar fecha entre archivo y la constante y reescribir



MsgBox(0,'',$Anio)
MsgBox(0,'',$Mes)






Time()

Func Time()
	$tTime = _Date_Time_GetSystemTime()
	$aTime = _Date_Time_SystemTimeToArray($tTime)
	$FechaOK=0

	If $aTime[2] = $Anio and $aTime[0] >= $Mes Then $FechaOK=1
	If $aTime[2] > $Anio Then $FechaOK=1
	if $FechaOK=1 then
		$tTime = _Date_Time_GetSystemTime()
		$aTime = _Date_Time_SystemTimeToArray($tTime)
		if $aTime[1]<=9 then $aTime[1]=0&$aTime[1]
		if $aTime[0]<=9 then $aTime[0]=0&$aTime[0]
		;MsgBox(0,'',$aTime[1]&'/'&$aTime[0]&'/'&$aTime[2])

		do
			FileDelete(@ScriptDir&'\resourcesmenu\fecha.txt')
		until not FileExists(@ScriptDir&'\resourcesmenu\fecha.txt')
		FileWrite(@ScriptDir&'\resourcesmenu\fecha.txt',$aTime[1]&'/'&$aTime[0]&'/'&$aTime[2])

		Return
	EndIf


	MsgBox(0, '', 'Debe ajustar la fecha/hora')

	$tNew = _Date_Time_EncodeSystemTime(1, 1, 2020, 3, 10, 45)
	_Date_Time_SetSystemTime($tNew)


	ShellExecute('timedate.cpl')
	WinWait('Fecha y hora')
	WinMove('Fecha y hora', '', @DesktopWidth / 3, '') ;@DesktopHeight/3)
	While Not WinExists('Valores de fecha y hora')
		ControlClick('Fecha y hora', 'Cambiar &fecha y hora...', 'Button1')
		Sleep(50)
	WEnd
	WinMove('Valores de fecha y hora', '', @DesktopWidth / 3, '') ;@DesktopHeight/3)

	Opt('MouseClickDownDelay', 100)
	ControlClick('Valores de fecha y hora', '', 'SysMonthCal321', '', 2, 20, 5)
	For $i=1 to (($Anio-2020)*12+$Mes-1) Step 1
		Send('{right}')
	Next

	Sleep(5000)
	Opt('MouseClickDownDelay', 10)

	WinWaitClose('Valores de fecha y hora')
	WinWaitClose('Fecha y hora')
	Time()
EndFunc   ;==>Time