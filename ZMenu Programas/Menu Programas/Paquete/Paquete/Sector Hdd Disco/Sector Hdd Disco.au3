#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>





#Region ### START Koda GUI section ### Form=Sector Hdd Disco.kxf
$Form1_1 = GUICreate("Conversor N° Sector -> MB", 275, 401, 192, 124)
$Input1 = GUICtrlCreateInput("1", 16, 16, 89, 21)
$Input2 = GUICtrlCreateInput("2048", 160, 16, 41, 21)
$Label1 = GUICtrlCreateLabel("SECTOR", 104, 24, 48, 17)
$Label2 = GUICtrlCreateLabel("MB Despl", 200, 24, 50, 17)
$Label3 = GUICtrlCreateLabel("", 16, 56, 118, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000000)
GUICtrlSetResizing(-1, $GUI_DOCKRIGHT)
$Label4 = GUICtrlCreateLabel("", 16, 80, 118, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
$Label5 = GUICtrlCreateLabel("", 16, 104, 118, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000000)
GUICtrlSetResizing(-1, $GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
$Label6 = GUICtrlCreateLabel("", 144, 56, 118, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x008000)
$Label7 = GUICtrlCreateLabel("", 144, 80, 118, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
$Label8 = GUICtrlCreateLabel("", 144, 104, 118, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x008000)
$Input3 = GUICtrlCreateInput("1", 16, 144, 89, 21)
$Input4 = GUICtrlCreateInput("2048", 160, 144, 41, 21)
$Label9 = GUICtrlCreateLabel("SECTOR", 104, 152, 48, 17)
$Label10 = GUICtrlCreateLabel("MB Despl", 200, 152, 50, 17)
$Label11 = GUICtrlCreateLabel("", 16, 184, 118, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000000)
GUICtrlSetResizing(-1, $GUI_DOCKRIGHT)
$Label12 = GUICtrlCreateLabel("", 16, 208, 118, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
$Label13 = GUICtrlCreateLabel("", 16, 232, 118, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000000)
GUICtrlSetResizing(-1, $GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
$Label14 = GUICtrlCreateLabel("", 144, 184, 118, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x008000)
$Label15 = GUICtrlCreateLabel("", 144, 208, 118, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
$Label16 = GUICtrlCreateLabel("", 144, 232, 118, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x008000)
$Input5 = GUICtrlCreateInput("1", 16, 272, 89, 21)
$Input6 = GUICtrlCreateInput("2048", 160, 272, 41, 21)
$Label17 = GUICtrlCreateLabel("SECTOR", 104, 280, 48, 17)
$Label18 = GUICtrlCreateLabel("MB Despl", 198, 280, 50, 17)
$Label19 = GUICtrlCreateLabel("", 16, 312, 118, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000000)
GUICtrlSetResizing(-1, $GUI_DOCKRIGHT)
$Label20 = GUICtrlCreateLabel("", 16, 336, 118, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
$Label21 = GUICtrlCreateLabel("", 16, 360, 118, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000000)
GUICtrlSetResizing(-1, $GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
$Label22 = GUICtrlCreateLabel("", 144, 312, 118, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x008000)
$Label23 = GUICtrlCreateLabel("", 144, 336, 118, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
$Label24 = GUICtrlCreateLabel("", 144, 360, 118, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x008000)
$Button1 = GUICtrlCreateButton("", 248, 16, 17, 17)
$Button2 = GUICtrlCreateButton("", 248, 144, 17, 17)
$Button3 = GUICtrlCreateButton("", 248, 272, 17, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
 		Case $Input1
			SECaB1()
 		Case $Input2
			SECaB1()
		Case $Button1
			Reset1()
 		Case $Input3
			SECaB2()
 		Case $Input4
			SECaB2()
		Case $Button2
			Reset2()
 		Case $Input5
			SECaB3()
 		Case $Input6
			SECaB3()
		Case $Button3
			Reset3()

	EndSwitch
WEnd


Func Reset1()
	GUICtrlSetData($Input1,1)
	GUICtrlSetData($Input2,2048)
	GUICtrlSetData($Label3,'')
	GUICtrlSetData($Label4,'')
	GUICtrlSetData($Label5,'')
	GUICtrlSetData($Label6,'')
	GUICtrlSetData($Label7,'')
	GUICtrlSetData($Label8,'')
EndFunc

Func Reset2()
	GUICtrlSetData($Input3,1)
	GUICtrlSetData($Input4,2048)
	GUICtrlSetData($Label11,'')
	GUICtrlSetData($Label12,'')
	GUICtrlSetData($Label13,'')
	GUICtrlSetData($Label14,'')
	GUICtrlSetData($Label15,'')
	GUICtrlSetData($Label16,'')
EndFunc

Func Reset3()
	GUICtrlSetData($Input5,1)
	GUICtrlSetData($Input6,2048)
	GUICtrlSetData($Label19,'')
	GUICtrlSetData($Label20,'')
	GUICtrlSetData($Label21,'')
	GUICtrlSetData($Label22,'')
	GUICtrlSetData($Label23,'')
	GUICtrlSetData($Label24,'')
EndFunc

func SECaB1()
	$sector=GUICtrlRead($Input1)
	$despl=GUICtrlRead($Input2)


	$MB=round(($sector / 2) / 1024,1)



	$MBmin=$MB - $despl
	if $MBmin<0 then $MBmin=0
	$MBmax=$MB + $despl

	GUICtrlSetData($Label3,$MBmin&' MB')
	GUICtrlSetData($Label4,$MB&' MB')
	GUICtrlSetData($Label5,$MBmax&' MB')

	$GB=$MB/1024
	$GBmin=$MBmin/1024
	$GBmax=$MBmax/1024

	$GBmin=Ceiling($GBmin)-1
	$GBmax=Ceiling($GBmax)

	$MBmin=$GBmin*1024
	if $MBmin<0 then $MBmin=0
	$MBmax=$GBmax*1024

	GUICtrlSetData($Label6,$MBmin&' MB')
	GUICtrlSetData($Label7,$MB&' MB')
	GUICtrlSetData($Label8,$MBmax&' MB')
	;if not IsInt($MBmin) then
EndFunc

func SECaB2()
	$sector=GUICtrlRead($Input3)
	$despl=GUICtrlRead($Input4)


	$MB=round(($sector / 2) / 1024,1)



	$MBmin=$MB - $despl
	if $MBmin<0 then $MBmin=0
	$MBmax=$MB + $despl

	GUICtrlSetData($Label11,$MBmin&' MB')
	GUICtrlSetData($Label12,$MB&' MB')
	GUICtrlSetData($Label13,$MBmax&' MB')

	$GB=$MB/1024
	$GBmin=$MBmin/1024
	$GBmax=$MBmax/1024

	$GBmin=Ceiling($GBmin)-1
	$GBmax=Ceiling($GBmax)

	$MBmin=$GBmin*1024
	if $MBmin<0 then $MBmin=0
	$MBmax=$GBmax*1024

	GUICtrlSetData($Label14,$MBmin&' MB')
	GUICtrlSetData($Label15,$MB&' MB')
	GUICtrlSetData($Label16,$MBmax&' MB')
	;if not IsInt($MBmin) then
EndFunc


func SECaB3()
	$sector=GUICtrlRead($Input5)
	$despl=GUICtrlRead($Input6)


	$MB=round(($sector / 2) / 1024,1)



	$MBmin=$MB - $despl
	if $MBmin<0 then $MBmin=0
	$MBmax=$MB + $despl

	GUICtrlSetData($Label19,$MBmin&' MB')
	GUICtrlSetData($Label20,$MB&' MB')
	GUICtrlSetData($Label21,$MBmax&' MB')

	$GB=$MB/1024
	$GBmin=$MBmin/1024
	$GBmax=$MBmax/1024

	$GBmin=Ceiling($GBmin)-1
	$GBmax=Ceiling($GBmax)

	$MBmin=$GBmin*1024
	if $MBmin<0 then $MBmin=0
	$MBmax=$GBmax*1024

	GUICtrlSetData($Label22,$MBmin&' MB')
	GUICtrlSetData($Label23,$MB&' MB')
	GUICtrlSetData($Label24,$MBmax&' MB')
	;if not IsInt($MBmin) then
EndFunc

