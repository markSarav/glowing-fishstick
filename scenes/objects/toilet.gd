extends generic_item_container

func hit():
	if not opened:
		$LidSprite.hide()
		opened = true
		var pos = $SpawnPositions/Marker2D.global_position
		open.emit(pos,current_direction)
