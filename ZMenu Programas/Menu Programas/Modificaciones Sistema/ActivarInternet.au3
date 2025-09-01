if WinExists('Menu en modo RED') then
	do
	until ControlCommand('Menu en modo RED','','Button24',"IsEnabled", "")
	ControlClick($win,'','Button24')
else if WinExists('Menu en modo LOCAL') then $win='Menu en modo LOCAL'



;~ ShellExecute('explorer.exe',' ms-availablenetworks:')