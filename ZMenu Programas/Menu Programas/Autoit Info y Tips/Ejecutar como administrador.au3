$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)




$archx86=$ProgramFilesDir & ' (x86)\AutoIt3\AutoIt3.exe'
$archx64=$ProgramFilesDir & '\AutoIt3\AutoIt3.exe'
EjecutarComoAdministrador($archx86,$archx64)

Func EjecutarComoAdministrador($archx86,$archx64)
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
