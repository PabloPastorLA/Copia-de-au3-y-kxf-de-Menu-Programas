robocopy .\ ".\ZMenu Programas\Menu Programas" *.au3 *.kxf "ZCOPIAR AU3 y KXF a ZMENU(TARDA).bat" "falta.txt" "SYSPREP.txt" /XD "ZMenu Programas" /MIR

7z u "Menu Programas.7z" ".\ZMenu Programas\Menu Programas\"

::despues de esto agregar directorios para borrar algo como    rmdir ".\ZMENU AU3\ZMENU AU3\"