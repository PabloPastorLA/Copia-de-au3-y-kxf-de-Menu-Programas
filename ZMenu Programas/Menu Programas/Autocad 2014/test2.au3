#include <IE.au3>
;MsgBox(0,'',ControlGetText('Licencias de Autodesk - Opciones de activación','','Button1'))
$oIE = _IEAttach ("Licencias de Autodesk - Opciones de activación", "embedded")
MsgBox(0,'',$oIE)

