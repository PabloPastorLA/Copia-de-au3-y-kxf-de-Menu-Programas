;~ {00447F94-DBB7-4C3C-984A-92B951A29AE5}


;~ PropiedadesMarvelYukon()
PropiedadesWlan()

func PropiedadesWlan()

	Do
		$exit=0
		while WinExists('Estado de Conexión de red inalámbrica 5') or WinExists('::{208D2C60-3AEA-1069-A2D7-08002B30309D}\::{7007ACC7-3202-11D1-AAD2-00805FC1270E}\::{F7733EA0-D970-45C5-A6CE-540A953497DC}') or WinExists('View Available Networks')
			WinClose('Estado de Conexión de red inalámbrica 5')
			WinClose('::{208D2C60-3AEA-1069-A2D7-08002B30309D}\::{7007ACC7-3202-11D1-AAD2-00805FC1270E}\::{F7733EA0-D970-45C5-A6CE-540A953497DC}')
			WinClose('View Available Networks')
		WEnd
		$handle=ShellExecute('cmd','/k start ::{208D2C60-3AEA-1069-A2D7-08002B30309D}\::{7007ACC7-3202-11D1-AAD2-00805FC1270E}\::{F7733EA0-D970-45C5-A6CE-540A953497DC}','','');,@SW_HIDE)
		while not WinExists('Estado de Conexión de red inalámbrica 5') And not WinExists('::{208D2C60-3AEA-1069-A2D7-08002B30309D}\::{7007ACC7-3202-11D1-AAD2-00805FC1270E}\::{F7733EA0-D970-45C5-A6CE-540A953497DC}') and not WinExists('View Available Networks')
			Sleep(300)
		WEnd

	;~ 	WinSetState('Administrador: C:\Windows\System32\cmd.exe','',@SW_HIDE)
	;~ 	return ($handle)




		If WinExists('View Available Networks') then
			While WinExists('View Available Networks')
				WinClose('View Available Networks')
				ProcessClose($handle)
			WEnd
			MsgBox(0,'','Debe conectar internet en la WLAN antes de continuar',5)
;~ 			$handle=PropiedadesWlan()
		EndIf

		if WinExists('::{208D2C60-3AEA-1069-A2D7-08002B30309D}\::{7007ACC7-3202-11D1-AAD2-00805FC1270E}\::{F7733EA0-D970-45C5-A6CE-540A953497DC}') then
			While WinExists('::{208D2C60-3AEA-1069-A2D7-08002B30309D}\::{7007ACC7-3202-11D1-AAD2-00805FC1270E}\::{F7733EA0-D970-45C5-A6CE-540A953497DC}')
				WinClose('::{208D2C60-3AEA-1069-A2D7-08002B30309D}\::{7007ACC7-3202-11D1-AAD2-00805FC1270E}\::{F7733EA0-D970-45C5-A6CE-540A953497DC}')
				ProcessClose($handle)
			WEnd
			MsgBox(0,'','Adaptador USB TP-LINK no detectado!',5)
;~ 			$handle=PropiedadesWlan()
		EndIf

		if WinExists('Estado de Conexión de red inalámbrica 5') Then
			Do
				ControlClick('Estado de Conexión de red inalámbrica 5','','Button3')
				Sleep(200)
			Until WinExists('Propiedades de Conexión de red inalámbrica 5')
			ControlCommand("Propiedades de Conexión de red inalámbrica 5", "", "SysTabControl321", "TabRight", "")
			Sleep(500)
;~ 			MsgBox(0,'','OK')
			$exit=1
		EndIf
	Until $exit=1

	Return $handle

EndFunc




;~ Sleep(5000)

;~ if WinExists('View Available Networks') then MsgBox(0,'','sdf')
;~ if WinExists('View Available Networks') then WinClose('View Available Networks')
;~ if WinExists('View Available Networks') then WinClose('View Available Networks')
;~ if WinExists('View Available Networks') then WinClose('View Available Networks')
;~ Sleep(1000)

;~ if WinExists('View Available Networks') then MsgBox(0,'','sdf')


Exit




#include <MsgBoxConstants.au3>

Example()

Func Example()
    ; Retrieve a list of window handles.
    Local $aList = WinList()

    ; Loop through the array displaying only visable windows with a title.
    For $i = 1 To $aList[0][0]
        If $aList[$i][0] <> "" And BitAND(WinGetState($aList[$i][1]), 2) Then
            MsgBox($MB_SYSTEMMODAL, "", "Title: " & $aList[$i][0] & @CRLF & "Handle: " & $aList[$i][1])
        EndIf
    Next
EndFunc   ;==>Example



