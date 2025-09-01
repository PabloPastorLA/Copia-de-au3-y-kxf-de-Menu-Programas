ShellExecute('chrome')
Sleep(5000)
Do
	ProcessClose('chrome.exe')
until not ProcessExists('chrome.exe')



#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
