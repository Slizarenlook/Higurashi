#1var tested: fail
    rcst2.cast_to = facing.x
    if rcst2.colliding:
        block = true
    else:
        block = fals
#2var non-tested
    func _process(delta):
        move_and_collide(speed*facing)
        if collision = true:
            block(facingdir)
    func block(event):
        if event != null
            return null
        else return event
#3var tested: fail
    border = Vector2(x,y)
    func _process(delta):
        var collide  = move_and_collide(pos*speed)
        if collide: 
            border = border.bounce(collide.normal)
            print(border)

#4var tested: fail
    func _input(event)
        match(event):
            "ui-right":
                if not(blockr):
                     pos.x += speed
                     rcst2.cast_to = pos.x+1
                     activer = True
            "ui-left":
                pos.x -= speed
                rcst2.cast_to = pos.x+1
            "ui-up":
                pos.y += speed
                rcst2.cast_to = pos.y+1
            "ui-down"
                pos.y -= speed
                rcst2.cast_to = pos.y+1
    func process(delta)
        if rcst2.colliding:
            block
        move_and_collide(pos.normilize*delta)

#5var 
    func _input(event)
        if pos == position.floor()
            pos_stop = true
        else:
            pos_stop = false
            pos = position.floor()
