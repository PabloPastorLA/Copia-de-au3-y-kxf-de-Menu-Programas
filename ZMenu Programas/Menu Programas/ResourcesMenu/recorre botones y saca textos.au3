$ventana='Menu en modo LOCAL'
$separador=';'
if not WinExists($ventana) then
	MsgBox(0,'','No encontre ventana. Cerrando...')
	Exit
EndIf


while FileExists('buttons.txt')
	FileDelete('buttons.txt')
WEnd

WinActivate($ventana)
WinWaitActive($ventana)

;~ FileWrite
$handle=FileOpen('buttons.txt',1)
;  FileWriteLine($handle,'')

for $i=1 to 80 step 1
	FileWriteLine($handle,'Button'&$i&$separador&ControlGetText($ventana,'','Button'&$i)&$separador)
;~ 	FileWriteLine('buttons.txt','Button'&$i&$separador&ControlGetText($ventana,'','Button'&$i))
Next


MsgBox(0,'Recorrer Button','Ya terminé')

