#include <File.au3>
if @OSVersion <> "WIN_XP" then
	#RequireAdmin
EndIf
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Paquete',160,80,0,110)

if FileExists('Paquete\Limpiador de boludeces.exe') then ShellExecuteWait('Limpiador de boludeces.exe','','Paquete')
if FileExists(@WindowsDir&'\Paquete\Limpiador de boludeces.exe') then ShellExecuteWait('Limpiador de boludeces.exe','',@WindowsDir&'\Paquete')

If 1 then ;(DirGetSize('Paquete') <> DirGetSize(@WindowsDir&'\Paquete')) or not FileExists(@SystemDir&'\Paq.exe') Then
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	Paquete"&@CRLF)


	Do
		processclose('paque.exe')
	Until not ProcessExists('paque.exe')

	Do
		if not FileExists('Paquete\Limpiador de boludeces.exe') then MsgBox(0,'Paq','Falta compilar Limpiador de boludeces.exe'&@CRLF&'Compilar y darle a continuar, o crear rar y extraer')
	Until FileExists('Paquete\Limpiador de boludeces.exe')

	FileCopy('Paquete\Limpiador de boludeces.exe',@WindowsDir&'\Paquete\Limpiador de boludeces.exe',9)

	ShellExecuteWait('Limpiador de boludeces.exe','','Paquete')
	ShellExecuteWait('Limpiador de boludeces.exe','',@WindowsDir&'\Paquete')


	;Listo contenido de carpeta Paquete
	local $archivos=_FileListToArray('Paquete','*')
	for $i=1 to UBound($archivos)-1
		$archivos[$i]='Paquete\'&$archivos[$i]
	Next

	;recorro contenido de carpeta Paquete y actuo en concecuencia
	for $i=1 to UBound($archivos)-1
		;si es directorio
;~ 		MsgBox(0,'',FileGetAttrib($archivos[$i]))
;~ 		MsgBox(0,'',($archivos[$i]))
;~ 		MsgBox(0,'',(@ScriptDir&'\'&$archivos[$i]))
;~ 		MsgBox(0,'',FileGetAttrib(@ScriptDir&'\'&$archivos[$i]))

		if StringInStr(FileGetAttrib($archivos[$i]),'D') then
;		if FileGetAttrib($archivos[$i]) = 'D' or FileGetAttrib($archivos[$i]) = 'AD' then
			$dirpaq=_FileListToArray($archivos[$i],'*')
			$dirwin=_FileListToArray(@WindowsDir&'\'&$archivos[$i],'*')

			if (DirGetSize($archivos[$i]) <> DirGetSize(@WindowsDir&'\'&$archivos[$i]))   or   ($dirpaq[0] <> $dirwin[0]) Then
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Paquete'&@crlf&StringTrimLeft($archivos[$i],8),160,80,0,110)
;~ MsgBox(0,'','diff en: '&$archivos[$i])
				Do
					if 0=DirRemove(@WindowsDir&'\'&$archivos[$i],1) and FileExists(@WindowsDir&'\'&$archivos[$i]) then MsgBox(0,'Paquete','No se puede remover: '&$archivos[$i])

				until not FileExists(@WindowsDir&'\'&$archivos[$i])
				DirCopy($archivos[$i],@WindowsDir&'\'&$archivos[$i],1)
			EndIf
		EndIf

		SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Paquete',160,80,0,110)

		;si es archivo
		if FileGetAttrib($archivos[$i]) = 'A' then

;~ MsgBox(0,'','diff en: '&$archivos[$i]
SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. Paquete'&@crlf&StringTrimLeft($archivos[$i],8),160,80,0,110)
			Do
				FileDelete(@WindowsDir&'\'&$archivos[$i])
			Until not FileExists(@WindowsDir&'\'&$archivos[$i])

			FileCopy($archivos[$i],@WindowsDir&'\'&$archivos[$i],9)
		EndIf

	Next


;~ 	While FileExists(@WindowsDir&'\Paquete')
;~ 		ProcessClose('Paque.exe')
;~ 		DirRemove(@WindowsDir&'\Paquete',1)
;~ 	WEnd
;~ 	While not FileExists(@WindowsDir&'\Paquete')
;~ 		DirCopy('Paquete',@WindowsDir&'\Paquete',1)
;~ 	WEnd


	while FileExists(@WindowsDir&'\Paq.exe') or FileExists('copiar.bat')
		FileDelete(@WindowsDir&'\Paq.exe')
;		FileDelete('copiar.bat')
;		MsgBox(0,'','1')
	WEnd
	while not FileExists(@WindowsDir&'\Paq.exe')
		FileCopy('paq.exe',@WindowsDir&'\Paq.exe',9)
;		MsgBox(0,'','2')
	WEnd



;FileWrite('copiar.bat','copy paq.exe '&@WindowsDir&'\System32\Paq.exe')
;ShellExecuteWait('cmd',' /K copiar.bat')

;MsgBox(0,'','ver')




	while FileExists('copiar.bat')
		FileDelete('copiar.bat')
	WEnd



	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	Paquete"&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt","Paquete"&@CRLF)
EndIf

