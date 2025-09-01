$dir='"%V"'

RegWrite('HKEY_CLASSES_ROOT\Directory\Background\shell\Remove Empty Directory\Command','','REG_SZ','"'&@WorkingDir&'\RED2.exe" '&$dir)
RegWrite('HKEY_CLASSES_ROOT\Directory\shell\Remove Empty Directory\Command','','REG_SZ','"'&@WorkingDir&'\RED2.exe" '&$dir)
;RegWrite('HKEY_CLASSES_ROOT\*\shell\Remove Empty Directory\Command','','REG_SZ','"'&@WorkingDir&'\RED2.exe" %V')
;~ RegWrite('HKEY_CLASSES_ROOT\*\shell\Remove Empty Directory\Command','','REG_SZ','"'&@WorkingDir&'\RED2.exe" %V')
;"C:\1\Programas y tutoriales\red-v2.2-portable\red2.exe" %V




