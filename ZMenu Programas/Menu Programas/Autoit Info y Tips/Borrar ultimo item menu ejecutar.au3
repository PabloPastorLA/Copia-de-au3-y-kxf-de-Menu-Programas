;~ 	$mru=RegRead('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU','MRUList')

	for $i=97 to 122 step 1
		if Chr($i)=StringLeft(RegRead('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU','MRUList'),1) Then
			RegDelete('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU',Chr($i))
		EndIf
	Next


;~ 	MsgBox(0,'',Chr(97))
;~ 	MsgBox(0,'',Chr(122))


