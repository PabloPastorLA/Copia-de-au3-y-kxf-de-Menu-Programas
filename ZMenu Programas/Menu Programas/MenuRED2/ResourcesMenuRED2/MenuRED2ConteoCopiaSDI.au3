#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
$seg=0
$i=Round(DirGetSize(@HomeDrive&'\MenuRED2\SDI Drivers LAN ONLY') / 1024 / 1024)
while $i<190
	$i=Round(DirGetSize(@HomeDrive&'\MenuRED2\SDI Drivers LAN ONLY') / 1024 / 1024)
	SplashTextOn('Copiando','Conteo Copia '&$seg&' s'&@CRLF&Round(DirGetSize(@HomeDrive&'\MenuRED2\SDI Drivers LAN ONLY') / 1024 / 1024)&' MB',160,80,0,190)
	Sleep(1000)
	$seg=$seg+1
WEnd

;~ $i=Round(DirGetSize(@HomeDrive&'\MenuRED2\SDI Drivers LAN ONLY') / 1024 / 1024)

;	SplashTextOn('MenuRED2','Copiando'&@CRLF&Round(DirGetSize(@ScriptDir) / 1024 / 1024)&' MB',160,80,0,110)

