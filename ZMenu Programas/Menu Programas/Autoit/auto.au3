#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****


SplashTextOn('Espera','Autoit ' & @crlf & 'Instalandose',160,80,0,110)


;Nombre para mostrar con splash
$NombrePrograma1='Autoit'
$NombrePrograma2='Scite'



If FileExists("autoit-v3-setup.exe") AND not FileExists (@ProgramFilesDir & "\AutoIt3\AutoIt3.exe") and not FileExists (@ProgramFilesDir & " (x86)\AutoIt3\AutoIt3.exe") Then
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. '&$NombrePrograma1,160,80,0,110)
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	"&$NombrePrograma1&@CRLF)
	ShellExecuteWait('autoit-v3-setup.exe',' /S')

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	"&$NombrePrograma1&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt",$NombrePrograma1&@CRLF)
EndIf

If FileExists("SciTE4AutoIt3.exe") AND not FileExists (@ProgramFilesDir & "\AutoIt3\SciTE-AutoIt3Installer\SciTE.exe") AND not FileExists (@ProgramFilesDir & " (x86)\AutoIt3\SciTE-AutoIt3Installer\SciTE.exe") Then
	SplashTextOn('Espera','Autoit corriendo ' & @crlf & 'Inst. '&$NombrePrograma2,160,80,0,110)
	FileWrite(@DesktopDir & "\Bien Instalado.txt","Empecé a instalar:	"&$NombrePrograma2&@CRLF)
	ShellExecuteWait('SciTE4AutoIt3.exe',' /S')

	FileWrite(@DesktopDir & "\Bien Instalado.txt","Terminé de instal:	"&$NombrePrograma2&@CRLF)
else
	FileWrite(@DesktopDir & "\Mal Instalado.txt",$NombrePrograma2&@CRLF)
EndIf


; --- Cambiar run x edit
RegWrite('HKEY_CLASSES_ROOT\AutoIt3Script\Shell','',"REG_SZ",'Edit')
;-------------

; --- Requerir admin al ejecutar
;~ RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',@ProgramFilesDir & ' (x86)\AutoIt3\AutoIt3.exe',"REG_SZ",'RUNASADMIN')
;~ RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',@ProgramFilesDir & ' (x86)\AutoIt3\AutoIt3_x64.exe',"REG_SZ",'RUNASADMIN')
;~ RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',@ProgramFilesDir & ' (x86)\AutoIt3\SciTE\SciTE.exe',"REG_SZ",'RUNASADMIN')
;~ RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',@ProgramFilesDir & ' (x86)\AutoIt3\SciTE-AutoIt3Installer\SciTE.exe',"REG_SZ",'RUNASADMIN')


;~ RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',@ProgramFilesDir & '\AutoIt3\AutoIt3.exe',"REG_SZ",'RUNASADMIN')
;~ RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',@ProgramFilesDir & '\AutoIt3\AutoIt3_x64.exe',"REG_SZ",'RUNASADMIN')
;~ RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',@ProgramFilesDir & '\AutoIt3\SciTE\SciTE.exe',"REG_SZ",'RUNASADMIN')
;~ RegWrite('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',@ProgramFilesDir & '\AutoIt3\SciTE-AutoIt3Installer\SciTE.exe',"REG_SZ",'RUNASADMIN')

;-------------


;1-->@ProgramFilesDir & '\AutoIt3\AutoIt3.exe'
;2-->@ProgramFilesDir & '\AutoIt3\AutoIt3_x64.exe'
;3-->@ProgramFilesDir & '\AutoIt3\SciTE\SciTE.exe'
;4-->@ProgramFilesDir & '\AutoIt3\SciTE-AutoIt3Installer\SciTE.exe'




correradministrador1()
correradministrador2()
correradministrador3()
correradministrador4()

Func correradministrador1()
	$archx86=@ProgramFilesDir & ' (x86)\AutoIt3\AutoIt3.exe'
	$archx64=@ProgramFilesDir & '\AutoIt3\AutoIt3.exe'
	$valor='RUNASADMIN'

	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx86,'REG_SZ',$valor)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx86,'REG_SZ',$valor)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx86,'REG_SZ',$valor)
	RegWrite('HKEY_USERS\S-1-5-21-564399470-3371897521-3215954588-1000\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx86,'REG_SZ',$valor)

	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx64,'REG_SZ',$valor)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx64,'REG_SZ',$valor)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx64,'REG_SZ',$valor)
	RegWrite('HKEY_USERS\S-1-5-21-564399470-3371897521-3215954588-1000\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx64,'REG_SZ',$valor)
EndFunc

Func correradministrador2()
	$archx86=@ProgramFilesDir & ' (x86)\AutoIt3\AutoIt3_x64.exe'
	$archx64=@ProgramFilesDir & '\AutoIt3\AutoIt3_x64.exe'
	$valor='RUNASADMIN'

	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx86,'REG_SZ',$valor)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx86,'REG_SZ',$valor)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx86,'REG_SZ',$valor)
	RegWrite('HKEY_USERS\S-1-5-21-564399470-3371897521-3215954588-1000\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx86,'REG_SZ',$valor)

	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx64,'REG_SZ',$valor)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx64,'REG_SZ',$valor)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx64,'REG_SZ',$valor)
	RegWrite('HKEY_USERS\S-1-5-21-564399470-3371897521-3215954588-1000\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx64,'REG_SZ',$valor)
EndFunc

Func correradministrador3()
	$archx86=@ProgramFilesDir & ' (x86)\AutoIt3\SciTE\SciTE.exe'
	$archx64=@ProgramFilesDir & '\AutoIt3\SciTE\SciTE.exe'
	$valor='RUNASADMIN'

	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx86,'REG_SZ',$valor)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx86,'REG_SZ',$valor)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx86,'REG_SZ',$valor)
	RegWrite('HKEY_USERS\S-1-5-21-564399470-3371897521-3215954588-1000\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx86,'REG_SZ',$valor)

	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx64,'REG_SZ',$valor)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx64,'REG_SZ',$valor)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx64,'REG_SZ',$valor)
	RegWrite('HKEY_USERS\S-1-5-21-564399470-3371897521-3215954588-1000\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx64,'REG_SZ',$valor)
EndFunc

Func correradministrador4()
	$archx86=@ProgramFilesDir & ' (x86)\AutoIt3\SciTE-AutoIt3Installer\SciTE.exe'
	$archx64=@ProgramFilesDir & '\AutoIt3\SciTE-AutoIt3Installer\SciTE.exe'
	$valor='RUNASADMIN'

	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx86,'REG_SZ',$valor)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx86,'REG_SZ',$valor)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx86,'REG_SZ',$valor)
	RegWrite('HKEY_USERS\S-1-5-21-564399470-3371897521-3215954588-1000\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx86,'REG_SZ',$valor)

	RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx64,'REG_SZ',$valor)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx64,'REG_SZ',$valor)
	RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx64,'REG_SZ',$valor)
	RegWrite('HKEY_USERS\S-1-5-21-564399470-3371897521-3215954588-1000\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers',$archx64,'REG_SZ',$valor)
EndFunc