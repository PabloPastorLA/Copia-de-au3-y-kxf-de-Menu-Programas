$exit=0
while ProcessExists('MenuRED2.exe') or $exit<4
	$exit=$exit+1
	;	VENTANAS PENDRIVE
	If WinExists('Microsoft Windows','Analizar y reparar (recomendado)') Then WinClose('Microsoft Windows','Analizar y reparar (recomendado)')
	If WinExists('Reproducción automática','Ver más opciones de Reproducción automática') Then WinClose('Reproducción automática','Ver más opciones de Reproducción automática')
	;---
	;	VENTANAS NOD
	If WinExists('Amenaza detectada','MenuRED2') Then ControlClick('Amenaza detectada','','ESET Button Window3')

	;---

	Sleep(1000)
WEnd
