


WinWait('Internet Explorer 11','',20)
if not WinExists('Internet Explorer 11') then Exit

do
	if WinExists('Internet Explorer 11') then WinClose('Internet Explorer 11')
until not WinExists('Internet Explorer 11')


