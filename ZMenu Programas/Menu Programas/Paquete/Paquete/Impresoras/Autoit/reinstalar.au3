#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=0
#AutoIt3Wrapper_Compile_Both=n
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

SplashTextOn('Espera','Autoit ' & @crlf & 'Re Instalandose',160,80,0,110)


;--------------				DESINSTALAR SCITE Y AUTOIT		-----------------------

ShellExecuteWait('desinstalar.exe')

if @OSArch='X86' then ShellExecuteWait('auto.exe')
if @OSArch<>'X86' then ShellExecuteWait('auto_x64.exe')

;-----------------------------------------------------------------------------------













