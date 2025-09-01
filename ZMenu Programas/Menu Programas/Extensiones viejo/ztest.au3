;~ RegDelete('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\OpenWithList')
;~ RegDelete('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\UserChoice')




;~ RegDelete('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\UserChoice')
;~ RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\UserChoice','Progid','REG_SZ','GIF_auto_file')

;~ RegDelete('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\OpenWithList')
;~ RegWrite('HKEY_CURRENT_USER\Sofdtware\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\OpenWithList','MRUList','REG_SZ','a')
;~ RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\OpenWithList','a','REG_SZ','PhotoViewer.dll')




;~ RegDelete('HKEY_CLASSES_ROOT\.gif')


RegDelete('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif')
RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\OpenWithList','a','REG_SZ','PhotoViewer.dll')
RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\OpenWithList','b','REG_SZ','DllHost.exe')
RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\OpenWithList','MRUList','REG_SZ','ba')

;~ RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.gif\OpenWithList','a','REG_SZ','PhotoViewer.dll')

