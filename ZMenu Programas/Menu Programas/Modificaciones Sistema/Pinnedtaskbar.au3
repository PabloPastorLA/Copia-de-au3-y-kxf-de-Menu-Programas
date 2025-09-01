#RequireAdmin

;;if FileExists('%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar')


;~ if FileExists (@UserProfileDir & '\Appdata\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Windows Media Player.lnk') then Filedelete (@UserProfileDir & '\Appdata\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Windows Media Player.lnk')
;~ if FileExists (@UserProfileDir & '\Appdata\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Internet Explorer.lnk') then Filedelete (@UserProfileDir & '\Appdata\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Internet Explorer.lnk')
;~ if FileExists (@UserProfileDir & '\Appdata\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Windows Explorer.lnk') then Filedelete (@UserProfileDir & '\Appdata\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Windows Explorer.lnk')


;;~ RegDelete('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband')

;~ while ProcessExists('explorer.exe')
;~ 	ProcessClose('explorer.exe')
;~ WEnd

;~ ShellExecute('explorer.exe')


MSTa0skListWClass1


