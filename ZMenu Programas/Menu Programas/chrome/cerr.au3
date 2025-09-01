#RequireAdmin
Do
	ProcessClose('chrome.exe')
until not ProcessExists('chrome.exe')
