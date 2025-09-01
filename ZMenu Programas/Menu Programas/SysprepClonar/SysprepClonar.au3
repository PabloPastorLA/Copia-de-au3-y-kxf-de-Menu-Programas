#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
;#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
SplashTextOn('Sysprepeando windows','Estamos corriendo sysprep.'&@CRLF&'Cuando se apague va a estar lista para Clonar',400,60,10,10)


$ProgramFilesDir=@ProgramFilesDir
if StringRight($ProgramFilesDir,6)=' (x86)' then $ProgramFilesDir=StringTrimRight($ProgramFilesDir,6)


if FileExists($ProgramFilesDir&'\MenuInstalado\Sysprepped') then
	MsgBox(0,'Sysprep','Este sistema ya fue syspreppeado. Cerrando')
	Exit
EndIf


if StringLeft(@HomeDrive,2)<> StringLeft(@ScriptDir,2) Then
	if 7 = MsgBox(4,'','Sysprep debe correr desde escritorio.'&@CRLF&'Copiar y lanzar desde ahi?'&@CRLF&'Ojo, lo vas a ver como si fuera este script, pero es el del escritorio.') Then
		Exit
	Else ; COPIAR A ESCRITORIO Y EJECUTAR DESDE AHí
;~ 		do
;~ 			ProcessClose('scite.exe')
;~ 		until not ProcessExists('scite.exe')

		$nombre = StringMid(@ScriptDir,StringInStr(@ScriptDir,'\',0,-1) + 1)
		DirCopy(@scriptdir,@DesktopDir& '\' & $nombre,1)
		If @OSArch = 'X86' Then ShellExecute('AutoIt3.exe', @ScriptName, @DesktopDir& '\' & $nombre)
		If @OSArch = 'X64' Then ShellExecute('AutoIt3_x64.exe', @ScriptName, @DesktopDir& '\' & $nombre)
		Exit
	EndIf
EndIf




ChequearExisteDisco()
if ProcessExists('DontSleep_x64.exe') or ProcessExists('DontSleep.exe') then CERRARDontSleep()


if @OSVersion='WIN_XP' then
	DirCopy('SysprepXP',@HomeDrive&'\Sysprep',1)
;~ 	ShellExecute(@HomeDrive&'\Sysprep\setupmgr.exe')									;CONFIGURAR
;~ 	C:\Sysprep\sysprep -pnp -reseal -mini -shutdown										;EJECUTAR
	ShellExecute('sysprep.exe',' -pnp -reseal -mini -shutdown',@HomeDrive&'\Sysprep')	;EJECUTAR
	Exit
EndIf


if @OSVersion<>'WIN_XP' then
	$sysprep=@SystemDir&'\Sysprep\sysprep.exe'
	$deploy=@ScriptDir&'\deploy'&@OSVersion&'.xml'
	if @OSArch='x86' then $deployUNIV=@ScriptDir&'\deployx86.xml'
	if @OSArch='x64' then $deployUNIV=@ScriptDir&'\deployx64.xml'
;FUNCIONA EN W7 32	$parametro=' /oobe /generalize /unattend:'&$deployUNIV
	$parametro=' /oobe /generalize /unattend:"'&$deployUNIV&'"'
	if Not FileExists($sysprep) Then
		MsgBox(0,'ERROR Sysprep','No encontré sysprep.exe. Cerrando')
		MsgBox(0,'','$sysprep= '&$sysprep)
		Exit
	ElseIf not FileExists($deployUNIV) Then
		MsgBox(0,'ERROR deploy','No encontré deploy'&@OSVersion&'.xml. Cerrando')
		Exit
	Else

;	MsgBox(0,'','aca')
		filewrite(@DesktopCommonDir&'\Syspreped.txt','')
		filewrite(@DesktopDir&'\Syspreped.txt','')
		ShellExecute($sysprep,$parametro)
;		MsgBox(0,'',$sysprep&' '&$parametro)
	EndIf
EndIf


DirCreate($ProgramFilesDir&'\MenuInstalado')
FileWrite($ProgramFilesDir&'\MenuInstalado\Sysprepped','')


MsgBox(0,'Sysprepeando windows','Cuando se apague va a estar lista para Clonar.'&@CRLF&'Mientras cerrá todo.',3)





func CERRARDontSleep()
	SplashTextOn('Espera','Sysprep' & @crlf & 'Cerrando Dont Sleep',160,80,0,110)
	Do
		ProcessClose('DontSleep.exe')
		ProcessClose('DontSleep_x64.exe')
	until not ProcessExists('DontSleep_x64.exe') and not ProcessExists('DontSleep.exe')
	SplashTextOn('Sysprepeando windows','Estamos corriendo sysprep.'&@CRLF&'Cuando se apague va a estar lista para Clonar',400,60,10,10)
EndFunc







Func ChequearExisteDisco()
	$unidad=DriveGetDrive($DT_ALL)

	if $unidad[0]>=1 then MsgBox(0,'Sysprep','Retire los dispositivos antes de continuar.'&@CRLF&'Ya los retiró?. Continúo')
;~ 	For $i = 1 To $unidad[0]
;~         ; Show all the drives found and convert the drive letter to uppercase.
;~         MsgBox($MB_SYSTEMMODAL, "", "Drive " & $i & "/" & $unidad[0] & ":" & @CRLF & StringUpper($unidad[$i]))
;~     Next


EndFunc
