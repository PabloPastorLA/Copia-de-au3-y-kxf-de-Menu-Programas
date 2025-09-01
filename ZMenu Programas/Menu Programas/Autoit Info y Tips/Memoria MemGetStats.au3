#include <MsgBoxConstants.au3>

Local $aMem = MemGetStats()
MsgBox($MB_SYSTEMMODAL, "", "Memory Load : " & $aMem[0]&'%'&@crlf&"Total physical RAM: " & Round($aMem[1]/1024/1024,2)&' GB'&@crlf&"Libre physical RAM: " & Round($aMem[2]/1024/1024,2)&' GB'&@crlf&"Total Pagefile: " & Round($aMem[3]/1024/1024,2)&' GB'&@crlf&"Libre Pagefile: " & Round($aMem[4]/1024/1024,2)&' GB'&@crlf&"Total virtual: " & Round($aMem[5]/1024/1024,2)&' GB'&@crlf&"Libre virtual: " & Round($aMem[6]/1024/1024,2)&' GB')











