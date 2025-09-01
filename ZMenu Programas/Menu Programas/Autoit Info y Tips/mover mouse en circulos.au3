HotKeySet("{ESC}", "_exit")

$centerX = @DesktopWidth / 2
$centerY = @DesktopHeight / 2
$radius = 30
$i = 0
While 1
    MouseMove($centerX + ($radius * Cos($i)), $centerY + ($radius * Sin($i)),0)
    $i += 0.05
    Sleep(10)
WEnd

Func _exit()
    Exit
EndFunc