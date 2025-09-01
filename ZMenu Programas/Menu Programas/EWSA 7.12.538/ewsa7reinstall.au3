#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=ewsa_128.ico
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****






$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)





uninstall()
install()
if WinExists('Elcomsoft Updater') then WinSetState('Elcomsoft Updater','',@SW_HIDE)

accesodirecto()
correr()


func accesodirecto()
	if FileExists($ProgramFilesDir &'\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor\ewsa7reinstall.exe') then
		FileCreateShortcut($ProgramFilesDir &'\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor\ewsa7reinstall.exe',@StartMenuCommonDir&'\Elcomsoft Wireless Security Auditor 7 REINSTALAR.lnk',$ProgramFilesDir &'\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor')

	elseif FileExists($ProgramFilesDir &' (x86)\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor\ewsa7reinstall.exe') then
		FileCreateShortcut($ProgramFilesDir &' (x86)\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor\ewsa7reinstall.exe',@StartMenuCommonDir&'\Elcomsoft Wireless Security Auditor 7 REINSTALAR.lnk',$ProgramFilesDir &' (x86)\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor')

	Else
		MsgBox(0,'EWSA 7','Fallo al crear acceso directo. cerrando')
		Exit
	EndIf

EndFunc

func correr()
	if FileExists($ProgramFilesDir &'\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor\ewsa.exe') then
		ShellExecute($ProgramFilesDir &'\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor\ewsa.exe')

	elseif FileExists($ProgramFilesDir &' (x86)\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor\ewsa.exe') then
		ShellExecute($ProgramFilesDir &' (x86)\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor\ewsa.exe')

	Else
		MsgBox(0,'EWSA 7','Fallo al ejecutar. cerrando')
		Exit
	EndIf
EndFunc

func uninstall()
	do
		ProcessClose('ewsa.exe')
	Until not ProcessExists('ewsa.exe')

	RunWait('msiexec.exe /x {88FEA856-8601-4F99-9588-A23DB1F016C8} /qn')

EndFunc

func install()
	unrar()
	if FileExists('setup.msi') and FileExists('wtsapi32.dll') then
		RunWait('msiexec.exe /i "Setup.msi" /qn')

		if FileExists($ProgramFilesDir &'\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor\ewsa.exe') then
			FileCopy('wtsapi32.dll',$ProgramFilesDir &'\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor\wtsapi32.dll',1)
			FileCopy('crack pass 123.rar',$ProgramFilesDir &'\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor\crack pass 123.rar',1)
			FileCopy('rarreg.key',$ProgramFilesDir &'\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor\rarreg.key',1)
			FileCopy('Setup.msi',$ProgramFilesDir &'\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor\Setup.msi',1)
			FileCopy('UnRAR.exe',$ProgramFilesDir &'\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor\UnRAR.exe',1)
			FileCopy('ewsa7reinstall.exe',$ProgramFilesDir &'\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor\ewsa7reinstall.exe',1)
		elseif FileExists($ProgramFilesDir &' (x86)\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor\ewsa.exe') then
			FileCopy('wtsapi32.dll',$ProgramFilesDir &' (x86)\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor\wtsapi32.dll')
			FileCopy('crack pass 123.rar',$ProgramFilesDir &' (x86)\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor\crack pass 123.rar')
			FileCopy('rarreg.key',$ProgramFilesDir &' (x86)\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor\rarreg.key')
			FileCopy('Setup.msi',$ProgramFilesDir &' (x86)\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor\Setup.msi')
			FileCopy('UnRAR.exe',$ProgramFilesDir &' (x86)\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor\UnRAR.exe')
			FileCopy('ewsa7reinstall.exe',$ProgramFilesDir &' (x86)\Elcomsoft Password Recovery\Elcomsoft Wireless Security Auditor\ewsa7reinstall.exe')
		Else
			MsgBox(0,'EWSA 7','Fallo al copiar crack. cerrando')
			Exit
		EndIf

	Else
		MsgBox(0,'EWSA 7','No encontre ejecutable o crack. cerrando')
		Exit
	EndIf




EndFunc


func unrar()
	ShellExecuteWait('cmd','/c UnRAR.exe e -p123 -y "crack pass 123.rar"')
	while not FileExists ('wtsapi32.dll')
		MsgBox(0,'Antivirus activo','Desactive el antivirus y presiones OK para poder extraer wtsapi32.dll')
		sleep(500)
		unrar()
	WEnd
EndFunc
