	$param='about:welcome'
	$param2='about:preferences'
	$ext1='ublock_origin-1.61.2.xpi'
	$ext2='fastforwardteam-0.2383.xpi'




if ProcessExists('firefox.exe') then
	Do
		ProcessClose('firefox.exe')
	until Not ProcessExists('firefox.exe')
EndIf

ProcessWaitClose('firefox.exe')

;Abrir para la ventana de inicio
ShellExecute('firefox.EXE',$param)
SplashTextOn('Fireox','Opc de inicio.',160,80,0,110)
WinWait("[CLASS:MozillaWindowClass]")
Sleep(1000)
MsgBox(0,'Firefox inicio','Configure las opciones de inicio de firefox y cierre.')
WinWaitClose("[CLASS:MozillaWindowClass]")

ShellExecute('firefox.EXE',@ScriptDir&'\'&$ext1)
SplashTextOn('Fireox','Ublock',160,80,0,110)
WinWait("[CLASS:MozillaWindowClass]")
WinWaitClose("[CLASS:MozillaWindowClass]")

ShellExecute('firefox.EXE',@ScriptDir&'\'&$ext2)
SplashTextOn('Fireox','FastForward',160,80,0,110)
WinWait("[CLASS:MozillaWindowClass]")
WinWaitClose("[CLASS:MozillaWindowClass]")

ShellExecute('firefox.EXE',$param2)
SplashTextOn('Fireox','Pestañas y Update',160,80,0,110)
WinWait("[CLASS:MozillaWindowClass]")
Sleep(1000)
MsgBox(0,'Firefox inicio','Configure las opciones de inicio:'&@CRLF&' - que guarde pestañas al cerrar'&@CRLF&' - dale al update cierre.')
WinWaitClose("[CLASS:MozillaWindowClass]")


;MsgBox(0,'Ext Firefox','Agregar extensiones a firefox.')
$ahora='T'
Do
	$rta=MsgBox(4,'Ext Firefox',$ahora&'erminaste de agregar las ext a firefox? Me borro.')
	$ahora='Ahora si t'
until $rta=6

FileDelete(@DesktopDir&'\'&$ext1)
FileDelete(@DesktopDir&'\'&$ext2)
FileDelete(@DesktopDir&'\FirefExtABRIR.au3')
