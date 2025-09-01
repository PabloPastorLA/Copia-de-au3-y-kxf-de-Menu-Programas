Global $ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)

If FileExists("asd.exe") and not FileExists ($ProgramFilesDir & "\Allway Sync\Bin\syncappw.exe") AND not FileExists ($ProgramFilesDir & " (x86)\Allway Sync\Bin\syncappw.exe") Then
