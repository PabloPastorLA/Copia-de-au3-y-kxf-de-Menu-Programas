If @OSArch='X86' Then ShellExecuteWait('AutoIt3.exe',"InstDllsuite.au3", "")
	If @OSArch='X86' Then ShellExecuteWait('AutoIt3.exe',"CorrDllsuite.au3", "")
	If @OSArch='X86' Then ShellExecuteWait('AutoIt3.exe',"DesDllsuite.au3", "")

If @OSArch='X64' Then ShellExecuteWait('AutoIt3_x64.exe',"InstDllsuite.au3", "")
	If @OSArch='X64' Then ShellExecuteWait('AutoIt3_x64.exe',"CorrDllsuite.au3", "")
	If @OSArch='X64' Then ShellExecuteWait('AutoIt3_x64.exe',"DesDllsuite.au3", "")



;~ CorrDllsuite.au3
;~ DesDllsuite.au3
;~ Dllsuite.au3