












$programfilesdir=@HomeDrive&'\Program Files'
$file=''
if FileExists=$programfilesdir&"\Google\Chrome\Application\98.0.4758.81\Installer\setup.exe" then $file=$programfilesdir&"\Google\Chrome\Application\98.0.4758.81\Installer\setup.exe"
if FileExists=$programfilesdir&" (x86)\Google\Chrome\Application\98.0.4758.81\Installer\setup.exe" then $file=$programfilesdir&" (x86)\Google\Chrome\Application\98.0.4758.81\Installer\setup.exe"

$process=ShellExecute($file,' --uninstall --channel=stable --system-level --verbose-logging')

WinWait()

Do
	if WinExists then WinActivate
	if WinActive then send('{enter}')
	Sleep(300)
until not ProcessExists($process)

