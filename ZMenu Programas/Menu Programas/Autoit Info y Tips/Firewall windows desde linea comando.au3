

;EJEMPLO COMPLETO PARA BLOQUEAR, REQUIERE ADMIN

#RequireAdmin
ShellExecuteWait('cmd',' /c netsh advfirewall firewall add rule name="Autocad2014" dir=in action=block program="'&$programfilesdir&'\Autodesk\AutoCAD 2014\acad.exe" enable=yes','','',@SW_HIDE)
ShellExecuteWait('cmd',' /c netsh advfirewall firewall add rule name="Autocad2014" dir=in action=block program="'&$programfilesdir&' (x86)\Autodesk\AutoCAD 2014\acad.exe" enable=yes','','',@SW_HIDE)
ShellExecuteWait('cmd',' /c netsh advfirewall firewall add rule name="Autocad2014" dir=out action=block program="'&$programfilesdir&'\Autodesk\AutoCAD 2014\acad.exe" enable=yes','','',@SW_HIDE)
ShellExecuteWait('cmd',' /c netsh advfirewall firewall add rule name="Autocad2014" dir=out action=block program="'&$programfilesdir&' (x86)\Autodesk\AutoCAD 2014\acad.exe" enable=yes','','',@SW_HIDE)


;EJEMPLO COMPLETO PARA PERMITIR, REQUIERE ADMIN
#RequireAdmin
ShellExecuteWait('cmd',' /c netsh advfirewall firewall add rule name="Autocad2014" dir=in action=allow program="'&$programfilesdir&'\Autodesk\AutoCAD 2014\acad.exe" enable=yes','','',@SW_HIDE)
ShellExecuteWait('cmd',' /c netsh advfirewall firewall add rule name="Autocad2014" dir=in action=allow program="'&$programfilesdir&' (x86)\Autodesk\AutoCAD 2014\acad.exe" enable=yes','','',@SW_HIDE)
ShellExecuteWait('cmd',' /c netsh advfirewall firewall add rule name="Autocad2014" dir=out action=allow program="'&$programfilesdir&'\Autodesk\AutoCAD 2014\acad.exe" enable=yes','','',@SW_HIDE)
ShellExecuteWait('cmd',' /c netsh advfirewall firewall add rule name="Autocad2014" dir=out action=allow program="'&$programfilesdir&' (x86)\Autodesk\AutoCAD 2014\acad.exe" enable=yes','','',@SW_HIDE)


;~ permitir:

;~ netsh advfirewall firewall add rule name="Secure App" dir=in action=allow program="C:\Program Files\SecureApp.exe" enable=yes

;~ bloquear:

;~ netsh advfirewall firewall add rule name="Secure App" dir=in action=block program="C:\Program Files\SecureApp.exe" enable=yes





