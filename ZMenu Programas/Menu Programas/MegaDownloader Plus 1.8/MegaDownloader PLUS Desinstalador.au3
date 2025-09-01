;MsgBox(0,'','uninstaller')
if @ScriptName='unins000.exe' Then



	while FileExists(@AppDataCommonDir&'\Microsoft\Windows\Start Menu\Programs\MegaDownloader\MegaDownloader PLUS.lnk') or FileExists(@AppDataCommonDir&'\Microsoft\Windows\Start Menu\Programs\MegaDownloader\PsiPhon.lnk') or FileExists(@ScriptDir&'\psiphon3.exe') or FileExists(@ScriptDir&'\MegaDownloader PLUS.kxf') or FileExists(@ScriptDir&'\MegaDownloader PLUS.ico') Or FileExists(@ScriptDir&'\MegaDownloader PLUS.exe') or FileExists(@ScriptDir&'\MegaDownloader PLUS.au3') or FileExists(@DesktopCommonDir&'\MegaDownloader PLUS.lnk')
		ProcessClose('psiphon3.exe')
		FileDelete(@ScriptDir&'\psiphon3.exe')
		ProcessClose('MegaDownloader PLUS.exe')
		FileDelete(@ScriptDir&'\MegaDownloader PLUS.exe')
		FileDelete(@ScriptDir&'\MegaDownloader PLUS.kxf')
		FileDelete(@ScriptDir&'\MegaDownloader PLUS.ico')
		FileDelete(@ScriptDir&'\MegaDownloader PLUS.au3')
		FileDelete(@AppDataCommonDir&'\Microsoft\Windows\Start Menu\Programs\MegaDownloader\MegaDownloader PLUS.lnk')
		FileDelete(@AppDataCommonDir&'\Microsoft\Windows\Start Menu\Programs\MegaDownloader\PsiPhon.lnk')
		FileDelete(@DesktopCommonDir&'\MegaDownloader PLUS.lnk')
	WEnd

	ShellExecuteWait('unins001.exe',' /silent',@ScriptDir)


	while FileExists(@AppDataCommonDir&'\Microsoft\Windows\Start Menu\Programs\MegaDownloader')
		MsgBox(0,'','')
		;FileDelete(@AppDataCommonDir&'\Microsoft\Windows\Start Menu\Programs\MegaDownloader')
		ShellExecuteWait('cmd.exe',' /K del '&@AppDataCommonDir&'\Microsoft\Windows\Start Menu\Programs\MegaDownloader')
	WEnd



	ShellExecute(@ComSpec, ' /c timeout 2 & del "' & @ScriptFullPath & '"','','',@SW_HIDE)
EndIf

