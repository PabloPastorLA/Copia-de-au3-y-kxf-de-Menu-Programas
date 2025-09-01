	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	G5"&@CRLF)

;desactivar suspension menu apagar
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab',"ACSettingIndex",'REG_DWORD',0)
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab',"DCSettingIndex",'REG_DWORD',0)

;desactivar hibernar menu apagar
ShellExecuteWait('cmd.exe',' /C powercfg -h off','','',@SW_HIDE)

;desactivar suspension y cambiar suspension por hibernar en boton enc, boton susp y pantalla
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\7648EFA3-DD9C-4E3E-B566-50F929386280',"ACSettingIndex",'REG_DWORD',3)
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\7648EFA3-DD9C-4E3E-B566-50F929386280',"DCSettingIndex",'REG_DWORD',3)

RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\5CA83367-6E45-459F-A27B-476B1D01C936',"ACSettingIndex",'REG_DWORD',0)
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\5CA83367-6E45-459F-A27B-476B1D01C936',"DCSettingIndex",'REG_DWORD',0)

RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\96996BC0-AD50-47EC-923B-6F41874DD9EB',"ACSettingIndex",'REG_DWORD',0)
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\96996BC0-AD50-47EC-923B-6F41874DD9EB',"DCSettingIndex",'REG_DWORD',0)


;suspender/hibernar tras: nunca
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\29F6C1DB-86DA-48C5-9FDB-F2B67B1F44DA',"ACSettingIndex",'REG_DWORD',0)
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\29F6C1DB-86DA-48C5-9FDB-F2B67B1F44DA',"DCSettingIndex",'REG_DWORD',0)

RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\9D7815A6-7EE4-497E-8888-515A05F02364',"ACSettingIndex",'REG_DWORD',0)
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\9D7815A6-7EE4-497E-8888-515A05F02364',"DCSettingIndex",'REG_DWORD',0)

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	G5"&@CRLF)
