

;RegWrite('HKEY_CLASSES_ROOT\Directory\Background\shell\Remove Empty Directory\Command','','REG_SZ','"'&@WorkingDir&'\RED2.exe" %V')
RegDelete('HKEY_CLASSES_ROOT\Directory\Background\shell\Remove Empty Directory')
RegDelete('HKEY_CLASSES_ROOT\Directory\shell\Remove Empty Directory')




