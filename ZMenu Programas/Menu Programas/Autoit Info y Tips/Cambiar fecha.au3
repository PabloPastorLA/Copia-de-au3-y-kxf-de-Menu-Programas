#include <Date.au3>
;~ Month ........: $aTime[0]
;~ Day ..........: $aTime[1]
;~ Year .........: $aTime[2]
;~ Hour .........: $aTime[3]
;~ Minute .......: $aTime[4]
;~ Second .......: $aTime[5]
;~ Milliseconds .: $aTime[6]
;~ Day of week ..: $aTime[7]


$fechahorareal = _Date_Time_GetLocalTime()
$tTime = _Date_Time_GetSystemTime()
$aTime = _Date_Time_SystemTimeToArray($tTime)
$fechahoradeseada = _Date_Time_EncodeSystemTime($aTime[0], $aTime[1]-5, $aTime[2], $aTime[3]-3, $aTime[4], $aTime[5],$aTime[6])


;escribir fecha deseada
_Date_Time_SetLocalTime(DllStructGetPtr($fechahoradeseada))

;hacer lo que uno quiere
funcion()

;volver a fecha original
_Date_Time_SetLocalTime(DllStructGetPtr($fechahorareal))






func funcion()

	MsgBox(0,'','Pausa mira hora fecha')

EndFunc
