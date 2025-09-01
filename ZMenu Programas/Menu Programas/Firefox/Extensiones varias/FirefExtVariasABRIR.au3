#RequireAdmin

if ProcessExists('firefox.exe') then
	Do
		ProcessClose('firefox.exe')
	until Not ProcessExists('firefox.exe')
EndIf

ProcessWaitClose('firefox.exe')

$ext1='Dark_Background_Preload-0.1-an+fx.xpi'
$ext2='enhancer_for_youtube-2.0.114.1.xpi'
$ext3='Multithreaded_Download_Manager-3.2b4-fx.xpi'
$ext4='new_tab_override-15.1.1-fx.xpi'

ShellExecute('firefox.EXE')
Sleep(2000)
ejecutarconext($ext1)
ejecutarconext($ext2)
ejecutarconext($ext3)
ejecutarconext($ext4)

;MsgBox(0,'Ext Firefox','Agregar extensiones a firefox.')
$ahora='T'
Do
	$rta=MsgBox(4,'Ext OTRAS Firef',$ahora&'erminaste de agregar las 4 ext a firefox? Me borro (solo del escritorio).')
	$ahora='Ahora si t'
until $rta=6

FileDelete(@DesktopDir&'\'&$ext1)
FileDelete(@DesktopDir&'\'&$ext2)
FileDelete(@DesktopDir&'\'&$ext3)
FileDelete(@DesktopDir&'\'&$ext4)

FileDelete(@DesktopDir&'\FirefExtVariasABRIR.au3')



Func ejecutarconext($ext)
	ShellExecute('firefox.EXE','"'&@ScriptDir&'\'&$ext&'"')
	Sleep(2000)
EndFunc
