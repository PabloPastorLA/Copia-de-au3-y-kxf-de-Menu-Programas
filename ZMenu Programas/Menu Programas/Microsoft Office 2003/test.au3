$exit=0
	While Not WinExists('Asistente para la compatibilidad de programas','Este programa se instaló correctamente') And $exit<10
		Sleep(1000)
		$exit=$exit+1
	WEnd

	If WinExists('Asistente para la compatibilidad de programas','Este programa se instaló correctamente') Then
		While WinExists('Asistente para la compatibilidad de programas','Este programa se instaló correctamente')
			ControlClick('Asistente para la compatibilidad de programas','Este programa se instaló correctamente','Button2')
			sleep(1000)
		WEnd
	EndIf