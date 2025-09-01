$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


if not FileExists($ProgramFilesDir&'\MenuInstalado\DLL') Then


	If @OSArch='X86' Then ShellExecuteWait('AutoIt3.exe',"Dllsuite.au3", "")
	If @OSArch='X86' Then ShellExecuteWait('AutoIt3.exe',"CorrDllsuite.au3", "")
	If @OSArch='X86' Then ShellExecuteWait('AutoIt3.exe',"DesDllsuite.au3", "")

	If @OSArch='X64' Then ShellExecuteWait('AutoIt3_x64.exe',"Dllsuite.au3", "")
	If @OSArch='X64' Then ShellExecuteWait('AutoIt3_x64.exe',"CorrDllsuite.au3", "")
	If @OSArch='X64' Then ShellExecuteWait('AutoIt3_x64.exe',"DesDllsuite.au3", "")

EndIf


;~ CorrDllsuite.au3
;~ DesDllsuite.au3
;~ Dllsuite.au3