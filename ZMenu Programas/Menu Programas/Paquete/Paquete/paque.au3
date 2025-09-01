#RequireAdmin
#include <Misc.au3>
#include <Date.au3>
#include <File.au3>
#include <WinAPIShellEx.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Icon.ico
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

$zafar=0

if FileExists('nopassday.txt') Then
	$tTime = _Date_Time_GetSystemTime()
	$aTime = _Date_Time_SystemTimeToArray($tTime)
	$time=$aTime[1]&'/'&$aTime[0]&'/'&$aTime[2]
	if FileReadLine('nopassday.txt',1)<>$time Then
		FileClose('nopassday.txt')
		Do
			FileDelete('nopassday.txt')
		until not FileExists('nopassday.txt')
	Else
		$zafar=1
	EndIf
EndIf

if not FileExists(@scriptdir&'\nopass') and not FileExists(@scriptdir&'\nopass.txt') and $zafar=0 then
	$pass=InputBox(' ',' ','','*',30,20)
	if $pass <> '33611257' then Exit
	$tTime = _Date_Time_GetSystemTime()
	$aTime = _Date_Time_SystemTimeToArray($tTime)
	FileWriteLine('nopassday.txt',$aTime[1]&'/'&$aTime[0]&'/'&$aTime[2])
	FileClose('nopassday.txt')
EndIf










#Region ### START Koda GUI section ### Form=Paque.kxf
$Paquete = GUICreate("Paquete", 236, 505, 234, 129)
$Button1 = GUICtrlCreateButton("Crystal Disk Info", 16, 16, 90, 25)
$Button2 = GUICtrlCreateButton("Hdd", 16, 48, 26, 25)
$Button3 = GUICtrlCreateButton("Vir lnk", 16, 112, 42, 25)
$Button4 = GUICtrlCreateButton("Reg Seeker", 16, 144, 90, 25)
$Button5 = GUICtrlCreateButton("Purefix NOD", 16, 176, 90, 25)
$Button6 = GUICtrlCreateButton("UnChkDisk", 16, 208, 66, 25)
$Button7 = GUICtrlCreateButton("Detect Hardware", 16, 240, 90, 25)
$Button8 = GUICtrlCreateButton("HI", 16, 272, 19, 25)
$Button9 = GUICtrlCreateButton("HD", 35, 272, 20, 25)
$Button10 = GUICtrlCreateButton("CPUZ", 16, 304, 34, 25)
$Button11 = GUICtrlCreateButton("M2", 16, 336, 26, 25)
$Button12 = GUICtrlCreateButton("M3", 48, 336, 26, 25)
$Button13 = GUICtrlCreateButton("M4", 80, 336, 26, 25)
$Button14 = GUICtrlCreateButton("Keyboard Tester", 16, 368, 90, 25)
$Button15 = GUICtrlCreateButton("HV", 55, 272, 19, 25)
$Button16 = GUICtrlCreateButton("Estado Bat", 16, 400, 58, 25)
$Button17 = GUICtrlCreateButton("USB Deview", 16, 432, 90, 25)
$Button18 = GUICtrlCreateButton("Dir", 80, 400, 26, 25)
$Checkbox1 = GUICtrlCreateCheckbox("", 92, 213, 17, 17)
$Button19 = GUICtrlCreateButton("Calc", 79, 48, 27, 25)
$Button20 = GUICtrlCreateButton("Part Wiz", 16, 80, 58, 25)
$Button21 = GUICtrlCreateButton("Corregir Extens.", 16, 464, 90, 25)
$Group1 = GUICtrlCreateGroup("", 112, 11, 9, 478)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button22 = GUICtrlCreateButton("DIR", 128, 16, 34, 25)
$Button23 = GUICtrlCreateButton("USSF", 184, 16, 34, 25)
$Button24 = GUICtrlCreateButton("SpaceSniffer", 128, 80, 90, 25)
$Button25 = GUICtrlCreateButton("FDM", 128, 112, 34, 25)
$Button29 = GUICtrlCreateButton("DoubleDriver", 128, 208, 90, 25)
$Button30 = GUICtrlCreateButton("Windows.old", 128, 240, 90, 25)
$Button31 = GUICtrlCreateButton("Hasher", 128, 272, 42, 25)
$Button32 = GUICtrlCreateButton("Ap-Re-Su-Hi", 128, 304, 90, 25)
$Button33 = GUICtrlCreateButton("VHD", 79, 80, 27, 25)
$Button34 = GUICtrlCreateButton("T.Own", 128, 336, 42, 25)
$Button35 = GUICtrlCreateButton("Des", 184, 336, 34, 25)
$Button36 = GUICtrlCreateButton("Script", 128, 368, 34, 25)
$Button38 = GUICtrlCreateButton("Uninst", 128, 48, 42, 25)
$Button39 = GUICtrlCreateButton("Re FDM", 168, 112, 50, 25)
$Button40 = GUICtrlCreateButton("Icon", 184, 48, 34, 25)
$Button41 = GUICtrlCreateButton("DiskFill", 176, 400, 42, 25)
$Button42 = GUICtrlCreateButton("Torrent", 128, 432, 50, 25)
$Checkbox2 = GUICtrlCreateCheckbox("H", 188, 437, 33, 17)
$Button43 = GUICtrlCreateButton("D Directa", 128, 464, 50, 25)
$Checkbox3 = GUICtrlCreateCheckbox("H", 188, 469, 33, 17)
$Button44 = GUICtrlCreateButton("Reg", 41, 48, 26, 25)
$InputHalted = GUICtrlCreateInput("", 78, 277, 27, 21)
$Group2 = GUICtrlCreateGroup("", 128, 138, 89, 64)
$Button26 = GUICtrlCreateButton("BUp", 129, 145, 34, 25)
$Input1 = GUICtrlCreateInput("", 171, 146, 41, 21)
$Button27 = GUICtrlCreateButton("B-Clean", 129, 175, 42, 25)
$Button28 = GUICtrlCreateButton("Winver", 175, 175, 41, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button45 = GUICtrlCreateButton("ErrMen", 64, 112, 43, 25)
$Button46 = GUICtrlCreateButton("SysExpl", 128, 400, 42, 25)
$Button47 = GUICtrlCreateButton("A Twin", 176, 272, 43, 25)
$Button48 = GUICtrlCreateButton("Impres", 56, 304, 51, 25)
$Button37 = GUICtrlCreateButton("WinPass", 168, 368, 50, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Unicavez()

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			CrystalDiskInfo()
		Case $Button2
			HDDREGENERATOR()
		Case $Button3
			;ShellExecute('HDDScan-3.3\HDDScan.exe')
			RemoverVirusAccesosDirectos()
		Case $Button4
			ShellExecute('RegSeeker.exe','','RegSeeker')
		Case $Button5
			unrar()
			;MsgBox(0,'','')
			ShellExecute('Purefix NOD\ESET PureFix v2.03.exe')
		Case $Button6
			unchkdsk()
		Case $Button7
			Detectarhardware()
		Case $Button8
			HaltedInst()
		Case $InputHalted
			if IsInt(GUICtrlRead($InputHalted)) then;or GUICtrlRead($InputHalted)>6 then
				MsgBox(0,'','Halted hasta 6')
				GUICtrlSetData($InputHalted,Random(1,6,1))
			EndIf
		Case $Button9
			HaltedDesInst()
		Case $Button15
			HaltedVerif()
		Case $Button10
			CPUZ()
		Case $Button11
			MemoriaDDR2()
		Case $Button12
			MemoriaDDR3()
		Case $Button13
			MemoriaDDR4()
		Case $Button14
			KeyboardTester()
		Case $Button16
			EstadoBateria()
		Case $Button17
			Usbdeview()
		Case $Button18
			DirEstadoBat()
		Case $Button19
			SectorHDDDisco()
		Case $Button20
		;	PartitionResizer()
		;	Easeus()
			PartitionWizard()
		Case $Button21
			extensiones()
		Case $Button22
			dir()
		Case $Button23
			$ussf=ussf()
		Case $Button24
			SpaceSniffer()
		Case $Button25
			FDM()
		Case $Button39
			FDMReinstall()
		Case $Button26
			BackUpSel()
		Case $Button27
			BupClean()
		Case $Button28
			Winversion()
		Case $Button29
			DoubleDriver()
		Case $Button30
			windowsold()
		Case $Button31
			hasher()
		Case $Button32
			ApagarReiniciarSuspenderHibernar()
		Case $Button33
			ShellExecute('VHD Launch.exe','','Resources')
;~			VHD()
;~			EaseUS()
		Case $Button34
			TakeOwn()
		Case $Button35
			TakeOwnDes()
		Case $Button36
			Scripts()
		Case $Button38
			uninstallview()
		Case $Button40
			Iconsext()
		Case $Button41
			DiskFill()
		Case $Button42
			torrent()
		Case $Button43
			DescDirecta()
		Case $Button44
			HDDREGENERATOR2011()
		Case $Button45
			errormenu()
		Case $Button46
			SystemExplorer()
		Case $Button47
			ATwin()
		Case $Button48
			Impresoras()
		Case $Button37
			winpassword()

	EndSwitch
WEnd

func Unicavez()
	;mover
	WinMove($Paquete,'',200,0)

	;borrar ultimo item menu ejecutar
	for $i=97 to 122 step 1
		if Chr($i)=StringLeft(RegRead('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU','MRUList'),1) Then
			RegDelete('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU',Chr($i))
		EndIf
	Next
	GUICtrlSetData($InputHalted,Random(1,6,1))

EndFunc

func CrystalDiskInfo()
	if @OSArch='x86' then ShellExecute('CrystalDiskInfo6_5_2\DiskInfo.exe')
	if @OSArch='x64' then ShellExecute('CrystalDiskInfo6_5_2\DiskInfoX64.exe')
EndFunc

Func KeyboardTester()
	ShellExecute('solo test')
	ShellExecute('"keyboardtestutility.exe"',"", "keyboard tester copado")
EndFunc


func HDDREGENERATOR()
	Run('HDD Regenerator\HDD Regenerator.exe','HDD Regenerator')

	Do
		Sleep(200)
	Until WinExists('HDD Regenerator 1.71') or WinExists('HDD Regenerator 1.71','Unregistered')
	if WinExists('HDD Regenerator 1.71','Unregistered') then

		IF 2=MsgBox(1,'Revisar codigo','Desea revisar codigo o hacer snapshots con system explorer?'&@CRLF&'OK -> Continua'&@CRLF&'CANCEL -> Cancela') then Return
		SplashTextOn('Espere','Registrando HddReg. Espere...',190,80,0,0)
;~ 		MsgBox(0,'','registrar')
		Do
			WinActivate("HDD Regenerator 1.71")
			send ("{altdown}{f}{s}{altup}")
			$exit=0
			Do
				$exit=$exit+1
				Sleep(100)
			Until WinExists("About",'Registration') or $exit>20
		Until WinExists("About",'Registration')

		Do

			WinActivate("About",'Registration')
			WinWaitActive("About",'Registration')
			While ControlGetText("About", "", "TEdit2") <> 'Peter Zuma'
				ControlSetText("About", "", "TEdit2","Peter Zuma",1)
				Sleep(100)
			WEnd
			While ControlGetText("About", "", "TEdit1") <> "019VTT-5GYM6H-JX9V4R-Y271AX-6RX5DT-J0J0WN-XKPZ0J-2DQUX8-NYMNTQ-4WX97E"
				ControlClick("About", "", "TEdit1")
				ControlClick("About", "UNREGISTERED", "TEdit1")
				ControlSetText("About", "", "TEdit1","019VTT-5GYM6H-JX9V4R-Y271AX-6RX5DT-J0J0WN-XKPZ0J-2DQUX8-NYMNTQ-4WX97E",1)
				Sleep(100)
			WEnd

		Until ControlGetText("About", "", "TEdit2") = 'Peter Zuma' and ControlGetText("About", "", "TEdit1") = "019VTT-5GYM6H-JX9V4R-Y271AX-6RX5DT-J0J0WN-XKPZ0J-2DQUX8-NYMNTQ-4WX97E"






;DESACTIVAR ESTO PARA QUE REGISTRE PERO ANTER PREPARARSE PARA VER COMO CERRAR LA VENTANA INFORMATION

MsgBox(0,'','cerrar y ve codigo para ver como sigue')
Exit



		;ESTO ESTA OK ------------------------------------
		do
			ControlClick("About", "OK", "TButton2")
			$exit=0
			Do
				$exit=$exit+1
				Sleep(100)
			Until not WinExists("About",'Registration') or $exit>20
		Until not WinExists('About','Registration')

		winwait('Information','Thank you for registering HDD Regenerator')
		;HASTA ACA ESTA OK VERO COMO SIGUE ------------------------------------

		;aca ver como es la ventana anterior para cerrarla







		SplashOff()
	EndIf
EndFunc

Func CPUZ()
	if @OSArch='X86' Then ShellExecute('"cpuz_x32.exe"',"", "CPUZ")
	if @OSArch<>'X86' Then ShellExecute('"cpuz_x64.exe"',"", "CPUZ")
EndFunc

Func winpassword()
	if @OSArch='X86' Then ShellExecute('"WLU_x86.exe"',"", 'Windows Login Unlocker v2.0 Pro')
	if @OSArch<>'X86' Then ShellExecute('"WLU_x64.exe"',"", 'Windows Login Unlocker v2.0 Pro')
EndFunc

Func MemoriaDDR2()
	SplashImageOn('DDR 2','CPUZ/DDR2.jpg',787,469,'','',2)
	MsgBox(0,'','Presiones Ok para cerrar')
	SplashOff()
EndFunc

Func MemoriaDDR3()
	SplashImageOn('DDR 3','CPUZ/DDR3.jpg',784,515,'','',2)
	MsgBox(0,'','Presiones Ok para cerrar')
	SplashOff()
EndFunc

Func MemoriaDDR4()
	SplashImageOn('DDR 4','CPUZ/DDR4.jpg',786,329,'','',2)
	MsgBox(0,'','Presiones Ok para cerrar')
	SplashOff()
EndFunc

Func HaltedInst()
	ShellExecuteWait('"Sistema Caido.exe"',"/OCULTO "&GUICtrlRead($InputHalted), "Halted")
EndFunc
Func HaltedDesInst()
	ShellExecuteWait('Deshalted.exe',"", "Halted")
EndFunc
Func HaltedVerif()
	ShellExecuteWait('Verif.exe',"", "Halted")
EndFunc

func unrar()
	ShellExecuteWait('UnRAR.exe',' e -p123 -y Purefix.rar','Purefix NOD')
	while not FileExists ('Purefix NOD\ESET PureFix v2.03.exe')
		MsgBox(0,'Antivirus activo','Desactive el antivirus y presiones OK para poder extraer Purefix')
		sleep(500)
		unrar()
	WEnd
EndFunc

func unchkdsk()
	if GUICtrlRead($Checkbox1)=1 then
		$check1=1
	Else
		$check1=0
	EndIf

	if $Check1=0 then
;~ 		$1=ShellExecute('cmd.exe',' /k chkntfs /x a:')		;FORMA VIEJA QUE FUNCIONABA
;~ 		ProcessClose($1)

		$1=ShellExecuteWait('cmd.exe',' /c chkntfs /x a:')
		$2=ShellExecuteWait('cmd.exe',' /c chkntfs /x b:')
		$3=ShellExecuteWait('cmd.exe',' /c chkntfs /x c:')
		$4=ShellExecuteWait('cmd.exe',' /c chkntfs /x d:')
		$5=ShellExecuteWait('cmd.exe',' /c chkntfs /x e:')
		$6=ShellExecuteWait('cmd.exe',' /c chkntfs /x f:')
		$7=ShellExecuteWait('cmd.exe',' /c chkntfs /x g:')
		$8=ShellExecuteWait('cmd.exe',' /c chkntfs /x h:')
		$9=ShellExecuteWait('cmd.exe',' /c chkntfs /x i:')
		$10=ShellExecuteWait('cmd.exe',' /c chkntfs /x j:')
		$11=ShellExecuteWait('cmd.exe',' /c chkntfs /x k:')
		$12=ShellExecuteWait('cmd.exe',' /c chkntfs /x l:')
		$13=ShellExecuteWait('cmd.exe',' /c chkntfs /x m:')
		$14=ShellExecuteWait('cmd.exe',' /c chkntfs /x n:')
		$15=ShellExecuteWait('cmd.exe',' /c chkntfs /x o:')
		$16=ShellExecuteWait('cmd.exe',' /c chkntfs /x p:')
		$17=ShellExecuteWait('cmd.exe',' /c chkntfs /x q:')
		$18=ShellExecuteWait('cmd.exe',' /c chkntfs /x r:')
		$19=ShellExecuteWait('cmd.exe',' /c chkntfs /x s:')
		$20=ShellExecuteWait('cmd.exe',' /c chkntfs /x t:')
		$21=ShellExecuteWait('cmd.exe',' /c chkntfs /x u:')
		$22=ShellExecuteWait('cmd.exe',' /c chkntfs /x v:')
		$23=ShellExecuteWait('cmd.exe',' /c chkntfs /x w:')
		$24=ShellExecuteWait('cmd.exe',' /c chkntfs /x x:')
		$25=ShellExecuteWait('cmd.exe',' /c chkntfs /x y:')
		$26=ShellExecuteWait('cmd.exe',' /c chkntfs /x z:')
	Else
		$1=ShellExecute('cmd.exe',' /k chkntfs /x a:')
		$2=ShellExecute('cmd.exe',' /k chkntfs /x b:')
		$3=ShellExecute('cmd.exe',' /k chkntfs /x c:')
		$4=ShellExecute('cmd.exe',' /k chkntfs /x d:')
		$5=ShellExecute('cmd.exe',' /k chkntfs /x e:')
		$6=ShellExecute('cmd.exe',' /k chkntfs /x f:')
		$7=ShellExecute('cmd.exe',' /k chkntfs /x g:')
		$8=ShellExecute('cmd.exe',' /k chkntfs /x h:')
		$9=ShellExecute('cmd.exe',' /k chkntfs /x i:')
		$10=ShellExecute('cmd.exe',' /k chkntfs /x j:')
		$11=ShellExecute('cmd.exe',' /k chkntfs /x k:')
		$12=ShellExecute('cmd.exe',' /k chkntfs /x l:')
		$13=ShellExecute('cmd.exe',' /k chkntfs /x m:')
		$14=ShellExecute('cmd.exe',' /k chkntfs /x n:')
		$15=ShellExecute('cmd.exe',' /k chkntfs /x o:')
		$16=ShellExecute('cmd.exe',' /k chkntfs /x p:')
		$17=ShellExecute('cmd.exe',' /k chkntfs /x q:')
		$18=ShellExecute('cmd.exe',' /k chkntfs /x r:')
		$19=ShellExecute('cmd.exe',' /k chkntfs /x s:')
		$20=ShellExecute('cmd.exe',' /k chkntfs /x t:')
		$21=ShellExecute('cmd.exe',' /k chkntfs /x u:')
		$22=ShellExecute('cmd.exe',' /k chkntfs /x v:')
		$23=ShellExecute('cmd.exe',' /k chkntfs /x w:')
		$24=ShellExecute('cmd.exe',' /k chkntfs /x x:')
		$25=ShellExecute('cmd.exe',' /k chkntfs /x y:')
		$26=ShellExecute('cmd.exe',' /k chkntfs /x z:')
	EndIf
EndFunc

Func Detectarhardware()
	ShellExecuteWait('Cmd.exe',' /k devcon.exe rescan','devcon')
EndFunc

Func EstadoBateria()
	ShellExecute('"Estado Bateria.exe"','','Estado Bateria')
EndFunc

Func Usbdeview()
	if @OSArch='X86' Then ShellExecute('"USBDeview.exe"',"", 'Usb Deview\usbdeview')
	if @OSArch<>'X86' Then ShellExecute('"USBDeview.exe"',"", "Usb Deview\usbdeview-x64")
EndFunc

Func DirEstadoBat()
	ShellExecute(@WindowsDir &'\Paquete\Estado Bateria')
EndFunc

Func SectorHDDDisco()
	ShellExecute('"Sector Hdd Disco.exe"','','Sector Hdd Disco')
EndFunc

Func PartitionResizer()
	if @OSArch='x86' then ShellExecute('"dm.resizer.exe"','','IM-Magic Partition Resizer x86')
	if @OSArch<>'x86' then ShellExecute('"dm.resizer.exe"','','IM-Magic Partition Resizer x64')
;~ 	D84BEE4C57D176ADB98B81B72A0430170C3CE1
;~ 18082D0A191F053C0A5ACE659F9F8DB86AC266
;~ 311336031E1A3EE570F0270D77B764C37FA98C
;~ 5BC56BC8DB5CC060F649FF36AC82AE998AA287
EndFunc

func PartitionWizard()
	ShellExecute('MiniToolPartitionWizardPortable.exe','','MiniTool Partition Wizard 12 Portable')
EndFunc

Func EaseUS()
;~ 	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\EASEUS\EPM','Language','REG_SZ','Spanish')
;~ 	MsgBox(0,'','toy')
	if WinExists('EaseUS Partition Master Professional Edition') then
		WinActivate('EaseUS Partition Master Professional Edition')
	ElseIf not WinExists('EaseUS Partition Master Professional Edition') and not ProcessExists('epm0.exe') and not ProcessExists('main.exe') then
;~ 		ShellExecute('"PartitionMasterPortable.exe"','','EASEUS Partition Master 12.0 Portable')
		ShellExecute('"EaseUSPartitionMasterPortable.exe"','','EASEUSPartitionMasterPortable')
		WinWait('EaseUS Partition Master Professional Edition','EaseUS Partition Master Portable did not close properly',4)
		if WinExists('EaseUS Partition Master Professional Edition','EaseUS Partition Master Portable did not close properly') then
			WinClose('EaseUS Partition Master Professional Edition','EaseUS Partition Master Portable did not close properly')
			EaseUS()
			Return
		EndIf
	ElseIf not WinExists('EaseUS Partition Master Professional Edition') and (ProcessExists('epm0.exe') or ProcessExists('main.exe')) then
		MsgBox(0,'Paquete','Easeus corriendo de fondo. Espere',2)
		EaseUS()
		Return
	EndIf

EndFunc

Func extensiones()
	ShellExecute('"Extensiones.exe"','','Extensiones')
EndFunc

Func dir()
	ShellExecute(@ScriptDir)
EndFunc

Func ussf()
	WinSetState($Paquete, "", @SW_MINIMIZE)
	ShellExecute('"SilentInstallSwitch.exe"','','Silent Install Switch')
EndFunc

Func SpaceSniffer()
	ShellExecute('"SpaceSniffer.exe"',"", "SpaceSniffer")
EndFunc

Func FDM()
	SplashTextOn('FDM','Lanzando FDM',200,50)
	DirCopy('fdmportable',@TempDir&'\fdmportable',0)
	SplashOff()
	ShellExecute('"fdm.exe"',"", @TempDir&'\fdmportable\Free Download Manager')
EndFunc

Func FDMReinstall()
	SplashTextOn('FDM','Lanzando FDM',200,50)
	DirCopy('fdmportable',@TempDir&'\fdmportable',1)
	SplashOff()
	ShellExecute('"fdm.exe"',"", @TempDir&'\fdmportable\Free Download Manager')
EndFunc

Func BackUpSel()
	local $aList[9]
; 	E:\Users\Usuario
	$dirbkup=GUICtrlRead($Input1)
	if $dirbkup='' then $dirbkup=@UserProfileDir
		;return
MsgBox(0,'',FileGetAttrib($dirbkup))

;if StringRight($dirbkup,1)=':' and FileExists($dirbkup&'\Users') then $dirbkup=$dirbkup&'\Users'
	if StringInStr(FileGetAttrib($dirbkup),'D') then
		$aList[1] = 'Downloads'
		$aList[2] = 'Desktop'
		$aList[3] = 'Documents'
		$aList[4] = 'Music'
		$aList[5] = 'Pictures'
		$aList[6] = 'Videos'
		$aList[7] = 'OneDrive'

		_WinAPI_ShellOpenFolderAndSelectItems($dirbkup, $aList, 1)
	Else
		MsgBox(0,'','No es un directorio: '&$dirbkup)
		;MsgBox(0,'',FileGetAttrib($dirbkup))
	EndIf
EndFunc

Func BupClean()
	$dir=GUICtrlRead($Input1)
;	MsgBox(0,'',StringInStr(FileGetAttrib ($dir),'D'))
;	MsgBox(0,'',FileGetAttrib ($dir))
	$attrib=FileGetAttrib ($dir)
;	if $attrib <> 'D' and $attrib <> 'RD' then
	if not StringInStr(FileGetAttrib ($dir),'D') then
		MsgBox(0,'Bup Clean','La ruta no es un directorio')
		Return
	EndIf
	if $dir <> (@HomeDrive&'\Bup') And $dir <> (@HomeDrive&'\Bup\') then
		if 6<>MsgBox(4,'Bup Clean','La ruta no es "'&@HomeDrive&'\Bup". Continuar?') then Return
	EndIf
	Global $lista[2]

	$lista=_FileListToArrayrec($dir,'*.lnk',1,1,'',2)	;BORRAR *.lnk
	if UBound($lista) <> 0 then
		for $i=1 to UBound($lista)-1 step 1
	;		MsgBox(0,'',$lista[$i])
			FileDelete($lista[$i])
		Next
	EndIf

	$lista=_FileListToArrayrec($dir,'desktop.ini',1,1,'',2)	;BORRAR desktop.ini
	if UBound($lista) <> 0 then
		for $i=1 to UBound($lista)-1 step 1
			;MsgBox(0,'',$lista[$i])
			FileDelete($lista[$i])
		Next
	EndIf

	$lista=_FileListToArrayrec($dir,'*',2,1,'',2)	;BORRAR directorios vacios
	if UBound($lista) <> 0 then
		for $i=1 to UBound($lista)-1 step 1
			if DirGetSize($lista[$i]) = 0 then
				;MsgBox(0,'',$lista[$i])
				DirRemove($lista[$i],1)
			EndIf
		Next
	EndIf

	MsgBox(0,'Bup Clean','Listo!')
EndFunc

Func Winversion()

	$dir=StringLeft(GUICtrlRead($Input1),2)
	if $dir='' then ShellExecute('"keyfinder.exe"','','Magical Jelly Bean')
	if $dir='' then return

	if FileGetAttrib($dir&'\Windows')='D' then
		if StringUpper($dir)<>@HomeDrive then ShellExecute('"keyfinder.exe"',' /hive '&$dir&'\Windows','Magical Jelly Bean')

		if FileExists($dir&'\Windows\System32\license.rtf') then ShellExecute($dir&'\Windows\System32\license.rtf')
;		if FileExists($dir&'\Windows\System32\winver.exe') then ShellExecute($dir&'\Windows\System32\winver.exe')
		if FileExists($dir&'\Windows\System32\ntoskrnl.exe') then
			if StringLeft(FileGetVersion($dir&'\Windows\System32\ntoskrnl.exe'),3)='5.1' then MsgBox(0,'','Por versión es: 5.1 Windows XP')
			if StringLeft(FileGetVersion($dir&'\Windows\System32\ntoskrnl.exe'),3)='5.2' then MsgBox(0,'','Por versión es: 5.2 Windows 2003')
			if StringLeft(FileGetVersion($dir&'\Windows\System32\ntoskrnl.exe'),3)='6.0' then MsgBox(0,'','Por versión es: 6.0 Windows Vista')
			if StringLeft(FileGetVersion($dir&'\Windows\System32\ntoskrnl.exe'),3)='6.1' then MsgBox(0,'','Por versión es: 6.1 Windows 7')
			if StringLeft(FileGetVersion($dir&'\Windows\System32\ntoskrnl.exe'),3)='6.2' then MsgBox(0,'','Por versión es: 6.2 Windows 8')
			if StringLeft(FileGetVersion($dir&'\Windows\System32\ntoskrnl.exe'),3)='6.3' then MsgBox(0,'','Por versión es: 6.3 Windows 8.1')
			if StringLeft(FileGetVersion($dir&'\Windows\System32\ntoskrnl.exe'),3)<'5.1' or StringLeft(FileGetVersion($dir&'\Windows\System32\ntoskrnl.exe'),3)>'6.3' then MsgBox(0,'','windows 10, completar código')
		EndIf
	Else
		MsgBox(0,'','No es un directorio: '&$dir)
	EndIf

EndFunc

Func DoubleDriver()
;	ShellExecute('"dd.exe"',"", "Double Driver OFFLINE MINIPE")
	ShellExecute('"DoubleDriverLauncher.exe"',"", "Double Driver OFFLINE MINIPE")

EndFunc

Func windowsold()
	ShellExecute('"cleanmgr"')
EndFunc

Func hasher()
	ShellExecute('Hasher Launcher.exe','','hasher')
EndFunc

func ApagarReiniciarSuspenderHibernar()
	#include <ButtonConstants.au3>
	#include <GUIConstantsEx.au3>
	#include <WindowsConstants.au3>
	#Region ### START Koda GUI section ### Form=
	$ApagarReiniciar = GUICreate("Form1", 126, 152, 202, 141)
	$Button101 = GUICtrlCreateButton("Apagar", 24, 16, 75, 25)
	$Button102 = GUICtrlCreateButton("Reiniciar", 24, 48, 75, 25)
	$Button103 = GUICtrlCreateButton("Suspender", 24, 80, 75, 25)
	$Button104 = GUICtrlCreateButton("Hibernar", 24, 112, 75, 25)
	GUISetState(@SW_SHOW)
	#EndRegion ### END Koda GUI section ###

	While 1
		$nMsg = GUIGetMsg(1)
		Switch $nMsg[0]
			Case $GUI_EVENT_CLOSE
				Switch $nMsg[1]
					case $ApagarReiniciar
						GUISetState(@SW_HIDE,$ApagarReiniciar)
						ExitLoop

					Case $Paquete
						Exit
				EndSwitch
 			Case $Button101
 				if 6=MsgBox(4,'','Está seguro de APAGAR?') Then ShellExecute('shutdown',' -s -t 00')
 			Case $Button102
 				if 6=MsgBox(4,'','Está seguro de REINICIAR?') Then ShellExecute('shutdown',' -r -t 00')
 			Case $Button103
 				if 6=MsgBox(4,'','Está seguro de SUSPENDER?') Then ShellExecute('rundll32.exe',' powrprof.dll, SetSuspendState')
 			Case $Button104
 				if 6=MsgBox(4,'','Está seguro de HIBERNAR?'&@CRLF&'Si falla al hibernar es porque està desbloqueada por flasheo de BIOS (CREO)') Then ShellExecute('shutdown',' /h')

		EndSwitch
	WEnd

EndFunc

Func VHD()
;~ 	ShellExecute('LAUNCHER.exe','','vhd2disk')

	;desde aca bootice. es el que vá
	if @OSArch= 'x86' then ShellExecute('BOOTICEx86.exe','','BOOTICE')
	if @OSArch<>'x86' then ShellExecute('BOOTICEx64.exe','','BOOTICE')

	;~ ShellExecute('BOOTICEx86.exe','','Resources')

	$ventana='BOOTICE v1.3.3 x64 - by Pauly'
	if @OSArch='x86' then $ventana='BOOTICE v1.3.3 - by Pauly'
	;~ $ventana='BOOTICE v1.3.2 - by Pauly'

	WinWait($ventana)
	ControlClick($ventana,'','Button19')
	WinWait('Attach/Detach VHD/VHDX')
	ControlCommand('Attach/Detach VHD/VHDX','','Button3','Check','')


EndFunc

Func TakeOwn()
	ShellExecuteWait('ecmenu - agregar.exe','','ec menu (Take Ownership)')
	$rta=MsgBox(3,'Paquete','Instalado TakeOwn. Desea desinstalarlo?'&@CRLF&'Si -> Desinstalar'&@CRLF&'No -> Dejar'&@CRLF&'Cancelar -> Escribir TXT')
	if $rta=6 then
		TakeOwnDes()
	ElseIf $rta=2 then
		FileWrite(@DesktopDir&'\Takeown de paquete sin desinstalar.txt','')
	EndIf




EndFunc

Func TakeOwnDes()
	ShellExecuteWait('ecmenu - quitar.exe','','ec menu (Take Ownership)')
	FileDelete(@DesktopDir&'\Takeown de paquete sin desinstalar.txt')
	MsgBox(0,'Paquete','TakeOwn Desinstalado.')
EndFunc

func Scripts()
	#include <ButtonConstants.au3>
	#include <GUIConstantsEx.au3>
	#include <WindowsConstants.au3>
	#Region ### START Koda GUI section ### Form=
	global $scriptschild = GUICreate("Scripts", 126, 152, 202, 141)
	$Button101 = GUICtrlCreateButton("Comun", 24, 16, 75, 25)
	$Button102 = GUICtrlCreateButton("ElAmigos", 24, 48, 75, 25)
	$Button103 = GUICtrlCreateButton("MasterEga", 24, 80, 75, 25)
	$Button104 = GUICtrlCreateButton("Desinstalar", 24, 112, 75, 25)
	GUISetState(@SW_SHOW)
	#EndRegion ### END Koda GUI section ###

	While 1
		$nMsg = GUIGetMsg(1)
		Switch $nMsg[0]
			Case $GUI_EVENT_CLOSE
				Switch $nMsg[1]
					case $scriptschild
						GUISetState(@SW_HIDE,$scriptschild)
						ExitLoop
					Case $Paquete
						Exit
				EndSwitch
 			Case $Button101
				script('Comun.au3')
				ExitLoop
 			Case $Button102
				script('ElAmigos.au3')
				ExitLoop
 			Case $Button103
				script('MasterEga.au3')
				ExitLoop
 			Case $Button104
				script('Desinstalar.au3')
				ExitLoop
		EndSwitch
	WEnd
EndFunc

func script($au3)
	_ClipPutFile(FileGetLongName('Scripts\'&$au3,1))
	MsgBox(0,'Script Comun','Copiado al portapapeles',1)
	WinSetState($Paquete,'',@SW_MINIMIZE)
	GUISetState(@SW_HIDE,$scriptschild)
	;ExitLoop
EndFunc

;~ func ScriptParaDesinstalar()
;~ 	_ClipPutFile(FileGetLongName('Script\Desinstalar.au3',1))
;~ 	MsgBox(0,'Ejemplo Desinstalar','Copiado al portapapeles',1)
;~ EndFunc

Func uninstallview()
	if @OSArch= 'X86' Then ShellExecute('"UninstallView.exe"',"", 'uninstallview\uninstallview')
	if @OSArch<>'X86' Then ShellExecute('"UninstallView.exe"',"", 'uninstallview\uninstallview-x64')
EndFunc

Func Iconsext()
	WinSetState($Paquete, "", @SW_MINIMIZE)
	ShellExecute('"iconsext.exe"',"", 'iconsext')
EndFunc

Func DiskFill()
	ShellExecute('DiskFill.exe','','DiskFill')
EndFunc


func torrent()
	$incognito=''
	if GUICtrlRead($Checkbox2)=1 then $incognito='--Incognito '

	$busqueda=InputBox('Busqueda en torrent','Que desea buscar?','')
	$busqueda2=$busqueda
	$busquedaprimerletra=StringLeft($busqueda,1)
	$busquedaconguion=''
	$busquedaconmas=''
	$busquedaconporc20=''

	if $busqueda='' then Return
	Do
		if StringLeft($busqueda,1)<>' ' then
			$busquedaconmas=$busquedaconmas&StringLeft($busqueda,1)
			$busquedaconguion=$busquedaconguion&StringLeft($busqueda,1)
			$busquedaconporc20=$busquedaconporc20&StringLeft($busqueda,1)
		EndIf

		if StringLeft($busqueda,1)=' ' then $busquedaconmas=$busquedaconmas&'+'
		if StringLeft($busqueda,1)=' ' then $busquedaconguion=$busquedaconguion&'-'
		if StringLeft($busqueda,1)=' ' then $busquedaconporc20=$busquedaconporc20&'%20'
		$busqueda=StringTrimLeft($busqueda,1)
	until $busqueda=''



	ShellExecute('chrome',$incognito&'https://thepiratebay10.org/search/'&$busquedaconporc20&'/1/99/0')
	ShellExecute('chrome',$incognito&'https://1337x.to/search/'&$busquedaconmas&'/1/')
	ShellExecute('chrome',$incognito&'https://yts.mx/browse-movies/'&$busquedaconporc20&'/all/all/0/featured/0/all')
	ShellExecute('chrome',$incognito&'https://eztv.re/search/'&$busquedaconguion)
	ShellExecute('chrome',$incognito&'https://zooqle.com/search?q='&$busquedaconmas)
	ShellExecute('chrome',$incognito&'https://www.limetorrents.info/search/all/'&$busquedaconguion&'/')
	ShellExecute('chrome',$incognito&'https://torrentdownloads.info/search/?new=1&s_cat=0&search='&$busquedaconmas)
	ShellExecute('chrome',$incognito&'https://kickasstorrents.to/usearch/'&$busquedaconporc20&'/')
	ShellExecute('chrome',$incognito&'https://www.magnetdl.com/'&$busquedaprimerletra&'/'&$busquedaconguion&'/')
	ShellExecute('chrome',$incognito&'https://torrentz2.is/search?f='&$busquedaconmas)

	if 7=MsgBox(4,'Torrents','Continuar con los proximos torrents?') then Return

	ShellExecute('chrome',$incognito&'https://www.pirate-bay.net/search?q='&$busquedaconmas&'?q='&$busquedaconmas)
	ShellExecute('chrome',$incognito&'https://katcr.to/usearch/'&$busquedaconporc20&'/')
	ShellExecute('chrome',$incognito&'https://rarbggo.org/torrents.php?search='&$busquedaconmas)
	ShellExecute('chrome',$incognito&'https://www.torlock.com/all/torrents/'&$busquedaconguion&'.html?')
	ShellExecute('chrome',$incognito&'https://idope.se/torrent-list/'&$busquedaconporc20&'/')
	ShellExecute('chrome',$incognito&'https://www.gtdb.to/search_results.php?search='&$busquedaconmas&'&cat=0&incldead=0&inclexternal=0&lang=0&sort=id&order=desc')
	ShellExecute('chrome',$incognito&'https://torrentgalaxy.to/torrents.php?search='&$busquedaconmas&'#results')
	ShellExecute('chrome',$incognito&'https://www.torrentfunk.com/all/torrents/'&$busquedaconguion&'.html')
	ShellExecute('chrome',$incognito&'https://www.skytorrents.to/?search='&$busquedaconporc20)

	ClipPut($busqueda2)
	MsgBox(0,'','Copiado al portapapeles')
	ClipPut($busqueda2)
	ShellExecute('chrome',$incognito&'https://extratorrents.it/')

;~ 	ShellExecute('chrome','')
;~ 	ShellExecute('chrome','')
;~ 	ShellExecute('chrome','')
EndFunc


func DescDirecta()
	$incognito=''
	if GUICtrlRead($Checkbox3)=1 then $incognito='--Incognito '

	$busqueda=InputBox('Busqueda en descarga directa','Que desea buscar?','')
	$busqueda2=$busqueda
	$busquedaprimerletra=StringLeft($busqueda,1)
	$busquedaconguion=''
	$busquedaconmas=''
	$busquedaconporc20=''

	if $busqueda='' then Return
	Do
		if StringLeft($busqueda,1)<>' ' then
			$busquedaconmas=$busquedaconmas&StringLeft($busqueda,1)
			$busquedaconguion=$busquedaconguion&StringLeft($busqueda,1)
			$busquedaconporc20=$busquedaconporc20&StringLeft($busqueda,1)
		EndIf

		if StringLeft($busqueda,1)=' ' then $busquedaconmas=$busquedaconmas&'+'
		if StringLeft($busqueda,1)=' ' then $busquedaconguion=$busquedaconguion&'-'
		if StringLeft($busqueda,1)=' ' then $busquedaconporc20=$busquedaconporc20&'%20'
		$busqueda=StringTrimLeft($busqueda,1)
	until $busqueda=''



	ShellExecute('chrome',$incognito&'https://muacknet.ipower.com/?web=IV&q='&$busquedaconmas)
	ShellExecute('chrome',$incognito&'https://www.compucalitv.com/?s='&$busquedaconmas)
	ShellExecute('chrome',$incognito&'https://portableapps.com/search/node/'&$busquedaconporc20)
	ShellExecute('chrome',$incognito&'https://www.thenekodark.com/?s='&$busquedaconmas)



;~ 	ShellExecute('chrome',$incognito&'https://zooqle.com/search?q='&$busquedaconmas)
;~ 	ShellExecute('chrome',$incognito&'https://www.limetorrents.info/search/all/'&$busquedaconguion&'/')
;~ 	ShellExecute('chrome',$incognito&'https://torrentdownloads.info/search/?new=1&s_cat=0&search='&$busquedaconmas)
;~ 	ShellExecute('chrome',$incognito&'https://kickasstorrents.to/usearch/'&$busquedaconporc20&'/')
;~ 	ShellExecute('chrome',$incognito&'https://www.magnetdl.com/'&$busquedaprimerletra&'/'&$busquedaconguion&'/')
;~ 	ShellExecute('chrome',$incognito&'https://torrentz2.is/search?f='&$busquedaconmas)

;~ 	if 7=MsgBox(4,'Torrents','Continuar con los proximos torrents?') then Return

;~ 	ShellExecute('chrome',$incognito&'https://www.pirate-bay.net/search?q='&$busquedaconmas&'?q='&$busquedaconmas)
;~ 	ShellExecute('chrome',$incognito&'https://katcr.to/usearch/'&$busquedaconporc20&'/')
;~ 	ShellExecute('chrome',$incognito&'https://rarbggo.org/torrents.php?search='&$busquedaconmas)
;~ 	ShellExecute('chrome',$incognito&'https://www.torlock.com/all/torrents/'&$busquedaconguion&'.html?')
;~ 	ShellExecute('chrome',$incognito&'https://idope.se/torrent-list/'&$busquedaconporc20&'/')
;~ 	ShellExecute('chrome',$incognito&'https://www.gtdb.to/search_results.php?search='&$busquedaconmas&'&cat=0&incldead=0&inclexternal=0&lang=0&sort=id&order=desc')
;~ 	ShellExecute('chrome',$incognito&'https://torrentgalaxy.to/torrents.php?search='&$busquedaconmas&'#results')
;~ 	ShellExecute('chrome',$incognito&'https://www.torrentfunk.com/all/torrents/'&$busquedaconguion&'.html')
;~ 	ShellExecute('chrome',$incognito&'https://www.skytorrents.to/?search='&$busquedaconporc20)

	ClipPut($busqueda2)
	MsgBox(0,'','Copiado al portapapeles')
	ClipPut($busqueda2)
	ShellExecute('chrome',$incognito&'https://www.megawarez.org/')
	ShellExecute('chrome',$incognito&'https://www.appnee.com/')

;~ 	ShellExecute('chrome','')
;~ 	ShellExecute('chrome','')
;~ 	ShellExecute('chrome','')
EndFunc

func HDDREGENERATOR2011()
	ShellExecute('HDDREG Launcher.exe','','HDD Regenerator 2011 Portable')
EndFunc

func RemoverVirusAccesosDirectos()
	Do
		$letra=InputBox('Quitar Virus de Accesos','Ingrese solo la letra de unidad, sin ":" ni "\"')
		if $letra='' and 6=MsgBox(4,'Salir','Desea terminar el script?') then return
	until StringLen($letra)=1 and ((Asc($letra)>= 65 and Asc($letra)<= 90 ) or (Asc($letra)>= 97 and Asc($letra)<= 122))
	$letra = $letra&':\'
	if 7=MsgBox(4,'Unidad','La unidad es :'&$letra&'. Desea continuar?') then return

	ShellExecuteWait('cmd',' /C del "'&$letra&'*.lnk"','','',@SW_HIDE)
	ShellExecuteWait('cmd',' /C attrib -s - r -h "'&$letra&'*.*" /s /d /l','','',@SW_HIDE)
	ShellExecuteWait('explorer',' '&$letra)
	MsgBox(0,'Eliminación de Virus','Si existe, borrar a mano el .exe o .com si es que el AV no lo sacó.')
EndFunc

func errormenu()


	;Letra
;65 a 90.   97 a 122
;~ Do
;~ 	$letra=InputBox('Quitar Virus de Accesos','Ingrese solo la letra de unidad, sin ":" ni "\"')
;~ 	if $letra='' and 6=MsgBox(4,'Salir','Desea terminar el script?') then Exit
;~ until StringLen($letra)=1 and ((Asc($letra)>= 65 and Asc($letra)<= 90 ) or (Asc($letra)>= 97 and Asc($letra)<= 122))
;~ $letra = $letra&':\'
;~ MsgBox(0,'',$letra)


;~ Asc
for $i=65 to 90
	if WinExists(Chr($i)&':\Menu Programas\Menu.exe','Aceptar') and WinExists('C:\Windows\system32\cmd.EXE') Then
		WinClose(Chr($i)&':\Menu Programas\Menu.exe','Aceptar')
		WinClose('C:\Windows\system32\cmd.EXE')
		ExitLoop
	EndIf
	$nombretareaprog='Menu Continuar'
	ShellExecuteWait('cmd.exe',' /C schtasks /end /TN "'&$nombretareaprog&'"','','',@SW_HIDE)
	ShellExecuteWait('cmd.exe',' /C schtasks /delete /TN "'&$nombretareaprog&'" /F','','',@SW_HIDE)

Next

;~
EndFunc

func SystemExplorer()
	ShellExecute('System Explorer Launcher.exe','','System Explorer portable')
EndFunc

func ATwin()
	ShellExecute('AntiTwin.exe','','AntiTwin')
EndFunc

func Impresoras()

EndFunc
