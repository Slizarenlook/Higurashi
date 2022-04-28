func _input(event):
    var i = 0
    for i in range(0,3):
        match i:
            1:
                if event.is_pressed("ui_accept):
                    return true
            else:
                return false
