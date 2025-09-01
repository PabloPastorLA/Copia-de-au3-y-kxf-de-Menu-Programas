;Letra
;65 a 90.   97 a 122
Do
	$letra=InputBox('Quitar Virus de Accesos','Ingrese solo la letra de unidad, sin ":" ni "\"')
	if $letra='' and 6=MsgBox(4,'Salir','Desea terminar el script?') then Exit
until StringLen($letra)=1 and ((Asc($letra)>= 65 and Asc($letra)<= 90 ) or (Asc($letra)>= 97 and Asc($letra)<= 122))
$letra = $letra&':\'
MsgBox(0,'',$letra)


