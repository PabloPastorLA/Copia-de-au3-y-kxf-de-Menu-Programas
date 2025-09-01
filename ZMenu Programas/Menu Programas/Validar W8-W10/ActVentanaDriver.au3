#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****











$vent='Seguridad de Windows'
$texto='Solo debería instalar software de controlador de proveedores'


Do

	if WinExists($vent,$texto) and ControlGetText($vent,$texto,'Button1') then ControlClick($vent,$texto,'Button1')
	if WinExists($vent,$texto) and ControlGetText($vent,$texto,'Button2') then ControlClick($vent,$texto,'Button2')

	Sleep(500)
Until not ProcessExists('KMSAuto x64.exe') and not ProcessExists('KMSAuto x64.exe')


