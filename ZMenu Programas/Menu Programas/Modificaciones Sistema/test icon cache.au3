borrarcacheiconos()
;~ MsgBox(0,'',@LocalAppDataDir&'\Microsoft\Windows\Explorer')
func borrarcacheiconos()
	if @OSVersion='WIN_XP' then
		Do
			MsgBox(0,'','menuverificar falta codigo cache iconos windows xp')
		Until 0
	EndIf

	if @OSVersion='WIN_7' then $diriconcache=@LocalAppDataDir
	if @OSVersion="WIN_10" or @OSVersion="WIN_81" or @OSVersion="WIN_8" then $diriconcache=@LocalAppDataDir&'\Microsoft\Windows\Explorer'

	ShellExecuteWait('cmd',' /c del iconcache*.db',$diriconcache,'',@SW_HIDE)

EndFunc
