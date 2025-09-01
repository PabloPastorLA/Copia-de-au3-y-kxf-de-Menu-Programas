;MsgBox(0,'','0000')
; abrir msconfig
	$comando= 'msconfig.exe'		;Lo que se pega en ejecutar
;	ShellExecute('explorer.exe',' Shell:::{2559a1f3-21d7-11d4-bdaf-00c04f60b9f0}','','',@SW_HIDE)	;abrir ventana ejecutar
	;ShellExecute('explorer.exe',' Shell:::{2559a1f3-21d7-11d4-bdaf-00c04f60b9f0}','','');,@SW_HIDE)	;abrir ventana ejecutar
	if @OSVersion='WIN_10' then
		$ventana='Administrador de tareas'
		$ventana2='Crear nueva tarea'
	Else
		MsgBox(0,'','ventanita ejecutar falla, falta código')
	EndIf

	Do
		WinClose($ventana)
	until not WinExists($ventana)

	send('{ctrldown}{shiftdown}{esc}{ctrlup}{shiftup}')
	WinWait($ventana)
	WinActivate($ventana)
	send('{altdown}{a}{n}{altup}')



	WinWait($ventana2,'Escriba el nombre del programa')

	while ControlGetText($ventana2,'','Edit1') <> $comando
		ControlsetText($ventana2,'','Edit1',$comando)				;Pegar comando
	WEnd

	while ControlCommand($ventana2,'','Button2','ischecked')=0
		ControlClick($ventana2,'','Button2')						;Clickear con privilegios administrativos
	WEnd

	while WinExists($ventana2,'Escriba el nombre del programa')		;Clickear aceptar
		ControlClick($ventana2,'','Button3')
	WEnd

	WinWaitClose($ventana2,'Escriba el nombre del programa')

	Do																;Cerrar ventana de administrador de tareas
		WinClose($ventana)
	until not WinExists($ventana)


;MsgBox(0,'','1111')
