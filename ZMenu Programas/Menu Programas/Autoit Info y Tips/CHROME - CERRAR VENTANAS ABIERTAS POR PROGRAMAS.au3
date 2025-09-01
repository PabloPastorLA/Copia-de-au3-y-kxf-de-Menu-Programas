func ventchrome()
;~ MsgBox(0,'','ventana chrome')

	if WinExists('aTube Catcher Official Web Site – The best video software - Google Chrome') and WinActive('aTube Catcher Official Web Site – The best video software - Google Chrome') then Send('{ctrldown}{W}{ctrlUP}')
	if WinExists('Sin título - Google Chrome') and WinActive('Sin título - Google Chrome') then Send('{ctrldown}{W}{ctrlUP}')



	if WinExists('www.atube.me - Google Chrome') and WinActive('www.atube.me - Google Chrome') then Send('{ctrldown}{W}{ctrlUP}')   ;esta es sin internet


;~ MsgBox(0,'','ventana chrome')
;~ Exit
EndFunc
