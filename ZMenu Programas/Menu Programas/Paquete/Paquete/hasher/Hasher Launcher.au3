


if @OSArch= 'X86' Then $pid1=ShellExecute('"hasher.exe"',"", 'igorware-hasher-x86')
if @OSArch<>'X86' Then $pid1=ShellExecute('"hasher.exe"',"", "igorware-hasher-x64")
WinWait('IgorWare Hasher')
$pos=WinGetPos('IgorWare Hasher')
if $pos[0]>=@DesktopWidth/2 then WinMove('IgorWare Hasher','',0				 ,@DesktopHeight/2-50)
if $pos[0] <@DesktopWidth/2 then WinMove('IgorWare Hasher','',@DesktopWidth/2,@DesktopHeight/2-50)

		if @OSArch='X86' Then $pid2=ShellExecute('"hasher.exe"',"", 'igorware-hasher-x86')
		if @OSArch<>'X86' Then $pid2=ShellExecute('"hasher.exe"',"", "igorware-hasher-x64")
;~ WinWait($pid2)

;	WinSetState($Paquete,'',@SW_MINIMIZE)

