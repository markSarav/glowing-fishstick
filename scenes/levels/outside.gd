extends LevelParent

func _on_gate_player_entered_body():
	var tween = create_tween()
	tween.tween_property($Player,"speed",0,.5)
	get_tree().call_deferred("change_scene_to_file","res://scenes/levels/inside.tscn")

func _on_gate_player_exited_body():
	pass # Replace with function body.

