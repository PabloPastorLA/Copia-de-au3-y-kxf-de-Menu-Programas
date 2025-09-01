#include <File.au3>



$file=FileOpen('loginst.txt')
$OK=1
for $i=50 to _FileCountLines('loginst.txt') step 1
	if FileReadLine($file,$i) = 'The operation completed successfully.' Then $OK=0;MsgBox(0,'','')
Next
FileClose($file)

While $OK
	MsgBox(0,'','Falla al instalar Net 3.5 W8-W10, revisar archivo loginst.txt')
WEnd
