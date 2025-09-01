SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst Driv Energ G4',160,80,0,110)
if @OSVersion <> "WIN_XP" Then
	#RequireAdmin
EndIf


FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Energ G4"&@CRLF)

;OPCIONES ENERGIA G4
;desactivar suspension menu apagar
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab',"ACSettingIndex",'REG_DWORD',0)
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab',"DCSettingIndex",'REG_DWORD',0)


;desactivar suspension y cambiar suspension por hibernar en boton enc, boton susp y pantalla
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\7648EFA3-DD9C-4E3E-B566-50F929386280',"ACSettingIndex",'REG_DWORD',2)
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\7648EFA3-DD9C-4E3E-B566-50F929386280',"DCSettingIndex",'REG_DWORD',2)

RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\5CA83367-6E45-459F-A27B-476B1D01C936',"ACSettingIndex",'REG_DWORD',0)
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\5CA83367-6E45-459F-A27B-476B1D01C936',"DCSettingIndex",'REG_DWORD',0)

RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\96996BC0-AD50-47EC-923B-6F41874DD9EB',"ACSettingIndex",'REG_DWORD',0)
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\96996BC0-AD50-47EC-923B-6F41874DD9EB',"DCSettingIndex",'REG_DWORD',0)

FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Energ G4"&@CRLF)





FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Drivers G4"&@CRLF)

if @OSArch = "X86" Then
	ShellExecuteWait('dpinst.exe',' /q')
Else
	ShellExecuteWait('dpinst64.exe',' /q')
EndIf

FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Drivers G4"&@CRLF)



