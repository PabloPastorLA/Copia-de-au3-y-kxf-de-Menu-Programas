#include <File.au3>
#include <WinAPIFiles.au3>
if @OSVersion = 'WIN_XP' Then
	sleep(1)
Else
	#RequireAdmin
EndIf

ShellExecuteWait('nircmd.exe',' shortcut "'&ruta()&'\Menu.exe" "~$folder.desktop$" "Menu"')
;-------------------------------------------------
;Global $Menu = GUICreate("GUI", 600, 540, 160, 0)

;-------------------------------------------------
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=Menu.kxf
Global $Menu = GUICreate("GUI", 600, 540, 160, 0)
Global $Autoit = GUICtrlCreateCheckbox("Autoit", 20, 20, 57, 17)
Global $Chrome = GUICtrlCreateCheckbox("Chrome", 120, 80, 67, 17)
Global $Firefox = GUICtrlCreateCheckbox("Firefox", 120, 100, 57, 17)
Global $ImgBurn = GUICtrlCreateCheckbox("ImgBurn", 120, 120, 67, 17)
Global $CDBurnerXP = GUICtrlCreateCheckbox("CDBurnerXP", 120, 140, 87, 17)
Global $DesAutoit = GUICtrlCreateCheckbox("Des Autoit", 220, 440, 75, 17)
Global $Internet_Explorer_8 = GUICtrlCreateCheckbox("IE8", 20, 210, 55, 17)
Global $Java = GUICtrlCreateCheckbox("Java", 120, 160, 57, 17)
Global $K_lite = GUICtrlCreateCheckbox("K-Lite", 120, 180, 57, 17)
Global $Mbam = GUICtrlCreateCheckbox("Mbam", 120, 400, 57, 17)
Global $Office_2003 = GUICtrlCreateCheckbox("Office_2003", 120, 320, 87, 17)
Global $Office_2007 = GUICtrlCreateCheckbox("Office_2007", 120, 340, 77, 17)
Global $DesinstalarMbam = GUICtrlCreateCheckbox("Desinstalar Mbam", 220, 360, 105, 17)
Global $Office_2010 = GUICtrlCreateCheckbox("Office_2010", 120, 380, 77, 17)
Global $Letasoft_Sound_Booster = GUICtrlCreateCheckbox("Sound Booster", 120, 280, 90, 17)
Global $World_of_Goo = GUICtrlCreateCheckbox("World of Goo", 380, 210, 90, 17)
Global $Winrar = GUICtrlCreateCheckbox("Winrar", 120, 200, 60, 17)
Global $Sistema_inicio = GUICtrlCreateCheckbox("Sistema inicio", 20, 40, 87, 17)
Global $Sistema_final = GUICtrlCreateCheckbox("Sistema final", 220, 312, 87, 17)
Global $Nod_32 = GUICtrlCreateCheckbox("Nod 32", 120, 300, 60, 17)
Global $Framework1_1 = GUICtrlCreateCheckbox("Framework 1-1", 20, 230, 90, 17)
Global $Framework3_5 = GUICtrlCreateCheckbox("Framework 3-5", 20, 250, 90, 17)
Global $Framework4 = GUICtrlCreateCheckbox("Framework 4", 20, 270, 90, 17)
Global $Validar_XP = GUICtrlCreateCheckbox("Validar XP", 20, 80, 77, 17)
Global $Drivers = GUICtrlCreateCheckbox("Drivers", 20, 160, 97, 17)
Global $Actualizar_XP = GUICtrlCreateCheckbox("Actualizar XP", 20, 120, 87, 17)
Global $Actualizar_W7 = GUICtrlCreateCheckbox("Actualizar W7", 20, 140, 87, 17)
Global $WMP_11 = GUICtrlCreateCheckbox("WMP 11", 20, 190, 67, 17)
Global $Foxit_Reader = GUICtrlCreateCheckbox("Foxit Reader", 120, 240, 87, 17)
Global $PDFLite = GUICtrlCreateCheckbox("PDFLite", 120, 260, 57, 17)
Global $Total_Commander = GUICtrlCreateCheckbox("T. Commander", 120, 420, 90, 17)
Global $Unlocker = GUICtrlCreateCheckbox("Unlocker", 120, 220, 70, 17)
Global $DirectX = GUICtrlCreateCheckbox("DirectX", 20, 310, 65, 17)
Global $Copiar_que_hacer = GUICtrlCreateCheckbox("Copiar que hacer", 120, 20, 97, 17)
Global $FDM = GUICtrlCreateCheckbox("FDM", 20, 340, 50, 17)
Global $Desinstalar_FDM = GUICtrlCreateCheckbox("Desinstalar FDM", 220, 380, 105, 17)
Global $Installrite = GUICtrlCreateCheckbox("Installrite", 20, 360, 70, 17)
Global $DesInstallrite = GUICtrlCreateCheckbox("DesInstallrite", 220, 400, 80, 17)
Global $Tuneup_2k8 = GUICtrlCreateCheckbox("Tuneup 2k8", 220, 160, 77, 17)
Global $Tuneup_2k10 = GUICtrlCreateCheckbox("Tuneup 2k10", 220, 180, 87, 17)
Global $Winamp = GUICtrlCreateCheckbox("Winamp", 120, 440, 60, 17)
Global $maconfig = GUICtrlCreateCheckbox("maconfig", 120, 40, 67, 17)
Global $Sinc_Nod_32 = GUICtrlCreateCheckbox("Sinc Nod 32", 330, 490, 80, 17)
Global $Sinc_Mbam = GUICtrlCreateCheckbox("Sinc Mbam", 330, 510, 77, 17)
Global $Extensiones = GUICtrlCreateCheckbox("Extensiones", 220, 332, 77, 17)
Global $DMbam = GUICtrlCreateCheckbox("Mbam", 433, 490, 50, 17)
Global $Dnod = GUICtrlCreateCheckbox("Nod", 433, 510, 40, 17)
Global $Juegos_Consolas = GUICtrlCreateCheckbox("Juegos Consolas", 380, 230, 100, 17)
Global $DesDllSuite = GUICtrlCreateCheckbox("DesDllSuite", 220, 420, 80, 17)
Global $DllSuite = GUICtrlCreateCheckbox("DllSuite", 20, 380, 60, 17)
Global $CorrerDLL = GUICtrlCreateCheckbox("Correr DLL", 120, 360, 77, 17)
Global $Ares = GUICtrlCreateCheckbox("Ares", 220, 80, 47, 17)
Global $CDex = GUICtrlCreateCheckbox("CDex", 310, 130, 47, 17)
Global $Skype = GUICtrlCreateCheckbox("Skype", 220, 120, 57, 17)
Global $Ra2YrMo = GUICtrlCreateCheckbox("Ra2+Yr+Mo", 380, 250, 75, 17)
Global $Validar_W7 = GUICtrlCreateCheckbox("Validar W7", 20, 100, 77, 17)
Global $Ultraiso = GUICtrlCreateCheckbox("Ultraiso", 20, 430, 57, 17)
Global $DToolsLite = GUICtrlCreateCheckbox("D. Tools Lite", 20, 410, 87, 17)
Global $Deluge = GUICtrlCreateCheckbox("Deluge", 220, 140, 55, 17)
Global $DukeNukemMP = GUICtrlCreateCheckbox("Duke Nukem MP", 380, 270, 105, 17)
Global $Nero_7 = GUICtrlCreateCheckbox("Nero 7", 20, 450, 75, 17)
Global $Mex_Motor_Mafia = GUICtrlCreateCheckbox("Mex Motor Mafia", 380, 290, 105, 17)
Global $Backupdrivers = GUICtrlCreateCheckbox("Bup Drivers", 220, 210, 75, 17)
Global $Rest_Drivers = GUICtrlCreateCheckbox("Rest Drivers", 220, 230, 75, 17)
Global $Counter_Strike = GUICtrlCreateCheckbox("Counter Strike", 380, 310, 95, 17)
Global $AdBlock = GUICtrlCreateCheckbox("AdBlock", 310, 70, 65, 17)
Global $GSpot = GUICtrlCreateCheckbox("GSpot", 310, 110, 55, 17)
Global $DamnNFO = GUICtrlCreateCheckbox("Damn NFO", 220, 100, 75, 17)
Global $VcRedist = GUICtrlCreateCheckbox("VcRedist", 310, 90, 65, 17)
Global $Farm_Mania = GUICtrlCreateCheckbox("Farm Mania", 380, 330, 75, 17)
Global $Farm_Mania_2 = GUICtrlCreateCheckbox("Farm Mania 2", 380, 350, 95, 17)
Global $Farm_Mania_Hot_V = GUICtrlCreateCheckbox("Farm Mania Hot V", 380, 370, 105, 17)
Global $Plant_Vs_Zomb = GUICtrlCreateCheckbox("Plant Vs Zomb", 380, 390, 85, 17)
Global $Verif = GUICtrlCreateCheckbox("Verif", 370, 115, 45, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
GUICtrlSetBkColor(-1, 0xFF0000)
Global $Framework461 = GUICtrlCreateCheckbox("Framework 4.6.1", 20, 290, 99, 17)
Global $PaintNET = GUICtrlCreateCheckbox("PaintNET", 310, 150, 75, 17)
Global $Gen_Zero = GUICtrlCreateCheckbox("Gen-Zero", 380, 410, 75, 17)
Global $Checkbox1 = GUICtrlCreateCheckbox("Desinstalar Autoit", 510, 460, 75, 17)
Global $Checkbox2 = GUICtrlCreateCheckbox("Desinstalar Autoit", 510, 460, 75, 17)
Global $Checkbox3 = GUICtrlCreateCheckbox("Desinstalar Autoit", 510, 460, 75, 17)
Global $Checkbox6 = GUICtrlCreateCheckbox("Desinstalar Autoit", 530, 490, 75, 17)
Global $Checkbox7 = GUICtrlCreateCheckbox("Desinstalar Autoit", 530, 510, 75, 17)
Global $Checkbox8 = GUICtrlCreateCheckbox("Desinstalar Autoit", 530, 510, 75, 17)
Global $GrupoFinalizar = GUICtrlCreateGroup("Finalizar", 420, 60, 81, 144)
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $GrupoDesinfeccion = GUICtrlCreateGroup("Desinfeccion", 420, 440, 80, 95)
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $GrupoSincro = GUICtrlCreateGroup("Primero Actualizar", 310, 440, 105, 95)
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $Herramientas = GUICtrlCreateGroup("Herramientas", 510, 22, 81, 428)
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $Devmgmt = GUICtrlCreateButton("Devmgmt", 520, 252, 55, 25)
Global $Panel = GUICtrlCreateButton("Panel", 520, 222, 55, 25)
Global $Programas = GUICtrlCreateButton("Programas", 520, 282, 55, 25)
Global $BotonCorrer = GUICtrlCreateButton("Correr", 20, 480, 75, 25)
Global $Sonido = GUICtrlCreateButton("Sonido", 430, 80, 55, 25)
Global $Verificar = GUICtrlCreateButton("Verificar", 430, 110, 55, 25)
Global $BotonSalir = GUICtrlCreateButton("Salir", 20, 510, 75, 25)
Global $Desinfec = GUICtrlCreateButton("Desinfec", 432, 460, 55, 25)
Global $Limpieza = GUICtrlCreateButton("Limpieza", 432, 140, 55, 25)
Global $Borrar = GUICtrlCreateButton("Borrar", 432, 170, 55, 25)
Global $Sincro = GUICtrlCreateButton("Sincro", 330, 460, 75, 25)
Global $OculExt = GUICtrlCreateButton("OculExt", 520, 416, 55, 25)
Global $MostExt = GUICtrlCreateButton("MostExt", 520, 386, 55, 25)
Global $Appwiz = GUICtrlCreateButton("Appwiz", 520, 132, 55, 25)
Global $CentSegur = GUICtrlCreateButton("CentSegur", 520, 102, 55, 25)
Global $Msconfig = GUICtrlCreateButton("Msconfig", 520, 72, 55, 25)
Global $CorrOffice = GUICtrlCreateButton("CorrOffice", 520, 42, 55, 25)
Global $Deselec = GUICtrlCreateButton("Deselec", 410, 20, 55, 25)
Global $Def_7 = GUICtrlCreateButton("Def 7", 340, 20, 55, 25)
Global $Def_XP = GUICtrlCreateButton("Def XP", 270, 20, 55, 25)
Global $TUapp = GUICtrlCreateButton("T U app", 520, 162, 55, 25)
Global $CInstallr = GUICtrlCreateButton("C.Installr", 520, 312, 55, 25)
Global $Label1 = GUICtrlCreateLabel("Hay algo mal instalado", 110, 515, 185, 24)
GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)
Global $Label3 = GUICtrlCreateLabel("Tam.Backup:", 110, 490, 84, 20)
GUICtrlSetFont(-1, 11, 400, 0, "MS Sans Serif")
Global $TamBack = GUICtrlCreateLabel("-sin calcular-", 195, 490, 79, 20)
GUICtrlSetFont(-1, 11, 400, 0, "MS Sans Serif")
Global $FALTA = GUICtrlCreateButton("FALTA", 520, 344, 55, 25)
Global $EspacDisco = GUICtrlCreateLabel("-sin calcular-", 195, 470, 79, 20)
GUICtrlSetFont(-1, 11, 400, 0, "MS Sans Serif")
Global $Label2 = GUICtrlCreateLabel("Espac Disco:", 110, 470, 84, 20)
GUICtrlSetFont(-1, 11, 400, 0, "MS Sans Serif")
Global $Bup = GUICtrlCreateButton("Bup", 275, 476, 25, 25)
Global $Bulkcrap = GUICtrlCreateButton("Bulkcrap", 520, 192, 55, 25)
Global $NROPC = GUICtrlCreateInput("NROPC", 235, 40, 21, 21)
GUICtrlSetLimit(-1, 1)
Global $Label4 = GUICtrlCreateLabel("PC00", 200, 44, 34, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

GUICtrlSetState($Label1,32)
;~ GUICtrlSetData($EspacDisco,'Leyendo')
;~ GUICtrlSetData($TamBack,'Leyendo')


sacarestados()
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $BotonSalir
			ProcessClose('AutoIt3.exe')
			Exit
		Case $BotonCorrer

			ponerestados()
			MsgBox(0,'','Largamos, cancela o dale para adelante')
			ShellExecute('ventrun.exe')
			if GUICtrlRead ($NROPC) <> 0 then MsgBox(0,'','')

			if GUICtrlRead ($Autoit)=1 then Autoit()
			if GUICtrlRead ($Sistema_inicio)=1 then Sistema_inicio()

			if GUICtrlRead ($Copiar_que_hacer)=1 then Copiar_que_hacer()
			if GUICtrlRead ($FDM)=1 then FDM()
			if GUICtrlRead ($Installrite)=1 then Installrite()
			if GUICtrlRead ($DllSuite)=1 then DllSuite()
			if GUICtrlRead ($Rest_Drivers)=1 then Rest_Drivers()

			if GUICtrlRead ($Validar_XP)=1 then Validar_XP()
			if GUICtrlRead ($Actualizar_W7)=1 then Actualizar_W7()
			if GUICtrlRead ($Actualizar_XP)=1 then Actualizar_XP()
			if GUICtrlRead ($Drivers)=1 then Drivers()
			if GUICtrlRead ($DirectX)=1 then DirectX()

;~ ---------------------------------------------------------------------------
			if GUICtrlRead ($Framework1_1)=1 then NET_Framework_1_1()
			if GUICtrlRead ($Framework3_5)=1 then NET_Framework_3_5()
			if GUICtrlRead ($Framework4)=1 then NET_Framework_4()
			if GUICtrlRead ($Framework461)=1 then NET_Framework_461()

			if GUICtrlRead ($VcRedist)=1 then VcRedist()


			if GUICtrlRead ($Backupdrivers)=1 then Backupdrivers()
			if GUICtrlRead ($Tuneup_2k8)=1 then Tuneup_2k8()
			if GUICtrlRead ($Tuneup_2k10)=1 then Tuneup_2k10()
			if GUICtrlRead ($Total_Commander)=1 then Total_Commander()
			if GUICtrlRead ($Chrome)=1 then Chrome()
			if GUICtrlRead ($AdBlock)=1 then Adblock()

			if GUICtrlRead ($Firefox)=1 then Firefox()
			if GUICtrlRead ($Internet_Explorer_8)=1 then Internet_Explorer_8()
			if GUICtrlRead ($WMP_11)=1 then WMP_11()
			if GUICtrlRead ($Java)=1 then Java()
			if GUICtrlRead ($Ares)=1 then Ares()
			if GUICtrlRead ($CDex)=1 then CDex()
			if GUICtrlRead ($Skype)=1 then Skype()
			if GUICtrlRead ($Deluge)=1 then Deluge()
			if GUICtrlRead ($GSpot)=1 then GSpot()
			if GUICtrlRead ($DamnNFO)=1 then DamnNFO()
			if GUICtrlRead ($PaintNET)=1 then PaintNET()



			if GUICtrlRead ($Unlocker)=1 then Unlocker()
			if GUICtrlRead ($Foxit_Reader)=1 then Foxit_Reader()
			if GUICtrlRead ($PDFLite)=1 then PDFLite()
			if GUICtrlRead ($ImgBurn)=1 then ImgBurn()
			if GUICtrlRead ($CDBurnerXP)=1 then CDBurnerXP()
			if GUICtrlRead ($Mbam)=1 then Mbam()
			if GUICtrlRead ($Office_2003)=1 then Office_2003()
			if GUICtrlRead ($Office_2007)=1 then Office_2007()

			if GUICtrlRead ($CorrerDLL)=1 then Correr_DLL()
			if GUICtrlRead ($Office_2010)=1 then Office_2010()

			if GUICtrlRead ($Letasoft_Sound_Booster)=1 then Letasoft_Sound_Booster()
			if GUICtrlRead ($Winrar)=1 then Winrar()
			if GUICtrlRead ($World_of_Goo)=1 then World_of_Goo()
			if GUICtrlRead ($Ra2YrMo)=1 then Ra2YrMo()
			if GUICtrlRead ($Gen_Zero)=1 then Gen_Zero()

			if GUICtrlRead ($DukeNukemMP)=1 then DukeNukemMP()
			if GUICtrlRead ($Mex_Motor_Mafia)=1 then Mex_Motor_Mafia()
			if GUICtrlRead ($Juegos_Consolas)=1 then Juegos_Consolas()
			if GUICtrlRead ($Counter_Strike)=1 then Counter_Strike()
			if GUICtrlRead ($Farm_Mania)=1 then Farm_Mania()
			if GUICtrlRead ($Farm_Mania_2)=1 then Farm_Mania_2()
			if GUICtrlRead ($Farm_Mania_Hot_V)=1 then Farm_Mania_Hot_V()
			if GUICtrlRead ($Plant_Vs_Zomb)=1 then Plant_Vs_Zomb()

			if GUICtrlRead ($DToolsLite)=1 then DaemonToolsLite()
			if GUICtrlRead ($Ultraiso)=1 then Ultraiso()

;~ ---------------------------------------------------------------------------
			if GUICtrlRead ($Nero_7)=1 then Nero_7()
			if GUICtrlRead ($K_lite)=1 then K_lite()
			if GUICtrlRead ($Winamp)=1 then Winamp()

			if GUICtrlRead ($Nod_32)=1 then Nod_32()
			if GUICtrlRead ($maconfig)=1 then maconfig()
			if GUICtrlRead ($Sistema_final)=1 then Sistema_final()
			if GUICtrlRead ($Extensiones)=1 then Extensiones()

			if GUICtrlRead ($DesinstalarMbam)=1 then DesinstalarMbam()
			if GUICtrlRead ($Desinstalar_FDM)=1 then Desinstalar_FDM()
			if GUICtrlRead ($DesInstallrite)=1 then DesInstallrite()
			if GUICtrlRead ($DesDllSuite)=1 then Des_DllSuite()


			if GUICtrlRead ($Verif)=1 then Verificar()
			if GUICtrlRead ($Validar_W7)=1 then Validar_W7()

			if GUICtrlRead ($DesAutoit)=1 then DesinstalarAutoit()
			ProcessClose('ventrun.exe')
			sacarestados()

		Case $Limpieza
			Limpieza()
		Case $FALTA
			ShellExecute(ruta()&'\Falta.txt')
		Case $Sincro
			if GUICtrlRead ($Sinc_Nod_32)=1 then Sinc_Nod_32()
			if GUICtrlRead ($Sinc_Mbam)=1 then Sinc_Mbam()
		Case $Desinfec
			if GUICtrlRead ($DMbam)=1 then DMbam()
			if GUICtrlRead ($Dnod)=1 then Dnod()
		Case $Borrar
			Borrar()
		Case $Panel
			ShellExecute('control.exe')
		Case $CInstallr
			if FileExists(@ProgramFilesDir & '\Epsilon Squared\InstallRite\InstallRite.exe') Then ShellExecute (@ProgramFilesDir & '\Epsilon Squared\InstallRite\InstallRite.exe')
		Case $TUapp
			if FileExists(@ProgramFilesDir & '\TuneUp Utilities 2008\UninstallManager.exe') Then
				ShellExecute (@ProgramFilesDir & '\TuneUp Utilities 2008\UninstallManager.exe')
			Elseif FileExists(@ProgramFilesDir & '\TuneUp Utilities 2010\UninstallManager.exe') Then
				ShellExecute (@ProgramFilesDir & '\TuneUp Utilities 2010\UninstallManager.exe')
			EndIf
		Case $Appwiz
			while ProcessExists('rundll32.exe')
				ProcessClose('rundll32.exe')
			WEnd
			While WinExists('Programas y características','Para desinstalar un programa, selecciónelo')
				WinClose('Programas y características','Para desinstalar un programa, selecciónelo')
			WEnd
			ShellExecute('appwiz.cpl')
		Case $CorrOffice
			CorrOffice()
		Case $Msconfig
			ShellExecute('msconfig')
		Case $CentSegur
			if @OSVersion = 'WIN_XP' Then ShellExecute('WSCUI.CPL')
			if @OSVersion = 'WIN_7' Then ShellExecute('control',' wuaucpl.cpl')
		Case $OculExt
			OculExt()
		Case $MostExt
			MostExt()
		Case $Devmgmt
			ShellExecute('devmgmt.msc')
		Case $Sonido
			Sonido()
		Case $Bulkcrap
			ShellExecute('Bulk Crap Uninstaller\Bulk Crap Uninstaller portable\BCUninstaller.exe')

		Case $Verificar
			Verificar()
		Case $Programas
			Programas(ruta())
		Case $Bup
			GUICtrlSetData($EspacDisco,'-calculando-')
			GUICtrlSetData($TamBack,'-calculando-')
			GUICtrlSetData($EspacDisco,espaciodisco())
			GUICtrlSetData($TamBack,tamanobackup())
			if $EspacDisco < $TamBack then GUICtrlSetColor($EspacDisco,0xFF0000)
			if $EspacDisco > $TamBack then GUICtrlSetColor($EspacDisco,0x00cF00)
		Case $Office_2003
			if GUICtrlRead ($Office_2003)=1 then
				ControlCommand('GUI','','Button12','uncheck')
				ControlCommand('GUI','','Button14','uncheck')
			EndIf

		Case $Office_2007
			if GUICtrlRead ($Office_2007)=1 then
				ControlCommand('GUI','','Button11','uncheck')
				ControlCommand('GUI','','Button14','uncheck')
			EndIf

		Case $Office_2010
			if GUICtrlRead ($Office_2010)=1 then
				ControlCommand('GUI','','Button11','uncheck')
				ControlCommand('GUI','','Button12','uncheck')
			EndIf
		Case $PaintNET
			if GUICtrlRead ($PaintNET)=1 then
				ControlCommand('GUI','','Button75','check')
;~ 				GUICtrlSetState('Framework 4.6.1',$GUI_CHECKED);('GUI','','Button12','uncheck')
			EndIf
		Case $Mex_Motor_Mafia
			if GUICtrlRead ($Mex_Motor_Mafia)=1 then
				ControlCommand('GUI','DirectX','Button33','check')
			EndIf

		Case $Nod_32
			if GUICtrlRead ($Nod_32)=1 and @OSVersion='WIN_XP' then
				ControlCommand('GUI','NET Framework 3-5','Button22','check')
			EndIf
		Case $Nero_7
			if GUICtrlRead ($Nero_7)=1 then
				ControlCommand('GUI','DirectX','Button33','check')
			EndIf
		Case $Def_XP
			for $i = 0 to 80 step 1
				if $i<>7 and $i<>56 and $i<>63 and $i<>64 and $i<>57 and $i<>58 and $i<>44 and $i<>43 and $i<>11 and $i<>14 and $i<>50 and $i<>35 and $i<>37 and $i<>27 and $i<>46 and $i<>47 and $i<>49 and $i<>26 and $i<>29 and $i<>11 and $i<>83 and $i<>40 and $i<>51 and $i<>13 and $i<>38 and $i<>6 and $i<>36	Then
					ControlCommand('GUI','','Button' & $i,'check')
				EndIf
			Next
		Case $Def_7
			for $i = 0 to 80 step 1
				if $i<>7 and $i<>44 and $i<>63 and $i<>64 and $i<>57 and $i<>58 and $i<>47 and $i<>24 and $i<>26 and $i<>28 and $i<>33 and $i<>21 and $i<>22 and $i<>23 and $i<>35 and $i<>37 and $i<>11 and $i<>12 and $i<>39 and $i<>13 and $i<>36 and $i<>38 and $i<>49 and $i<>6 and $i<>43 and $i<>46 then
					ControlCommand('GUI','','Button' & $i,'check')
				EndIf
			Next
		Case $Deselec
			for $i = 0 to 80 step 1
					ControlCommand('GUI','','Button' & $i,'uncheck')
			Next
	EndSwitch
WEnd


Func ponerestados()
	GUICtrlSetState($Label1,32)

	GUICtrlSetState ($Autoit,128)
	GUICtrlSetState ($Chrome,128)
	GUICtrlSetState ($Firefox,128)
	GUICtrlSetState ($ImgBurn,128)
	GUICtrlSetState ($CDBurnerXP,128)
	GUICtrlSetState ($DesAutoit,128)
	GUICtrlSetState ($BotonCorrer,128)
	GUICtrlSetState ($BotonSalir,128)
	GUICtrlSetState ($Internet_Explorer_8,128)
	GUICtrlSetState ($Java,128)
	GUICtrlSetState ($K_lite,128)
	GUICtrlSetState ($Mbam,128)
	GUICtrlSetState ($Office_2003,128)
	GUICtrlSetState ($Office_2007,128)
	GUICtrlSetState ($DesinstalarMbam,128)
	GUICtrlSetState ($Office_2010,128)
	GUICtrlSetState ($Letasoft_Sound_Booster,128)
	GUICtrlSetState ($World_of_Goo,128)
	GUICtrlSetState ($Winrar,128)
	GUICtrlSetState ($Sistema_inicio,128)
	GUICtrlSetState ($Sistema_final,128)
	GUICtrlSetState ($Nod_32,128)
	GUICtrlSetState ($Framework1_1,128)
	GUICtrlSetState ($Framework3_5,128)
	GUICtrlSetState ($Framework4,128)
	GUICtrlSetState ($Validar_W7,128)
	GUICtrlSetState ($Validar_XP,128)
	GUICtrlSetState ($Drivers,128)
	GUICtrlSetState ($Actualizar_XP,128)
	GUICtrlSetState ($Actualizar_W7,128)
	GUICtrlSetState ($WMP_11,128)
	GUICtrlSetState ($Foxit_Reader,128)
	GUICtrlSetState ($PDFLite,128)
	GUICtrlSetState ($Total_Commander,128)
	GUICtrlSetState ($Unlocker,128)
	GUICtrlSetState ($DirectX,128)
	GUICtrlSetState ($Copiar_que_hacer,128)
	GUICtrlSetState ($FDM,128)
	GUICtrlSetState ($Desinstalar_FDM,128)
	GUICtrlSetState ($Installrite,128)
	GUICtrlSetState ($DesInstallrite,128)
	GUICtrlSetState ($Tuneup_2k8,128)
	GUICtrlSetState ($Tuneup_2k10,128)
	GUICtrlSetState ($Winamp,128)
	GUICtrlSetState ($maconfig,128)
	GUICtrlSetState ($Def_XP,128)
	GUICtrlSetState ($Def_7,128)
	GUICtrlSetState ($Deselec,128)
	GUICtrlSetState ($Sinc_Nod_32,128)
	GUICtrlSetState ($Sinc_Mbam,128)
	GUICtrlSetState ($Juegos_Consolas,128)
	GUICtrlSetState ($Extensiones,128)
	GUICtrlSetState ($Limpieza,128)
	GUICtrlSetState ($Desinfec,128)
	GUICtrlSetState ($Borrar,128)
	GUICtrlSetState ($DMbam,128)
	GUICtrlSetState ($Dnod,128)
	GUICtrlSetState ($DllSuite,128)
	GUICtrlSetState ($DesDllSuite,128)
	GUICtrlSetState ($CorrerDLL,128)
	GUICtrlSetState ($Ares,128)
	GUICtrlSetState ($CDex,128)
	GUICtrlSetState ($Skype,128)
	GUICtrlSetState ($DToolsLite,128)
	GUICtrlSetState ($Ra2YrMo,128)
	GUICtrlSetState ($Sonido,128)
	GUICtrlSetState ($Verificar,128)
	GUICtrlSetState ($Sincro,128)
	GUICtrlSetState ($CorrOffice,128)
	GUICtrlSetState ($Msconfig,128)
	GUICtrlSetState ($CentSegur,128)
	GUICtrlSetState ($Appwiz,128)
	GUICtrlSetState ($Panel,128)
	GUICtrlSetState ($Devmgmt,128)
	GUICtrlSetState ($Programas,128)
	GUICtrlSetState ($MostExt,128)
	GUICtrlSetState ($OculExt,128)
	GUICtrlSetState ($Ultraiso,128)
	GUICtrlSetState ($DukeNukemMP,128)
	GUICtrlSetState ($Deluge,128)
	GUICtrlSetState ($TUapp,128)
	GUICtrlSetState ($CInstallr,128)
	GUICtrlSetState ($Nero_7,128)
	GUICtrlSetState ($Mex_Motor_Mafia,128)
	GUICtrlSetState ($Backupdrivers,128)
	GUICtrlSetState ($Rest_Drivers,128)
	GUICtrlSetState ($Counter_Strike,128)
	GUICtrlSetState ($FALTA,128)
	GUICtrlSetState ($AdBlock,128)
	GUICtrlSetState ($VcRedist,128)
	GUICtrlSetState ($DamnNFO,128)
	GUICtrlSetState ($Farm_Mania,128)
	GUICtrlSetState ($Farm_Mania_2,128)
	GUICtrlSetState ($Farm_Mania_Hot_V,128)
	GUICtrlSetState ($Plant_Vs_Zomb,128)
	GUICtrlSetState ($GSpot,128)
	GUICtrlSetState ($Bulkcrap,128)
	GUICtrlSetState ($Bup,128)
	GUICtrlSetState ($Framework461,128)
	GUICtrlSetState ($Gen_Zero,128)
	GUICtrlSetState ($PaintNET,128)

EndFunc

Func sacarestados()

if FileExists(@DesktopDir & "\Mal Instalado.txt") then GUICtrlSetState($Label1,16)

	GUICtrlSetState ($Autoit,64)
	GUICtrlSetState ($Chrome,64)
	GUICtrlSetState ($Firefox,64)
	GUICtrlSetState ($ImgBurn,64)
	GUICtrlSetState ($CDBurnerXP,64)
	GUICtrlSetState ($DesAutoit,64)
	GUICtrlSetState ($BotonCorrer,64)
	GUICtrlSetState ($BotonSalir,64)
	GUICtrlSetState ($Internet_Explorer_8,64)
	GUICtrlSetState ($Java,64)
	GUICtrlSetState ($K_lite,64)
	GUICtrlSetState ($Mbam,64)
	GUICtrlSetState ($Office_2003,64)
	GUICtrlSetState ($Office_2007,64)
	GUICtrlSetState ($DesinstalarMbam,64)
	GUICtrlSetState ($Office_2010,64)
	GUICtrlSetState ($Letasoft_Sound_Booster,64)
	GUICtrlSetState ($World_of_Goo,64)
	GUICtrlSetState ($Winrar,64)
	GUICtrlSetState ($Sistema_inicio,64)
	GUICtrlSetState ($Sistema_final,64)
	GUICtrlSetState ($Nod_32,64)
	GUICtrlSetState ($Framework1_1,64)
	GUICtrlSetState ($Framework3_5,64)
	GUICtrlSetState ($Framework4,64)
	GUICtrlSetState ($Validar_W7,64)
	GUICtrlSetState ($Validar_XP,64)
	GUICtrlSetState ($Drivers,64)
	GUICtrlSetState ($Actualizar_XP,64)
	GUICtrlSetState ($Actualizar_W7,64)
	GUICtrlSetState ($WMP_11,64)
	GUICtrlSetState ($Foxit_Reader,64)
	GUICtrlSetState ($PDFLite,64)
	GUICtrlSetState ($Total_Commander,64)
	GUICtrlSetState ($Unlocker,64)
	GUICtrlSetState ($DirectX,64)
	GUICtrlSetState ($Copiar_que_hacer,64)
	GUICtrlSetState ($FDM,64)
	GUICtrlSetState ($Desinstalar_FDM,64)
	GUICtrlSetState ($Installrite,64)
	GUICtrlSetState ($DesInstallrite,64)
	GUICtrlSetState ($Tuneup_2k8,64)
	GUICtrlSetState ($Tuneup_2k10,64)
	GUICtrlSetState ($Winamp,64)
	GUICtrlSetState ($maconfig,64)
	GUICtrlSetState ($Def_XP,64)
	GUICtrlSetState ($Def_7,64)
	GUICtrlSetState ($Deselec,64)
	GUICtrlSetState ($Sinc_Nod_32,64)
	GUICtrlSetState ($Sinc_Mbam,64)
	GUICtrlSetState ($Juegos_Consolas,64)
	GUICtrlSetState ($Extensiones,64)
	GUICtrlSetState ($Limpieza,64)
	GUICtrlSetState ($Desinfec,64)
	GUICtrlSetState ($Borrar,64)
	GUICtrlSetState ($DMbam,64)
	GUICtrlSetState ($Dnod,64)
	GUICtrlSetState ($DllSuite,64)
	GUICtrlSetState ($DesDllSuite,64)
	GUICtrlSetState ($CorrerDLL,64)
	GUICtrlSetState ($Ares,64)
	GUICtrlSetState ($CDex,64)
	GUICtrlSetState ($Skype,64)
	GUICtrlSetState ($DToolsLite,64)
	GUICtrlSetState ($Ra2YrMo,64)
	GUICtrlSetState ($Sonido,64)
	GUICtrlSetState ($Verificar,64)
	GUICtrlSetState ($Sincro,64)
	GUICtrlSetState ($CorrOffice,64)
	GUICtrlSetState ($Msconfig,64)
	GUICtrlSetState ($CentSegur,64)
	GUICtrlSetState ($Appwiz,64)
	GUICtrlSetState ($Panel,64)
	GUICtrlSetState ($Devmgmt,64)
	GUICtrlSetState ($Programas,64)
	GUICtrlSetState ($MostExt,64)
	GUICtrlSetState ($OculExt,64)
	GUICtrlSetState ($Ultraiso,64)
	GUICtrlSetState ($DukeNukemMP,64)
	GUICtrlSetState ($Deluge,64)
	GUICtrlSetState ($TUapp,64)
	GUICtrlSetState ($CInstallr,64)
	GUICtrlSetState ($Nero_7,64)
	GUICtrlSetState ($Mex_Motor_Mafia,64)
	GUICtrlSetState ($Backupdrivers,64)
	GUICtrlSetState ($Rest_Drivers,64)
	GUICtrlSetState ($Counter_Strike,64)
	GUICtrlSetState ($FALTA,64)
	GUICtrlSetState ($AdBlock,64)
	GUICtrlSetState ($VcRedist,64)
	GUICtrlSetState ($DamnNFO,64)
	GUICtrlSetState ($Farm_Mania,64)
	GUICtrlSetState ($Farm_Mania_2,64)
	GUICtrlSetState ($Farm_Mania_Hot_V,64)
	GUICtrlSetState ($Plant_Vs_Zomb,64)
	GUICtrlSetState ($GSpot,64)
	GUICtrlSetState ($Bulkcrap,64)
	GUICtrlSetState ($Bup,64)
	GUICtrlSetState ($Framework461,64)
	GUICtrlSetState ($Gen_Zero,64)
	GUICtrlSetState ($PaintNET,64)

EndFunc




Func Autoit()
	ShellExecuteWait('Auto.exe','','Autoit')
EndFunc
Func DesinstalarAutoit()
	ShellExecuteWait('Autoit\Desinstalar.exe')
EndFunc
Func Chrome()
	ShellExecuteWait('AutoIt3.exe',"chrome.au3", "chrome")
EndFunc
Func Firefox()
	ShellExecuteWait('AutoIt3.exe',"Firefox.au3", "Firefox")
EndFunc
Func ImgBurn()
	ShellExecuteWait('AutoIt3.exe',"Imgb.au3", "ImgBurn_2.5.8.0")
EndFunc
Func Internet_Explorer_8()
	ShellExecuteWait('AutoIt3.exe',"IE8.au3", "Internet Explorer 8")
EndFunc
Func Java()
	ShellExecuteWait('AutoIt3.exe',"Java.au3", "Java")
EndFunc
Func K_lite()
	ShellExecuteWait('AutoIt3.exe',"Klite1095.au3", "K lite")
EndFunc
Func Mbam()
	ShellExecuteWait('AutoIt3.exe',"mbam.au3", "Malwarebytes anti Malware")
EndFunc
Func Office_2003()
	ShellExecuteWait('AutoIt3.exe',"Office2K3.au3", "Microsoft Office 2003")
EndFunc
Func Office_2007()
	ShellExecuteWait('AutoIt3.exe',"office2k7.au3", "Microsoft Office 2007")
EndFunc
Func DesinstalarMbam()
	ShellExecuteWait('AutoIt3.exe',"desinstalarmbam.au3", "Malwarebytes anti Malware")
EndFunc
Func Office_2010()
	ShellExecuteWait('AutoIt3.exe',"Office2k10.au3", "Microsoft Office 2010")
EndFunc
Func Letasoft_Sound_Booster()
	ShellExecuteWait('AutoIt3.exe',"LetaSound.au3", "Letasoft Sound Booster")
EndFunc
Func Winrar()
	ShellExecuteWait('AutoIt3.exe',"Wrar4.au3", "winrar 4")
EndFunc
Func World_of_Goo()
	ShellExecuteWait('AutoIt3.exe',"goo.au3", "World of Goo")
EndFunc
Func CDBurnerXP()
	ShellExecuteWait('AutoIt3.exe',"CdBurner.au3", "CdBurnerXP")
EndFunc
Func Sistema_inicio()
	ShellExecuteWait('AutoIt3.exe',"Sistemainicio.au3", "Modificaciones Sistema")
EndFunc
Func Sistema_final()
	ShellExecuteWait('AutoIt3.exe',"sistemafinal.au3", "Modificaciones Sistema")
EndFunc
Func Nod_32()
	ShellExecuteWait('AutoIt3.exe',"Nod32.au3", "Nod 32")
EndFunc
Func NET_Framework_1_1()
	ShellExecuteWait('AutoIt3.exe',"Net1-1.au3", "Net framework 1.1")
EndFunc
Func NET_Framework_3_5()
	ShellExecuteWait('AutoIt3.exe',"Net3-5.au3", "Net framework 3.5")
EndFunc
Func NET_Framework_4()
	ShellExecuteWait('AutoIt3.exe',"Net4.au3", "Net framework 4")
EndFunc
Func NET_Framework_461()
	ShellExecuteWait('AutoIt3.exe',"Net4.6.1.au3", "Net framework 4.6.1")
EndFunc
Func Validar_W7()
	ShellExecuteWait('AutoIt3.exe',"ValidarW7.au3", "Validar W7")
EndFunc
Func Validar_XP()
	ShellExecuteWait('AutoIt3.exe',"ValidarXP.au3", "Validar XP")
EndFunc
Func Drivers()
	ShellExecuteWait('AutoIt3.exe',"Drivers.au3", "Drivers")
EndFunc
Func Actualizar_W7()
	ShellExecuteWait('AutoIt3.exe',"ActualizW7.au3", "Actualiz x86 W7")
EndFunc
Func Actualizar_XP()
	ShellExecuteWait('AutoIt3.exe',"ActualizacionesXP.au3", "Actualizaciones XP X86")
EndFunc
Func WMP_11()
	ShellExecuteWait('AutoIt3.exe',"WMP11.au3", "Windows Media Player 11")
EndFunc
Func Foxit_Reader()
	ShellExecuteWait('AutoIt3.exe',"Foxit.au3", "Foxit reader")
EndFunc
Func PDFLite()
	ShellExecuteWait('AutoIt3.exe',"Pdflite.au3", "PDFLite 2.0")
EndFunc
Func Total_Commander()
	ShellExecuteWait('AutoIt3.exe',"TotalCMD.au3", "Total Commander")
EndFunc
Func Unlocker()
	ShellExecuteWait('AutoIt3.exe',"Unlocker192.au3", "Unlocker")
EndFunc
Func DirectX()
	ShellExecuteWait('AutoIt3.exe',"DirX.au3", "Direct X")
EndFunc
Func Copiar_que_hacer()
	FileCopy('QUE HACER EN PC.txt',@DesktopDir)
	FileCopy('QUE HACER EN PC nuevo.txt',@DesktopDir)
EndFunc
Func Installrite()
	ShellExecuteWait('AutoIt3.exe',"installrite.au3", "Installrite")
EndFunc
Func FDM()
	ShellExecuteWait('AutoIt3.exe',"fdm.au3", "free download manager")
EndFunc
Func Desinstalar_FDM()
	ShellExecuteWait('AutoIt3.exe',"desinstalar.au3", "free download manager")
EndFunc
Func DesInstallrite()
	ShellExecuteWait('AutoIt3.exe',"desinsinstallrite.au3", "Installrite")
EndFunc
Func Tuneup_2k8()
	ShellExecuteWait('AutoIt3.exe',"TU2008Trial.au3", "tuneup 2008")
EndFunc
Func Tuneup_2k10()
	ShellExecuteWait('AutoIt3.exe',"TU2010.au3", "TuneUp 2010")
EndFunc
Func Winamp()
	ShellExecuteWait('AutoIt3.exe',"Winamp.au3", "Winamp")
EndFunc
Func maconfig()
	ShellExecuteWait('AutoIt3.exe',"maconfig.au3", "maconfig")
EndFunc
Func Sinc_Nod_32()
	ShellExecuteWait('AutoIt3.exe',"Sincronod.au3", "Nod 32")
EndFunc
Func Sinc_Mbam()
	ShellExecuteWait('AutoIt3.exe',"Sincrombam.au3", "Malwarebytes anti Malware")
EndFunc
Func Extensiones()
	ShellExecuteWait('AutoIt3.exe',"Xtensiones.au3", "Extensiones")
EndFunc
Func Limpieza()
	ShellExecute('AutoIt3.exe',"Limpieza.au3", "Modificaciones Sistema")
	sleep(2000)
EndFunc
Func DMbam()
	ShellExecuteWait('AutoIt3.exe',"Desinfmbam.au3", "Modificaciones Sistema")
EndFunc
Func Dnod()
	ShellExecuteWait('AutoIt3.exe',"Desinfnod.au3", "Modificaciones Sistema")
EndFunc

Func Borrar()
	FileDelete (@DesktopDir & "\Bien Instalado.txt")
	FileDelete (@DesktopDir & "\Bien Verificado.txt")
	FileDelete (@DesktopDir & "\Mal Instalado.txt")
	FileDelete (@DesktopDir & "\Menu.lnk")
	FileDelete (@DesktopDir & "\adblock-plus arrastrar en pestaña extensiones.crx")
	FileDelete (@DesktopDir & "\Configuration.mc")

	RegDelete('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','MSConfig')

	if FileExists(@UserProfileDir&'\Mis documentos\Downloads') then ShellExecute(@UserProfileDir&'\Mis documentos\Downloads')
	if FileExists(@UserProfileDir&'\Mis documentos\Descargas') then ShellExecute(@UserProfileDir&'\Mis documentos\Descargas')
	if FileExists(@UserProfileDir&'\Downloads') then ShellExecute(@UserProfileDir&'\Downloads')
	if FileExists(@HomeDrive&'\Downloads') then ShellExecute(@HomeDrive&'\Downloads')

	ShellExecuteWait('AutoIt3.exe',"limpiarchrome.au3", "Modificaciones Sistema")
EndFunc
Func Juegos_Consolas()
	ShellExecuteWait('AutoIt3.exe',"Consolas.au3", "Juegos consolas")
EndFunc
Func CorrOffice()
	if FileExists(@ProgramFilesDir & "\Microsoft Office\Office14\WINWORD.EXE") Then
		ShellExecute(@ProgramFilesDir & "\Microsoft Office\Office14\WINWORD.EXE")
	Else
		if FileExists(@ProgramFilesDir & "\Microsoft Office\Office12\WINWORD.EXE") Then
			ShellExecute(@ProgramFilesDir & "\Microsoft Office\Office12\WINWORD.EXE")
		EndIf
	EndIf
EndFunc
Func OculExt()
RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced','Hidden','REG_DWORD',2)
RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced','HideFileExt','REG_DWORD',1)
RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced','SuperHidden','REG_DWORD',1)
RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced','ShowSuperHidden','REG_DWORD',0)
EndFunc
Func MostExt()
RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced','Hidden','REG_DWORD',1)
RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced','HideFileExt','REG_DWORD',0)
RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced','SuperHidden','REG_DWORD',0)
RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced','ShowSuperHidden','REG_DWORD',1)
EndFunc
Func Sonido()
	SoundPlay('Modificaciones Sistema\Apagado de Windows XP.wav', 1)
EndFunc
func ruta()
	$C = ('C:\Programas y tutoriales')
	$D = ('D:\Programas y tutoriales')
	$E = ('E:\Programas y tutoriales')
	$F = ('F:\Programas y tutoriales')
	$G = ('G:\Programas y tutoriales')
	$H = ('H:\Programas y tutoriales')
	$I = ('I:\Programas y tutoriales')
	$J = ('J:\Programas y tutoriales')
	$K = ('K:\Programas y tutoriales')
	$L = ('L:\Programas y tutoriales')
	$M = ('M:\Programas y tutoriales')
	$N = ('N:\Programas y tutoriales')
	$O = ('O:\Programas y tutoriales')
	$P = ('P:\Programas y tutoriales')
	$Q = ('Q:\Programas y tutoriales')
	if DriveStatus ("C:") <> 'NOTREADY' and  FileExists($C) Then
		$ruta = ($C)
	EndIf
	if DriveStatus ("D:") <> 'NOTREADY' and  FileExists($D) Then
		$ruta = ($D)
	EndIf
	if DriveStatus ("E:") <> 'NOTREADY' and  FileExists($E) Then
		$ruta = ($E)
	EndIf
	if DriveStatus ("F:") <> 'NOTREADY' and  FileExists($F) Then
		$ruta = ($F)
	EndIf
	if DriveStatus ("G:") <> 'NOTREADY' and  FileExists($G) Then
		$ruta = ($G)
	EndIf
	if DriveStatus ("H:") <> 'NOTREADY' and  FileExists($H) Then
		$ruta = ($H)
	EndIf
	if DriveStatus ("I:") <> 'NOTREADY' and  FileExists($I) Then
		$ruta = ($I)
	EndIf
	if DriveStatus ("J:") <> 'NOTREADY' and  FileExists($J) Then
		$ruta = ($J)
	EndIf
	if DriveStatus ("K:") <> 'NOTREADY' and  FileExists($K) Then
		$ruta = ($K)
	EndIf
	if DriveStatus ("L:") <> 'NOTREADY' and  FileExists($L) Then
		$ruta = ($L)
	EndIf
	if DriveStatus ("M:") <> 'NOTREADY' and  FileExists($M) Then
		$ruta = ($M)
	EndIf
	if DriveStatus ("N:") <> 'NOTREADY' and  FileExists($N) Then
		$ruta = ($N)
	EndIf
	if DriveStatus ("O:") <> 'NOTREADY' and  FileExists($O) Then
		$ruta = ($O)
	EndIf
	if DriveStatus ("P:") <> 'NOTREADY' and  FileExists($P) Then
		$ruta = ($P)
	EndIf
	if DriveStatus ("Q:") <> 'NOTREADY' and  FileExists($Q) Then
		$ruta = ($Q)
	EndIf
	Return($ruta)
EndFunc
Func Programas($ruta)
	shellexecute($ruta)
	WinWait('Programas y tutoriales')
EndFunc
Func DllSuite()
	ShellExecuteWait('AutoIt3.exe',"Dllsuite.au3", "DLL Suite v9.0.0.2259 Final")
EndFunc
Func Des_DllSuite()
	ShellExecuteWait('AutoIt3.exe',"DesDllsuite.au3", "DLL Suite v9.0.0.2259 Final")
EndFunc
Func Correr_DLL()
	ShellExecuteWait('AutoIt3.exe',"CorrDllsuite.au3", "DLL Suite v9.0.0.2259 Final")
EndFunc
Func Verificar()
	ShellExecuteWait('AutoIt3.exe',"Menuverificar.au3", "")
EndFunc
Func Ares()
	ShellExecuteWait('AutoIt3.exe',"ares.au3", "ares")
EndFunc
Func CDex()
	ShellExecuteWait('AutoIt3.exe',"cdex.au3", "CDex")
EndFunc
Func Skype()
	ShellExecuteWait('AutoIt3.exe',"skype.au3", "Skype")
EndFunc
Func DaemonToolsLite()
	ShellExecuteWait('AutoIt3.exe',"daemont.au3", "Daemon Tools lite")
EndFunc
Func Ra2YrMo()
	ShellExecuteWait('AutoIt3.exe',"Ra2full.au3", "Ra2yuriMO")
EndFunc
Func Ultraiso()
	ShellExecuteWait('AutoIt3.exe',"ultraiso.au3", "ultraiso")
EndFunc
Func DukeNukemMP()
	ShellExecuteWait('AutoIt3.exe',"Dukenmp.au3", "Duke Nukem MP")
EndFunc
Func Deluge()
	ShellExecuteWait('AutoIt3.exe',"Deluge.au3", "Deluge")
EndFunc
Func Nero_7()
	ShellExecuteWait('AutoIt3.exe',"nero7.au3", "Nero 7")
EndFunc
Func Mex_Motor_Mafia()
	ShellExecuteWait('AutoIt3.exe',"mex.au3", "mexican motor mafia")
EndFunc
Func Backupdrivers()
	ShellExecuteWait('AutoIt3.exe',"doubledriver.au3", "Double Driver OFFLINE MINIPE")
EndFunc
Func tamanobackup()
	if @OSVersion='WIN_XP' Then
		$Usuarios = @HomeDrive & '\Documents and Settings\'
	Elseif @OSVersion='WIN_7' Then
		$Usuarios = @HomeDrive&'\Users\'
	Else
		MsgBox(0,'','Falta codigo')
	EndIf
	FileDelete($Usuarios & 'Usuarios.txt')
	ShellExecuteWait('cmd',' /c cd '&$Usuarios&'&&'&@HomeDrive&'&&del Usuarios.txt&&dir /ad /b >>Usuarios.txt')

	While Not FileExists($Usuarios&'Usuarios.txt')
		Sleep(500)
	WEnd
	$handle=FileOpen($Usuarios&'Usuarios.txt')
	$tamatotal = 0
	$o= _FileCountLines ($Usuarios&'Usuarios.txt')
	For $i=1 to $o Step 1
		$Usuario = FileReadLine($Usuarios&'Usuarios.txt',$i)
		if $Usuario <> 'Default User' And $Usuario <> 'Default User' Then
			$tamatotal = $tamatotal + DirGetSize($Usuarios&$Usuario)
		EndIf
	Next
	FileClose($handle)
	FileDelete($handle)

$Usuario=0
	$o=0



	$Tamtotal = Round ( $tamatotal, 2 )
	If  $Tamtotal < 1024  then
		$Tamtotal = ($Tamtotal & ' Bytes')
	Else
		$Tamtotal = Round(($Tamtotal / 1024 ),2)
		If $Tamtotal > 1 and $Tamtotal < 1024  then
			$Tamtotal = ($Tamtotal & ' KB')
		Else
			$Tamtotal = Round(($Tamtotal / 1024 ),2)
			If $Tamtotal > 1 and $Tamtotal < 1024  then
				$Tamtotal = ($Tamtotal & ' MB')
			Else
				$Tamtotal = Round(($Tamtotal / 1024 ),2)
				If $Tamtotal > 1 and $Tamtotal < 1024  then
					$Tamtotal = ($Tamtotal & ' GB')
				Else
					$Tamtotal = Round(($Tamtotal / 1024 ),2)
					If $Tamtotal > 1 and $Tamtotal < 1024  then
						$Tamtotal = ($Tamtotal & ' TB')
					Else
						$Tamtotal = '> 1024 TB'
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf



	Return $Tamtotal
EndFunc

Func espaciodisco()

	$aData = _WinAPI_GetDiskFreeSpaceEx(ruta())

	;~ msgbox(0,'','Total available free space on ' & @HomeDrive & ' => ' & $aData[0] & ' bytes' & @CRLF)

	$Tamtotal = Round ( $aData[0], 2 )
	If  $Tamtotal < 1024  then
		$Tamtotal = ($Tamtotal & ' Bytes')
	Else
		$Tamtotal = Round(($Tamtotal / 1024 ),2)
		If $Tamtotal > 1 and $Tamtotal < 1024  then
			$Tamtotal = ($Tamtotal & ' KB')
		Else
			$Tamtotal = Round(($Tamtotal / 1024 ),2)
			If $Tamtotal > 1 and $Tamtotal < 1024  then
				$Tamtotal = ($Tamtotal & ' MB')
			Else
				$Tamtotal = Round(($Tamtotal / 1024 ),2)
				If $Tamtotal > 1 and $Tamtotal < 1024  then
					$Tamtotal = ($Tamtotal & ' GB')
				Else
					$Tamtotal = Round(($Tamtotal / 1024 ),2)
					If $Tamtotal > 1 and $Tamtotal < 1024  then
						$Tamtotal = ($Tamtotal & ' TB')
					Else
						$Tamtotal = '> 1024 TB'
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf



	Return $Tamtotal
EndFunc

Func Rest_Drivers()
	ShellExecuteWait('AutoIt3.exe',"Instbackup.au3", "DPInst")
EndFunc
Func Counter_Strike()
	ShellExecuteWait('AutoIt3.exe',"cs.au3", "Counter Strike")
EndFunc
Func Adblock()
	ShellExecuteWait('AutoIt3.exe',"adblock.au3", "chrome")
EndFunc
Func VcRedist()
	ShellExecuteWait('AutoIt3.exe',"VCRed.au3", "VC Redist")
EndFunc
Func GSpot()
	ShellExecuteWait('AutoIt3.exe',"Gspot.au3", "GSpot270a")
EndFunc
Func DamnNFO()
	ShellExecuteWait('AutoIt3.exe',"Damn.au3", "Damn NFO viewer")
EndFunc
Func Farm_Mania()
	ShellExecuteWait('AutoIt3.exe',"Farm.au3", "Farm Mania")
EndFunc
Func Farm_Mania_2()
	ShellExecuteWait('AutoIt3.exe',"Farm2.au3", "Farm Mania 2")
EndFunc
Func Farm_Mania_Hot_V()
	ShellExecuteWait('AutoIt3.exe',"FarmHot.au3", "Farm Mania Hot Vacation")
EndFunc
Func Plant_Vs_Zomb()
	ShellExecuteWait('AutoIt3.exe',"Planta.au3", "Plantas Contra Zombies")
EndFunc
Func Gen_Zero()
	ShellExecuteWait('AutoIt3.exe',"Generals.au3", "Generals + Zero Hour")
EndFunc
Func PaintNET()
	ShellExecuteWait('AutoIt3.exe',"PaintNET.au3", "PaintNET")
EndFunc
