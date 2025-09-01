








		if WinExists('Seguridad de Windows','debería instalar software de controlador ') then
			MsgBox(0,'','existe');
 			if ControlGetText('Seguridad de Windows','&Instalar','Button1')='&Instalar' then ControlClick('Seguridad de Windows','&Instalar','Button1')
 			if ControlGetText('Seguridad de Windows','&Instalar','Button2')='&Instalar' then ControlClick('Seguridad de Windows','&Instalar','Button2')
 		EndIf
