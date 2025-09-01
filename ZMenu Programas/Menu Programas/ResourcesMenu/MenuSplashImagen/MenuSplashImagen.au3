#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;SplashImageOn('Menu Programas','menuimagen.jpg',506,428,@DesktopWidth/2-506/2,@DesktopHeight/2-428/2,16)
if ProcessExists('menu.exe') then $existe=1
if not ProcessExists('menu.exe') then $existe=0
$exit=0
while $exit=0
	if $existe=1 and not ProcessExists('menu.exe') then $exit=1
	$x=Random(0,@DesktopWidth-253,1)
	$y=Random(0,@DesktopHeight-214,1)
	;SplashImageOn('Menu Programas','menuimagen.jpg',253,214,@DesktopWidth/2-253/2,@DesktopHeight/2-214/2,16)
	SplashImageOn('Menu Programas','menuimagen.jpg',253,214,$x,$y,16)
	Sleep(200)

WEnd