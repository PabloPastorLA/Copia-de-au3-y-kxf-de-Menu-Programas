#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here





Do
	$aMem=MemGetStats()
	$texto="Memory Load:		" & $aMem[0]&'%'&@crlf&"Total physical RAM:	" & Round($aMem[1]/1024/1024,2)&' GB'&@crlf&"Libre physical RAM:	" & Round($aMem[2]/1024/1024,2)&' GB'&@crlf&"Total Pagefile:		" & Round($aMem[3]/1024/1024,2)&' GB'&@crlf&"Libre Pagefile:		" & Round($aMem[4]/1024/1024,2)&' GB'&@crlf&"Total virtual:		" & Round($aMem[5]/1024/1024,2)&' GB'&@crlf&"Libre virtual:	 " & Round($aMem[6]/1024/1024,2)&' GB'
	SplashTextOn('Espera',$texto,250,120,@DesktopWidth-250,@DesktopHeight-160,23,'',10)
	Sleep(500)
until 0