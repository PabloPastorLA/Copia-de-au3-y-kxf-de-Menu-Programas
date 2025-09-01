#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****










$tiempo=0
Do
	$tiempo=$tiempo+100

	if WinExists('Microsoft Visual C++','A later version') and  ControlGetText('Microsoft Visual C++','','Button1')='OK' then ControlClick('Microsoft Visual C++','','Button1')

	;inst microsoft runtime libraries
	if WinExists('Setup - Microsoft Runtime Libraries','&Next >') and ControlGetText('Setup - Microsoft Runtime Libraries','&Next >','TNewButton1')='&Next >' then ControlClick('Setup - Microsoft Runtime Libraries','&Next >','TNewButton1')
	if WinExists('Setup - Microsoft Runtime Libraries','&Next >') and ControlGetText('Setup - Microsoft Runtime Libraries','&Next >','TNewButton2')='&Next >' then ControlClick('Setup - Microsoft Runtime Libraries','&Next >','TNewButton2')
	if WinExists('Setup - Microsoft Runtime Libraries','&Install') and ControlGetText('Setup - Microsoft Runtime Libraries','&Install','TNewButton2')='&Install' then ControlClick('Setup - Microsoft Runtime Libraries','&Install','TNewButton2')
	if WinExists('Setup - Microsoft Runtime Libraries','&Finish') and ControlGetText('Setup - Microsoft Runtime Libraries','&Finish','TNewButton2')='&Finish' then ControlClick('Setup - Microsoft Runtime Libraries','&Finish','TNewButton2')

	Sleep(100)
until $tiempo/1000 >= 600



















