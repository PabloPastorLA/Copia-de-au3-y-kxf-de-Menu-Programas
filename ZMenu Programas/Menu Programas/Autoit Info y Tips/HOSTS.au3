
$cont='127.0.0.1 cbs.wondershare.com'&@CRLF&'127.0.0.1 www.cbs.wondershare.com'&@CRLF&'127.0.0.1 platform.wondershare.com'&@CRLF&'127.0.0.1 www.wondershare.com'
$arch=FileOpen(@WindowsDir&'\System32\drivers\etc\hosts',1)
FileWrite($arch,$cont)
FileClose($arch)