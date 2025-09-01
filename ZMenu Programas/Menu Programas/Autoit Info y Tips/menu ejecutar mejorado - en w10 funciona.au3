MenuEjecutarComoAdmin('msconfig.exe')		;Lo que se pega en ejecutar


Func MenuEjecutarComoAdmin($comando)
	if @OSVersion='WIN_10' then
		$ventana='Administrador de tareas'
		$ventana2='Crear nueva tarea'
	ElseIf @OSVersion='WIN_7' then
		$ventana='Administrador de tareas de Windows'
		$ventana2='Crear una tarea nueva'
	Else
		MsgBox(0,'','ventanita ejecutar falla, falta código')
	EndIf
	Do
		WinClose($ventana)
	until not WinExists($ventana)
	send('{ctrldown}{shiftdown}{esc}{ctrlup}{shiftup}')				;Espero ventana de Administrador de Tareas
	WinWait($ventana)
	WinSetTrans($ventana,'',150)
	$antes=WinGetPos($ventana)										;obtengo tamaño antes
	send('{altdown}{d}{altup}')
	$despues=$antes
	if @OSVersion<>'WIN_7' then
		do
			$despues=WinGetPos($ventana)								;obtengo tamaño despues
		until $despues[2]<>$antes[2]

		if $antes[2]>$despues[2] then									;si tamaño mas chico cambio a ventana grande
			WinActivate($ventana)
			WinWaitActive($ventana)
			send('{altdown}{d}{altup}')
		EndIf
	EndIf

	send('{altdown}{a}{n}{altup}')									;Abro ventanita ejecutar
	WinWait($ventana2,'Escriba el nombre del programa')				;Espero ventanita de ejecutar
	do
		ControlsetText($ventana2,'','Edit1',$comando)				;Pegar comando
	until ControlGetText($ventana2,'','Edit1') = $comando
	Sleep(1000)
	if @OSVersion<>'WIN_7' then

		while ControlCommand($ventana2,'','Button2','ischecked')=0
			ControlClick($ventana2,'','Button2')						;Clickear con privilegios administrativos
		WEnd
	EndIf


	while WinExists($ventana2,'Escriba el nombre del programa')		;Clickear aceptar
		if ControlGetText($ventana2,'','Button3')='Aceptar' then ControlClick($ventana2,'','Button3')
		if ControlGetText($ventana2,'','Button2')='Aceptar' then ControlClick($ventana2,'','Button2')
	WEnd

	WinWaitClose($ventana2,'Escriba el nombre del programa')

	Do																;Cerrar ventana de administrador de tareas
		WinClose($ventana)
	until not WinExists($ventana)
EndFunc