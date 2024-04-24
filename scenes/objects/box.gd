extends generic_item_container


func hit():
	if not opened:
		$LidSprite.hide()
		opened = true
		for i in range(5):
			var pos = $SpawnPositions.get_child(randi()%$SpawnPositions.get_child_count()).global_position
			open.emit(pos, current_direction)


