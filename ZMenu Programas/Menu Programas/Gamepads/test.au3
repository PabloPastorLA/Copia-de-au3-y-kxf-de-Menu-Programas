#RequireAdmin
$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)

ProcessClose('scpdriverinstaller.exe')


ShellExecute($ProgramFilesDir&'\Nefarius Software Solutions\ScpToolkit\ScpDriverInstaller.exe')







WinWait('ScpToolkit Driver Installer')
WinWaitActive('ScpToolkit Driver Installer')


Sleep(1000)

Do
	WinActivate('ScpToolkit Driver Installer')
	$pos=WinGetPos('ScpToolkit Driver Installer')
until PixelGetColor($pos[0]+30,$pos[1]+300)=5658198

Do
	MouseMove($pos[0]+900,$pos[1]+70,0)
	MouseClick('left')
	MouseClick('left',$pos[0]+900,$pos[1]+70,0)
	Sleep(1000)
until PixelGetColor($pos[0]+30,$pos[1]+300)<>5658198

Do
	Sleep(1000)
until PixelGetColor($pos[0]+30,$pos[1]+300)=5658198

do
	WinClose('ScpToolkit Driver Installer')
until not WinExists('ScpToolkit Driver Installer')








