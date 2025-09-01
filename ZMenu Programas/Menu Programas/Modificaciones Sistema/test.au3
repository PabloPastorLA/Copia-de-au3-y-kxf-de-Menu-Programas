ventanitacomandoejecutar('control.exe sysdm.cpl,,4')

func ventanitacomandoejecutar($comando)
	ShellExecute('explorer.exe',' Shell:::{2559a1f3-21d7-11d4-bdaf-00c04f60b9f0}','','',@SW_HIDE)	;abrir ventana ejecutar
	WinWait('Ejecutar','Escriba el nombre del programa')
	while ControlGetText('Ejecutar','','Edit1') <> $comando
		ControlsetText('Ejecutar','','Edit1',$comando)								;pegar comando
	WEnd
	while WinExists('Ejecutar','Escriba el nombre del programa')					;clickear aceptar
		ControlClick('Ejecutar','','Button2')
	WEnd
EndFunc


;
