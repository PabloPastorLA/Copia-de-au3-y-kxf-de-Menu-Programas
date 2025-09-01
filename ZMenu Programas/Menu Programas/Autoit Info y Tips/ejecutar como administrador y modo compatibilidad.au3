

Global $archx86=@ProgramFilesDir & ' (x86)\Counter-Strike\hl.exe'
Global $archx64=@ProgramFilesDir & '\Counter-Strike\hl.exe'
correradministrador()

Func correradministrador()
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