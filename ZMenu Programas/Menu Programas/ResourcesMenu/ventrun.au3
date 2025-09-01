#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****



$i=1

;SplashTextOn('Espera','Menu corriendo |',160,40,0,0,4)



$TITULO='';'Menu corriendo'
while ProcessExists('menu.exe')



	;~ $x=@DesktopWidth-250
	;~ $y=@DesktopHeight-260
	;~ $b=240
	;~ $h=190

	$x=@DesktopWidth-100
	$y=@DesktopHeight-200
	$b=50
	$h=50






	if $i=5 Then $i=1

	$aMem = MemGetStats()
$t="Memory Load : " & $aMem[0]&'%'&@crlf&"Total physical RAM: " & Round($aMem[1]/1024/1024,2)&' GB'&@crlf&"Libre physical RAM: " & Round($aMem[2]/1024/1024,2)&' GB'&@crlf&"Total Pagefile: " & Round($aMem[3]/1024/1024,2)&' GB'&@crlf&"Libre Pagefile: " & Round($aMem[4]/1024/1024,2)&' GB'&@crlf&"Total virtual: " & Round($aMem[5]/1024/1024,2)&' GB'&@crlf&"Libre virtual: " & Round($aMem[6]/1024/1024,2)&' GB'
$t=''

	if $i=1 Then
		SplashTextOn($TITULO,'|'&@CRLF&$t,$b,$H,$x,$y)
	Elseif $i=2 Then
		SplashTextOn($TITULO,'/'&@CRLF&$t,$b,$H,$x,$y)
	Elseif $i=3 Then
		SplashTextOn($TITULO,'--'&@CRLF&$t,$b,$H,$x,$y)
	Elseif $i=4 Then
		SplashTextOn($TITULO,'\'&@CRLF&$t,$b,$H,$x,$y)
	EndIf

	sleep (500)

	$i=$i+1
WEnd

Exit






