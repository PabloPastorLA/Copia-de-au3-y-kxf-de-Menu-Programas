#include <Date.au3>

ETAAntes()




;Acá hacer el proceso
Sleep(3000)
;------------------



$segtotal=ETADespues()

MsgBox(0,'','$segtotal: '&$segtotal)



func ETAAntes()
	global $tTimeantes	= _Date_Time_GetSystemTime()
EndFunc


func ETADespues()
	$tTimedespues	= _Date_Time_GetSystemTime()

	$aTimeantes = _Date_Time_SystemTimeToArray($tTimeantes)
	$aTimedespues = _Date_Time_SystemTimeToArray($tTimedespues)

	$dias=$aTimedespues[1] - $aTimeantes[1]
	$horas=$aTimedespues[3] - $aTimeantes[3]
	$min=$aTimedespues[4] - $aTimeantes[4]
	$seg=$aTimedespues[5] - $aTimeantes[5]

	$segtotal=$dias*24*60*60+$horas*60*60+$min*60+$seg
	return $segtotal
EndFunc
