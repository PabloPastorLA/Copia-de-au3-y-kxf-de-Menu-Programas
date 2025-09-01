







#include <Date.au3>

#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

 $cont= RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.5','Version')
$ETA=' xx:xx'
;$ETA=''

if $cont='' or $cont='False' then
	MsgBox(0,'','Falta net 3.5. Cerrando')
	Exit
elseif $cont='3.5.30729.4926' then
Else
;	MsgBox(0,'','Ahora si o si continuar codigo')
;	MsgBox(0,'',$cont)
;	Exit
EndIf



if 7=MsgBox(4,'Disk Fill','Desea llenar casi a tope una unidad?') then Exit
$vent=WinGetTitle("[active]")
if @OSVersion='WIN_7' then
	Send("#e")
Else
	;ShellExecute('cmd','/c explorer.exe /e,::{20D04FE0-3AEA-1069-A2D8-08002B30309D}')
	ShellExecute('explorer.exe','/e,::{20D04FE0-3AEA-1069-A2D8-08002B30309D}')
EndIf

$count=0

Do
	$count=$count+1
	Sleep(100)
until $vent<>WinGetTitle("[active]") or $count>=30
;MsgBox(0,'','2',1)
;Sleep(1000)


;$win=WinGetTitle("[active]")
$win='Equipo'
WinWaitActive($win)

;Win 10 Equipo



;WinWaitActive($win)

;MsgBox(0,'','4',1)

;Letra
;65 a 90.   97 a 122
Do
	$letra=InputBox('Disk Fill','Ingrese solo la letra de unidad, sin ":" ni "\"')
	if $letra='' and 6=MsgBox(4,'Salir','Desea terminar el script?') then
		WinClose($win)
		Exit
	EndIf

until StringLen($letra)=1 and ((Asc($letra)>= 65 and Asc($letra)<= 90 ) or (Asc($letra)>= 97 and Asc($letra)<= 122))
$letra = $letra&':\'
;MsgBox(0,'',$letra)
for $i=1 to 10
	WinClose($win)
Next

Do
	ETAAntes()

	$size=DriveSpaceFree($letra)

	;MsgBox(0,'',$size)
	;MsgBox(0,'','cmd /k DummyCMD.exe '&$letra&' 1073741824 0')
	$j=0
	if $j=0 then
		for $i=1 to 9 Step 1

			if FileExists($letra&'000'&$i&'G') and FileGetSize($letra&'000'&$i&'G')<>1073741824 Then FileDelete($letra&'000'&$i&'G')
			if FileExists($letra&'000'&$i&'M') and FileGetSize($letra&'000'&$i&'M')<>1048576 Then FileDelete($letra&'000'&$i&'M')
			if FileExists($letra&'000'&$i&'K') and FileGetSize($letra&'000'&$i&'K')<>1024 Then FileDelete($letra&'000'&$i&'K')
			if not FileExists($letra&'000'&$i&'G') and $j=0 Then
				$j='000'&$i
			EndIf
		Next
	EndIf
	if $j=0 then
		for $i=10 to 99 Step 1
			if FileExists($letra&'00'&$i&'G') and FileGetSize($letra&'00'&$i&'G')<>1073741824 Then FileDelete($letra&'00'&$i&'G')
			if FileExists($letra&'00'&$i&'M') and FileGetSize($letra&'00'&$i&'M')<>1048576 Then FileDelete($letra&'00'&$i&'M')
			if FileExists($letra&'00'&$i&'K') and FileGetSize($letra&'00'&$i&'K')<>1024 Then FileDelete($letra&'00'&$i&'K')
			if not FileExists($letra&'00'&$i&'G') and $j=0 Then
				$j='00'&$i
			EndIf
		Next
	EndIf
	if $j=0 then
		for $i=100 to 999 Step 1
			if FileExists($letra&'0'&$i&'G') and FileGetSize($letra&'0'&$i&'G')<>1073741824 Then FileDelete($letra&'0'&$i&'G')
			if FileExists($letra&'0'&$i&'G') and FileGetSize($letra&'0'&$i&'M')<>1048576 Then FileDelete($letra&'0'&$i&'M')
			if FileExists($letra&'0'&$i&'G') and FileGetSize($letra&'0'&$i&'K')<>1024 Then FileDelete($letra&'0'&$i&'K')
			if not FileExists($letra&'0'&$i&'G') and $j=0 Then
				$j='0'&$i
			EndIf
		Next
	EndIf
	if $j=0 then
		for $i=1000 to 9999 Step 1
			if FileExists($letra&''&$i&'G') and FileGetSize($letra&''&$i&'G')<>1073741824 Then FileDelete($letra&''&$i&'G')
			if FileExists($letra&''&$i&'G') and FileGetSize($letra&''&$i&'M')<>1048576 Then FileDelete($letra&''&$i&'M')
			if FileExists($letra&''&$i&'G') and FileGetSize($letra&''&$i&'K')<>1024 Then FileDelete($letra&''&$i&'K')
			if not FileExists($letra&''&$i&'G') and $j=0 Then
				$j=''&$i
			EndIf
		Next
	EndIf



;~ 	For $i=1 to 9999 step 1
;~ 		if $i<10 then $i='000'&$i
;~ 		if $i>9 and $i<100 then $i='00'&$i
;~ 		if $i>99 and $i<1000 then $i='0'&$i


$sizemuestra=($size/1024)
if not IsInt ($sizemuestra) then $sizemuestra=Floor($sizemuestra)
SplashTextOn('DummyCMD -> '&$letra&' -> '&$sizemuestra&'G','Creando '&$j&'G'&$ETA,180,38,@DesktopWidth-183,(@DesktopHeight)/2-38*2)
;SplashTextOn('DummyCMD -> '&$letra&' -> '&$sizemuestra&'G','Creando '&$j&'G'&$ETA,172,38,@DesktopWidth-175,(@DesktopHeight)/2-38*2)

	if $size>= 1024 then

		$win=WinGetTitle("[active]")
		if $win='' then $win='asdasdasdasdasdasdasdasd'
		ShellExecute('DiskFillOrdenarVentana.exe',$win)
		if not ProcessExists('DiskFillcerrar.exe') then ShellExecute('DiskFillcerrar.exe')
		ShellExecuteWait('cmd','/c DummyCMD.exe '&$letra&$j&'G 1073741824 0');,'','',@SW_HIDE)
		Do
			processclose('DummyCMD.exe')
			Sleep(200)
		Until not ProcessExists('DummyCMD.exe')
	EndIf
;	$sizeantes=$size
	$size=DriveSpaceFree($letra)
	$sizedespues=$size
	$segtotal=ETADespues()
	;MsgBox(0,'','$segtotal: '&$segtotal)
	$segtotal=$segtotal*($size/1024)
	;MsgBox(0,'','$segtotal: '&$segtotal)
	$horatotal=Floor($segtotal/60/60)
	;MsgBox(0,'','$horatotal: '&$horatotal)
	$mintotal=Floor(($segtotal - ($horatotal*60*60)) /60)
	;MsgBox(0,'','$mintotal: '&$mintotal)
	if $mintotal<10 then $mintotal='0'&$mintotal
	if $horatotal<10 then $horatotal='0'&$horatotal
	;MsgBox(0,'','$horatotal: '&$horatotal)
	;MsgBox(0,'','$mintotal: '&$mintotal)
	$ETA=' '&$horatotal&':'&$mintotal
	;MsgBox(0,'','$ETA: '&$ETA)
SplashTextOn('DummyCMD -> '&$letra&' -> '&$sizemuestra&'G','Creando '&$j&'G'&$ETA,180,38,@DesktopWidth-183,(@DesktopHeight)/2-38*2)
Until $size<1024


Do
	$size=DriveSpaceFree($letra)*1024*1024
	if not IsInt($size) then $size=Floor($size)
;	SplashTextOn('DummyCMD -> '&$letra&' -> '&$sizemuestra&'G','Creando '&$j&'G'&$ETA,172,38,@DesktopWidth-175,(@DesktopHeight)/2-38*2)
	SplashTextOn('DummyCMD -> '&$letra&' -> '&$size&'M'       ,'Creando '&$j&'M'&$ETA,180,38,@DesktopWidth-183,(@DesktopHeight)/2-38*2)
	For $i=1 to 9999 step 1
		if $i<10 then $i='000'&$i
		if $i>9 and $i<100 then $i='00'&$i
		if $i>99 and $i<1000 then $i='0'&$i

		if not FileExists($letra&$i&'M') then
			ShellExecuteWait('cmd','/c DummyCMD.exe '&$letra&$i&'M '&$size&' 0');,'','',@SW_HIDE)
			ExitLoop
		EndIf
	Next
Until $size<1

$size=DriveSpaceFree($letra)*1024
if not IsInt($size) then $size=Floor($size)
;SplashTextOn('DummyCMD -> '&$letra&' -> '&$size&'M'       ,'Creando '&$j&'M'&$ETA,172,38,@DesktopWidth-175,(@DesktopHeight)/2-38*2)
SplashTextOn('DummyCMD -> '&$letra&' -> '&$size*1024&'K'  ,'Creando '&$j&'K'&$ETA,180,38,@DesktopWidth-183,(@DesktopHeight)/2-38*2)
ShellExecuteWait('cmd','/c DummyCMD.exe '&$letra&'9999K '&$size&' 0');,'','',@SW_HIDE)
SplashOff()

MsgBox(0,'Disk Fill','Terminé.')
Exit



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
