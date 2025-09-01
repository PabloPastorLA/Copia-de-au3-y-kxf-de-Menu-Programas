#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;MsgBox(0,'','limp')
DirRemove(@ScriptDir&'\HDD Regenerator 2011 Portable\HDDSTAT',1)
DirRemove(@ScriptDir&'\HDD Regenerator\HDDSTAT',1)

FileDelete(@ScriptDir&'\MiniTool Partition Wizard 12 Portable\App\MiniToolPartitionWizard\x64\log.txt')
FileDelete(@ScriptDir&'\MiniTool Partition Wizard 12 Portable\App\MiniToolPartitionWizard\x32\log.txt')


DirRemove(@ScriptDir&'\CrystalDiskInfo6_5_2\Smart',1)

FileDelete(@ScriptDir&'\RegSeeker\lang.ini')

