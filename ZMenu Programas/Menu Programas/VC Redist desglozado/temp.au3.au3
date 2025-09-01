	$1=dirCopy("vcredist_x86",@WindowsDir & '\vcredist_x86',1)

	ShellExecute('msiexec.exe',' /i "'&@WindowsDir & '\vcredist_x86\vc_red.msi" /qb')
