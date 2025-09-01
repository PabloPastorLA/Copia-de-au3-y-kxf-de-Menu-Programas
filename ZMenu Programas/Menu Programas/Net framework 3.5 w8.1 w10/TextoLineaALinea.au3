#include <File.au3>



$file=FileOpen('borrar.txt')

for $i=1 to _FileCountLines('loginst.txt') step 1
	MsgBox(0,'', FileReadLine($file,$i))
Next
FileClose($file)
