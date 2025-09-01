#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Cerrando Menu Verif',160,80,0,220)

$exit=0
Do
	ProcessClose('memoria.exe')
	$exit=$exit+1
	WinClose('ESET NOD32 Antivirus','Exclusiones')
	ProcessClose('MenuverificarGUI')
	;~ ProcessClose('')
	;~ ProcessClose('')
	;~ ProcessClose('')
	;~ ProcessClose('')
	;~ ProcessClose('')

	WinClose('MenuVerificar GUI')
	WinClose('Administrador: C:\Windows\System32\cmd.exe')
	WinClose('Administrador de dispositivos')
	WinClose('Programador de tareas')
	WinClose('Word')
	WinClose('Configuración')
	WinClose('Documento1 - Word')
	WinClose('Documento2 - Word')
	WinClose('Configuración del sistema')
	WinClose('Administrador de tareas')
	WinClose('Propiedades del sistema')
	WinClose('ARCHIVOS PRUEBA')
	WinClose('Autoruns [')
	WinClose('Sistema','Barra de herramientas de área Subir')
	WinClose('Editor del Registro')
	WinClose('Sistema','Dirección: Panel de control\Sistema y seguridad\Sistema')
	WinClose('Editor del Registro')
	WinClose('Editor del Registro')
	WinClose('Cambiar configuración','Ofrecerme actualizaciones &recomendadas de la')
	WinClose('Documento1 - Microsoft Word','')
	WinSetState('ESET NOD32 Antivirus','',@SW_HIDE)
	WinClose('falta: Bloc de notas')
	if @OSVersion='WIN_7' then WinClose('Windows Update','&Buscar actualizaciones')

	WinClose('Establecer programas predeterminados')

	WinClose('Sistema','ShellView')
	;~ WinClose('')
	;~ WinClose('')
	;~ WinClose('')
	;~ WinClose('')


until $exit>4

func nod()
	$existe=0
	Global $ProgramFilesDir=@ProgramFilesDir
	if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)
	If FileExists ($ProgramFilesDir &'\ESET\ESET NOD32 Antivirus\egui.exe') Then
		$existe=1
	Elseif FileExists ($ProgramFilesDir &' (x86)\ESET\ESET NOD32 Antivirus\egui.exe') Then
		$existe=1
	EndIf

	if $existe=1 Then
		if not WinExists('ESET NOD32 Antivirus','Exclusiones') and 5<>WingetState('ESET NOD32 Antivirus','') Then
			do
				WinsetState('ESET NOD32 Antivirus','',@SW_HIDE)
			until 5=WingetState('ESET NOD32 Antivirus','')
		EndIf
	EndIf


EndFunc

