		Do
			$pos1=WinGetPos('Administrador de tareas');~ contr
			WinActivate('Administrador de tareas')
			WinWaitActive('Administrador de tareas')
			ControlSend('Administrador de tareas','','DirectUIHWND1','{altdown}{d}{altup}')
			$pos2=WinGetPos('Administrador de tareas');~ contr
		until $pos1[2]<$pos2[2]
