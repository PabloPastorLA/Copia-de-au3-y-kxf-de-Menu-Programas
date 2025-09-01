#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Icon2.ico
#AutoIt3Wrapper_Compression=0
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
$exit=0
$exit2=0
do
	$exit=$exit+1
	if WinExists('Error') then
		ControlClick('Error','','TspSkinButton3')
		$exit2=1
	EndIf
	if not WinExists('Error') and $exit2=1 then Exit
	Sleep(100)
Until $exit>=200

