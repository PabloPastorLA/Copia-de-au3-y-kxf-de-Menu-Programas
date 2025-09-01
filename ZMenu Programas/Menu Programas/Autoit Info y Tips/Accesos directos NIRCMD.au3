#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.12.0
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

		while FileExists(@DesktopCommonDir&'\Bad Piggies.lnk') Or FileExists(@StartMenuCommonDir&'\Programs\Rovio Entertainment Ltd\Bad Piggies\Bad Piggies.lnk')
			FileDelete(@DesktopCommonDir&'\Bad Piggies.lnk')
			FileDelete(@StartMenuCommonDir&'\Programs\Rovio Entertainment Ltd\Bad Piggies\Bad Piggies.lnk')
		WEnd

		if FileExists(@ProgramFilesDir & ' (x86)\' &$dir& $exe) Then ShellExecuteWait('nircmd.exe',' shortcut "'&@ProgramFilesDir & ' (x86)\' &$dir& $exe&'" "~$folder.desktop$" "Bad Piggies"')
		if FileExists(@ProgramFilesDir & ' (x86)\' &$dir& $exe) Then ShellExecuteWait('nircmd.exe',' shortcut "'&@ProgramFilesDir & ' (x86)\' &$dir& $exe&'" "~$folder.start_menu$\Programs\Rovio Entertainment Ltd\Bad Piggies" "Bad Piggies"')
		if FileExists(@ProgramFilesDir & '\' &$dir& $exe) Then ShellExecuteWait('nircmd.exe',' shortcut "'&@ProgramFilesDir & '\' &$dir& $exe&'" "~$folder.desktop$" "Bad Piggies"')
		if FileExists(@ProgramFilesDir & '\' &$dir& $exe) Then ShellExecuteWait('nircmd.exe',' shortcut "'&@ProgramFilesDir & '\' &$dir& $exe&'" "~$folder.start_menu$\Programs\Rovio Entertainment Ltd\Bad Piggies" "Bad Piggies"')
