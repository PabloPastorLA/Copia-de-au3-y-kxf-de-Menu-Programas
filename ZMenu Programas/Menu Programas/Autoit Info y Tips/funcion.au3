

$val = 10  
For $i = 1 To 10
     $doubled = MyDouble($val)
     MsgBox(0, "", $val & " doubled is " & $doubled)
     $val = $doubled
Next

Exit


Func MyDouble($value)
     $value = $value * 2
     Return $value
EndFunc

