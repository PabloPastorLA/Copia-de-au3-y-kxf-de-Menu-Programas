$defnav1=''
$defnav2=''
cambiar_navegador()


;~ aca va el resto


volver_navegador()


func cambiar_navegador()
;	-	Navegador default	-	-------------------------------------------------------------------------------------------------------
RegWrite('HKEY_CLASSES_ROOT\MIO\shell\open\command','','REG_SZ','"' & @SystemDir & '\calc.exe"');											---
$defnav1=RegRead('HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice','Progid');		---
$defnav2=RegRead('HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice','Progid');		---
RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice','Progid','REG_SZ','MIO');---
RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice','Progid','REG_SZ','MIO');--
;	-	Navegador default	-	-------------------------------------------------------------------------------------------------------
EndFunc

func volver_navegador()
;	-	Navegador default	-	----------------------------------------------------------------------------------------------------------
RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice','Progid','REG_SZ',$defnav1);---
RegWrite('HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice','Progid','REG_SZ',$defnav2);--
while ProcessExists('calc.exe')
	ProcessClose('calc.exe')
WEnd
;	-	Navegador default	-	----------------------------------------------------------------------------------------------------------
EndFunc