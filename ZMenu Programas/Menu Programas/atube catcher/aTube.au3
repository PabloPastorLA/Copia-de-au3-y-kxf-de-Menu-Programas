#include <File.au3>

if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf

$version='3.8.9844'

;~ $Instalador='1C333367_stp.exe'
$Instalador='aTube_Catcher.exe'
$SilentSwitch=' /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'

$NombrePrograma='aTube Catcher'
$ruta='DsNET Corp\aTube Catcher 2.0\yct.exe'

SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. '&$NombrePrograma,160,80,0,110)


$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


If FileExists($Instalador) AND not FileExists ($ProgramFilesDir&'\'&$ruta) AND not FileExists ($ProgramFilesDir&' (x86)\'&$ruta) Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	"&$NombrePrograma&@CRLF)

;Instalar
	RegDelete('HKEY_CURRENT_USER\Software\VB and VBA Program Settings\YouTubeCatcher\')
	ShellExecuteWait($Instalador,$SilentSwitch)

;esperar y cerrar
;~ 	if ProcessExists("YouTubeDownloader.exe") then MsgBox(0,'','')
;~ 	Do
;~ 		ProcessClose('YouTubeDownloader.exe')
;~ 	Until not ProcessExists('YouTubeDownloader.exe')


;Abrir y cerrar
	if FileExists ($ProgramFilesDir&'\'&$ruta) then
		ShellExecute($ProgramFilesDir&'\'&$ruta)
		conf()
		RegWrite('HKEY_CURRENT_USER\Software\VB and VBA Program Settings\YouTubeCatcher\Setup','DefaultLang','REG_SZ',$ProgramFilesDir&'\DsNET Corp\aTube Catcher 2.0\Language\spanish.txt')
		RegWrite('HKEY_CURRENT_USER\Software\VB and VBA Program Settings\YouTubeCatcher\Setup','DisclaimerAgreed','REG_SZ',1)

	ElseIf FileExists ($ProgramFilesDir&' (x86)\'&$ruta) Then
		ShellExecute($ProgramFilesDir&' (x86)\'&$ruta)
		conf()
		RegWrite('HKEY_CURRENT_USER\Software\VB and VBA Program Settings\YouTubeCatcher\Setup','DefaultLang','REG_SZ',$ProgramFilesDir&' (x86)\DsNET Corp\aTube Catcher 2.0\Language\spanish.txt')
		RegWrite('HKEY_CURRENT_USER\Software\VB and VBA Program Settings\YouTubeCatcher\Setup','DisclaimerAgreed','REG_SZ',1)

	Else
		MsgBox(0,$NombrePrograma,'No encontre ejecutable. Cerrando')
		Exit
	EndIf

;tratar de sacar ventana chrome
	ventchrome()



	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	"&$NombrePrograma&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt",$NombrePrograma&@CRLF)
EndIf

func ventchrome()
;~ MsgBox(0,'','ventana chrome')

	if WinExists('aTube Catcher Official Web Site – The best video software - Google Chrome') and WinActive('aTube Catcher Official Web Site – The best video software - Google Chrome') then Send('{ctrldown}{W}{ctrlUP}')
	if WinExists('Sin título - Google Chrome') and WinActive('Sin título - Google Chrome') then Send('{ctrldown}{W}{ctrlUP}')
	if WinExists('www.atube.me - Google Chrome') and WinActive('www.atube.me - Google Chrome') then Send('{ctrldown}{W}{ctrlUP}')


;~ MsgBox(0,'','ventana chrome')
;~ Exit
EndFunc


func conf()
	WinWait('Select your language')
	do
		ControlClick('Select your language','','ThunderRT6CommandButton1')
	until not WinExists('Select your language')

	WinWait('aTube Catcher '&$version&'')
	Do
		ControlClick('aTube Catcher '&$version&'','','Button1')
	Until not WinExists('aTube Catcher '&$version&'','Default settings loaded!')

	WinWait(' aTube Catcher')

	WinWait('aTube Catcher '&$version&' - Studio Suite - DsNET Corp. 2021')
	do
		WinClose(' aTube Catcher')
		WinClose('aTube Catcher '&$version&' - Studio Suite - DsNET Corp. 2021')
	until not WinExists(' aTube Catcher') and not WinExists('aTube Catcher '&$version&' - Studio Suite - DsNET Corp. 2021')


EndFunc



;EOF


