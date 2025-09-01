While fileexists (@ProgramFilesDir&'\AutoCAD') or fileexists (@ProgramFilesDir&'\AutoCAD 2009') or fileexists (@ProgramFilesDir&'\Autodesk') or fileexists (@ProgramFilesDir&'\Common Files\Autodesk Shared') or fileexists (@ProgramFilesDir&'\Common Files\Autodesk')
;~ 	MsgBox(0,'','1')
	dirremove (@ProgramFilesDir&'\AutoCAD',1)
	dirremove (@ProgramFilesDir&'\AutoCAD 2009',1)
	dirremove (@ProgramFilesDir&'\Autodesk',1)
	dirremove (@ProgramFilesDir&'\Common Files\Autodesk Shared',1)
	dirremove (@ProgramFilesDir&'\Common Files\Autodesk',1)
WEnd

if @OSArch<>'WIN_XP' Then
	While fileexists (@AppDataDir&'\Autodesk') or fileexists (@UserProfileDir&'\AppData\Local\Autodesk') or fileexists (@DocumentsCommonDir&'\Autodesk') or fileexists (@AppDataCommonDir&'\Autodesk')
;~ 		MsgBox(0,'','2')
		dirremove (@AppDataDir&'\Autodesk',1)
		dirremove (@UserProfileDir&'\AppData\Local\Autodesk',1)
		dirremove (@DocumentsCommonDir&'\Autodesk',1)
		dirremove (@AppDataCommonDir&'\Autodesk',1)
	WEnd
EndIf
if @OSArch='WIN_XP' Then MsgBox(0,'','estoy en xp, verificar')

while '' <> RegEnumKey("HKEY_CURRENT_USER\Software\Autodesk", 1)
;~ 	MsgBox(0,'','3')
	RegDelete('HKEY_CURRENT_USER\Software\Autodesk')
WEnd

while '' <> RegEnumKey("HKEY_LOCAL_MACHINE\Software\Autodesk", 1)
;~ 	MsgBox(0,'','4')
	RegDelete("HKEY_LOCAL_MACHINE\Software\Autodesk")
WEnd


$exit=0
While $exit=0
;~ 	MsgBox(0,'','5')
	$exit=1
	$prod=''
	for $i=1 to 300 Step 1
		$prod=RegEnumKey("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products", $i)
		for $j=1 to 100 Step 1
			$val=RegEnumVal("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\"&$prod, $j)
			$dir="HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\"&$prod&'\'&$val
			If 0 <> StringInStr(RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\"&$prod,$val),'AutoCAD') Then
;~ 				MsgBox(0,'',"HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\"&$prod)
				$1=RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Installer\Products\"&$prod)
;~ 				MsgBox(0,'','reg: '&$1)
				$exit=0
			EndIf
		Next
	Next
WEnd

