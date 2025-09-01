cerrarventanas()
abrirventana1()
abrirventana2()
cerrarmenuesdesplegbles()
abrirmenu1()
configurarmenu1()
cerrarmenuesdesplegbles()
abrirmenu2()
configurarmenu2()
confirmar()




func confirmar()
	While WinExists('Configuración de uso compartido avanzado')
		if ControlCommand('Configuración de uso compartido avanzado','Guardar cambios','Button64',"IsEnabled", "" ) then ControlClick('Configuración de uso compartido avanzado','Guardar cambios','Button64')
		if ControlCommand('Configuración de uso compartido avanzado','Guardar cambios','Button64',"IsEnabled", "" )=0 then WinClose('Configuración de uso compartido avanzado')
		Sleep(500)
	WEnd
EndFunc


Func configurarmenu2()
	While ControlCommand('Configuración de uso compartido avanzado','','Button22',"IsChecked", "")=0
		ControlCommand('Configuración de uso compartido avanzado','','Button22',"Check", "")
	WEnd
	While ControlCommand('Configuración de uso compartido avanzado','','Button25',"IsChecked", "")=0
		ControlCommand('Configuración de uso compartido avanzado','','Button25',"Check", "")
	WEnd
	While ControlCommand('Configuración de uso compartido avanzado','','Button38',"IsChecked", "")=0
		ControlCommand('Configuración de uso compartido avanzado','','Button38',"Check", "")
	WEnd
EndFunc


Func configurarmenu1()
	While ControlCommand('Configuración de uso compartido avanzado','','Button1',"IsChecked", "")=0
		ControlCommand('Configuración de uso compartido avanzado','','Button1',"Check", "")
	WEnd
	While ControlCommand('Configuración de uso compartido avanzado','','Button4',"IsChecked", "")=0
		ControlCommand('Configuración de uso compartido avanzado','','Button4',"Check", "")
	WEnd
	While ControlCommand('Configuración de uso compartido avanzado','','Button9',"IsChecked", "")=0
		ControlCommand('Configuración de uso compartido avanzado','','Button9',"Check", "")
	WEnd
	While ControlCommand('Configuración de uso compartido avanzado','','Button17',"IsChecked", "")=0
		ControlCommand('Configuración de uso compartido avanzado','','Button17',"Check", "")
	WEnd
EndFunc

func abrirmenu1()
	WinActivate('Configuración de uso compartido avanzado')
	WinWaitActive('Configuración de uso compartido avanzado')
	ControlFocus('Configuración de uso compartido avanzado','','DirectUIHWND4')
	send('{up}{space}')
EndFunc

func abrirmenu2()
	WinActivate('Configuración de uso compartido avanzado')
	WinWaitActive('Configuración de uso compartido avanzado')
	ControlFocus('Configuración de uso compartido avanzado','','DirectUIHWND4')
	send('{down}{space}')
EndFunc


func cerrarventanas()
	while WinExists('Centro de redes y recursos compartidos') or WinExists('Configuración de uso compartido avanzado')
		WinClose('Configuración de uso compartido avanzado')
		WinClose('Centro de redes y recursos compartidos')
	WEnd
EndFunc

;abrir ventana 1
func abrirventana1()
	ShellExecute('control',' /name Microsoft.NetworkandSharingCenter')
	WinWait('Centro de redes y recursos compartidos')
EndFunc

;abrir ventana 2
func abrirventana2()
	while not WinExists('Configuración de uso compartido avanzado','Dirección: Panel de control')
		WinActivate('Centro de redes y recursos compartidos')
		WinWaitActive('Centro de redes y recursos compartidos')
		WinSetState('Centro de redes y recursos compartidos','',@SW_MAXIMIZE )
		MouseClick('',100,170,1,0)
		$exit=0
		while not WinExists('Configuración de uso compartido avanzado') and $exit<13
			Sleep(250)
			$exit=$exit+1
		WEnd
		while not ControlCommand('Configuración de uso compartido avanzado','','DirectUIHWND4',"IsVisible", "")
		WEnd
	WEnd
EndFunc

;cerrar menues desplegables

func cerrarmenuesdesplegbles()
	WinActivate('Configuración de uso compartido avanzado')
	WinWaitActive('Configuración de uso compartido avanzado')

	$exit=0
	while $exit=0
		$exit=1

		if ControlCommand('Configuración de uso compartido avanzado','','SysLink1',"IsVisible", "")=1 then
			$exit=0
			WinActivate('Configuración de uso compartido avanzado')
			WinWaitActive('Configuración de uso compartido avanzado')
			ControlFocus('Configuración de uso compartido avanzado','','SysLink1')
			Send('{up}{space}')
			Sleep(1000)
		EndIf

		if ControlCommand('Configuración de uso compartido avanzado','','SysLink8',"IsVisible", "")=1 then
			$exit=0
			WinActivate('Configuración de uso compartido avanzado')
			WinWaitActive('Configuración de uso compartido avanzado')
			ControlFocus('Configuración de uso compartido avanzado','','SysLink8')
			Send('{up}{space}')
			Sleep(1000)
		EndIf
	WEnd
EndFunc





















#cs

Dirección: Panel de control\Todos los elementos de Panel de control\Centro de redes y recursos compartidos\Configuración de uso compartido avanzado
Configuración de uso compartido avanzado
ShellView
Guardar cambios
Cancelar





Dirección: Panel de control\Todos los elementos de Panel de control\Centro de redes y recursos compartidos\Configuración de uso compartido avanzado
Configuración de uso compartido avanzado
ShellView
Cuando se activa la detección de redes, este equipo puede ver otros equipos y dispositivos en la red y es visible para los demás equipos en la red. <a href="mshelp://windows/?id=0e5f2e0c-9906-4518-b7c7-d3632105dcad">¿Qué es la detección de redes?</a>
Activar la detección de redes
Desactivar la detección de redes
Cuando se activa el uso compartido de archivos e impresoras, los usuarios de la red podrán tener acceso a los archivos e impresoras compartidos en este equipo.
Activar el uso compartido de archivos e impresoras
Desactivar el uso compartido de archivos e impresoras
Cuando se activa el uso compartido de carpetas públicas, los usuarios de la red, incluidos los miembros del grupo en el hogar, pueden obtener acceso a los archivos de estas carpetas. <a href="mshelp://windows/?id=9636e0f2-0223-45d2-89cb-3e317c450905">¿Qué son las carpetas públicas?</a>
Activar el uso compartido para que todos los usuarios con acceso a la red puedan leer y escribir archivos de las carpetas públicas
Desactivar el uso compartido de la carpeta pública (los usuarios que iniciaron sesión en este equipo todavía podrán obtener acceso a esas carpetas)
Cuando se activa la transmisión por secuencias de multimedia, los usuarios y dispositivos de la red pueden obtener acceso a música, imágenes y vídeos de este equipo. Este equipo también puede encontrar multimedia en la red.
Windows 7 usa el cifrado de 128 bits para ayudar a proteger las conexiones de uso compartido de archivos. Algunos dispositivos no admiten el cifrado de 128 bits y deben usar el cifrado de 40 o 56 bits.
Usar el cifrado de 128 bits para ayudar a proteger las conexiones de uso compartido de archivos (recomendado)
Habilitar el uso compartido de archivos para dispositivos que usan el cifrado de 40 o 56 bits
Cuando se activa el uso compartido con protección por contraseña, sólo los usuarios con una cuenta y contraseña de usuario en este equipo pueden obtener acceso a los archivos compartidos, a las impresoras conectadas a este equipo y a las carpetas públicas. Para dar acceso a otros usuarios, es necesario desactivar el uso compartido con protección por contraseña.
Activar el uso compartido con protección por contraseña
Desactivar el uso compartido con protección por contraseña
Normalmente, Windows administra las conexiones a otros equipos del grupo en el hogar. Sin embargo, si tiene las mismas cuentas de usuario y contraseñas en todos los equipos, puede hacer que Grupo Hogar use su cuenta. <a href="mshelp://windows/?id=12e2db71-77bc-48da-88ad-8e3d7cb80da2">Ayuda para decidir</a>
Permitir que Windows administre las conexiones del grupo en el hogar (recomendado)
Usar cuentas de usuario y contraseñas para conectarse a otros equipos
Guardar cambios
Cancelar





Dirección: Panel de control\Todos los elementos de Panel de control\Centro de redes y recursos compartidos\Configuración de uso compartido avanzado
Configuración de uso compartido avanzado
ShellView
Cuando se activa la detección de redes, este equipo puede ver otros equipos y dispositivos en la red y es visible para los demás equipos en la red. <a href="mshelp://windows/?id=0e5f2e0c-9906-4518-b7c7-d3632105dcad">¿Qué es la detección de redes?</a>
Activar la detección de redes
Desactivar la detección de redes
Cuando se activa el uso compartido de archivos e impresoras, los usuarios de la red podrán tener acceso a los archivos e impresoras compartidos en este equipo.
Activar el uso compartido de archivos e impresoras
Desactivar el uso compartido de archivos e impresoras
Cuando se activa el uso compartido de carpetas públicas, los usuarios de la red, incluidos los miembros del grupo en el hogar, pueden obtener acceso a los archivos de estas carpetas. <a href="mshelp://windows/?id=9636e0f2-0223-45d2-89cb-3e317c450905">¿Qué son las carpetas públicas?</a>
Activar el uso compartido para que todos los usuarios con acceso a la red puedan leer y escribir archivos de las carpetas públicas
Desactivar el uso compartido de la carpeta pública (los usuarios que iniciaron sesión en este equipo todavía podrán obtener acceso a esas carpetas)
Cuando se activa la transmisión por secuencias de multimedia, los usuarios y dispositivos de la red pueden obtener acceso a música, imágenes y vídeos de este equipo. Este equipo también puede encontrar multimedia en la red.
Windows 7 usa el cifrado de 128 bits para ayudar a proteger las conexiones de uso compartido de archivos. Algunos dispositivos no admiten el cifrado de 128 bits y deben usar el cifrado de 40 o 56 bits.
Usar el cifrado de 128 bits para ayudar a proteger las conexiones de uso compartido de archivos (recomendado)
Habilitar el uso compartido de archivos para dispositivos que usan el cifrado de 40 o 56 bits
Cuando se activa el uso compartido con protección por contraseña, sólo los usuarios con una cuenta y contraseña de usuario en este equipo pueden obtener acceso a los archivos compartidos, a las impresoras conectadas a este equipo y a las carpetas públicas. Para dar acceso a otros usuarios, es necesario desactivar el uso compartido con protección por contraseña.
Activar el uso compartido con protección por contraseña
Desactivar el uso compartido con protección por contraseña
Guardar cambios
Cancelar








#ce
