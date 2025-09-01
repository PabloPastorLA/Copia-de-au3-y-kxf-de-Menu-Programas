#RequireAdmin
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Eliminando Autocads',160,80,0,110)

$programfilesdir=@ProgramFilesDir
if StringRight($programfilesdir,6) = ' (X86)' Then $programfilesdir=StringTrimRight($programfilesdir,6)


ShellExecute('uninstalltool')
WinWait('Herramienta de desinstalación de Autodesk')
;MsgBox(0,'',GUICtrlGetState('Button1'))
if GUICtrlGetState('Button1') = -1 then WinClose('Herramienta de desinstalación de Autodesk')
;MsgBox(0,'',ControlGetText('Herramienta de desinstalación de Autodesk','','Button1'))





DirRemove($programfilesdir&'\Autodesk',1)
DirRemove($programfilesdir&'\Common Files\Autodesk Shared',1)
DirRemove(@AppDataDir&'\Autodesk',1)
DirRemove(@LocalAppDataDir&'\Autodesk',1)

;MsgBox(0,'',RegEnumKey('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList',4))
$SID=RegEnumKey('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList',4)


RegDelete('HKEY_CURRENT_USER\Software\Autodesk')
RegDelete('HKEY_LOCAL_MACHINE\Software\Autodesk')
RegDelete('HKEY_Users\'&$SID&'\Software\Autodesk')

Exit




#cs
Part 2: Cleanup Remaining Files

Delete: C:\Program Files\Autodesk
Delete: C:\Program Files\Common Files\Autodesk Shared
Delete: User Profile Folders
C:\Users\USERNAME\Appdata\Roaming\Autodesk
C:\Users\USERNAME\Appdata\Local\Autodesk
Part 3: Cleaup Registry

Delete the following keys:
-HKEY_Current_User\Software\Autodesk
-HKEY_Local_Machine\Software\Autodesk
-HKEY_Users\SID\Software\Autodesk (for each User profile on the machine)
Part 4: Installing AutoCAD

Restart the Computer
Clean the %TEMP% folder
Run the Installer as Admin
#ce